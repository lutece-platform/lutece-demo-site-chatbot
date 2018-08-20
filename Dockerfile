FROM debian:stretch as builder

# define the fully qualified artifact of the site
ARG site=site-chatbot-1.0.0-SNAPSHOT


# install needed apps
RUN echo 'mysql-server mysql-server/root_password password motdepasse' | debconf-set-selections && \
    echo 'mysql-server mysql-server/root_password_again password motdepasse' | debconf-set-selections && \
    apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y mysql-server mysql-client default-jdk ant maven --no-install-recommends


# build the site and assemble the webapp
WORKDIR /app
ADD pom.xml /app/pom.xml
ADD src /app/src
ADD webapp /app/webapp
RUN mvn lutece:site-assembly
RUN mv /app/target/${site}/ /app/target/webapp

# change default database host
WORKDIR /app/target/webapp/WEB-INF/conf
RUN  sed -i 's/root/admin/' db.properties


# run the database initialization script
WORKDIR /app/target/webapp/WEB-INF/sql
RUN  /etc/init.d/mysql start && \
    sleep 5s && \
    mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'motdepasse'; GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';FLUSH PRIVILEGES;CREATE DATABASE lutece" && \
    sleep 5s && \
    ant && sleep 5s


# change default database host
WORKDIR /app/target/webapp/WEB-INF/conf
RUN  sed -i 's/localhost/lutece-mysql/' db.properties

# create a mariadb image (used by docker-compose)
FROM mariadb:10.1 as lutece-mysql
COPY --from=builder /var/lib/mysql /var/lib/mysql

# create a tomcat image (used by docker-compose)
FROM tomcat:latest as lutece-tomcat
COPY --from=builder /app/target/webapp /usr/local/tomcat/webapps/chatbot


