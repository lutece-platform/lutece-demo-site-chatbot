
-- override default accounts
TRUNCATE TABLE core_admin_user;
INSERT INTO core_admin_user VALUES (1,'admin','Admin','admin','admin@lutece.fr',0,'PLAINTEXT:chatbot','fr',0,0,0,'2020-01-01 00:00:00',null,0,'1980-01-01 00:00:00','all');


-- override site properties
REPLACE INTO core_datastore VALUES ('portal.site.site_property.name', 'chatbot');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.meta.author', 'chatbot team');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.meta.copyright', 'Copyright &copyright; City of Paris');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.meta.description', '<description>');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.meta.keywords', '<keywords>');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.email', 'lutece-dev@paris.fr');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.noreply_email', 'no-reply@paris.fr');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.home_url', 'jsp/site/Portal.jsp?page=chatbot');

-- override plugin status
REPLACE INTO core_datastore VALUES ('core.plugins.status.html.installed' ,'truel' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.html.pool' ,'portal' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.chatbot.installed' ,'true' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.chatbot.pool' ,'portal' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.easyrulesbot.installed' ,'true' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.easyrulesbot.pool' ,'portal' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.easyrulesbot-sitebuilder.installed' ,'true' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.easyrulesbot-sitebuilder.pool' ,'portal' );

 