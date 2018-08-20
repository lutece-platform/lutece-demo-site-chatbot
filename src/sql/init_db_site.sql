
-- override default accounts
TRUNCATE TABLE core_admin_user;
INSERT INTO core_admin_user VALUES (1,'admin','Admin','admin','admin@lutece.fr',0,'PLAINTEXT:chatbot','fr',0,0,0,'2020-01-01 00:00:00',null,0,'1980-01-01 00:00:00','all');


-- override site properties
REPLACE INTO core_datastore VALUES ('portal.site.site_property.name', 'chatbot');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.meta.author', 'chatbot team');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.meta.copyright', 'Copyright &copyright; Energissimo');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.meta.description', '<description>');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.meta.keywords', '<keywords>');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.email', 'contact@energissimo.eu');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.noreply_email', 'no-reply@energissimo.eu');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.home_url', 'jsp/site/Portal.jsp?page=chatbot');

-- override plugin status
REPLACE INTO core_datastore VALUES ('core.plugins.status.html.installed' ,'truel' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.html.pool' ,'portal' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.energissimo.installed' ,'true' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.energissimo.pool' ,'portal' );
