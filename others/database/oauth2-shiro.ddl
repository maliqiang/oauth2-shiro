-- ###############
--    create database , if need create, cancel the comment
-- ###############
-- create database if not exists oauth2_shiro default character set utf8;
-- use oauth2_shiro set default character = utf8;

-- ###############
--    grant privileges  to oshiro/oshiro
-- ###############
-- GRANT ALL PRIVILEGES ON oauth2_shiro.* TO oshiro@localhost IDENTIFIED BY "oshiro";


-- ###############
-- JdbcRealm  use them
-- MYSQL DB
-- ###############
-- users
Drop table  if exists users;
CREATE TABLE users (
  id int(11) NOT NULL auto_increment,
  guid varchar(255) not null unique,
  create_time datetime ,
  archived tinyint(1) default '0',
  version int(11) DEFAULT 0,
  password varchar(255) not null,
  username varchar(255) not null unique,
  default_user tinyint(1) default '0',
  last_login_time datetime ,
  PRIMARY KEY  (id),
  INDEX username_index (username)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- roles
Drop table  if exists roles;
CREATE TABLE roles (
  id int(11) NOT NULL auto_increment,
  guid varchar(255) not null unique,
  create_time datetime ,
  archived tinyint(1) default '0',
  version int(11) DEFAULT 0,
  role_name varchar(255) not null,
  PRIMARY KEY  (id)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- user role
Drop table  if exists user_roles;
CREATE TABLE user_roles (
  users_id int(11) not null,
  roles_id int(11) not null,
  INDEX users_id_index (users_id),
  INDEX roles_id_index (roles_id)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- roles_permissions
Drop table  if exists roles_permissions;
CREATE TABLE roles_permissions (
  roles_id int(11) not null,
  permission varchar(255) not null,
  INDEX roles_id_index (roles_id)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;


--
--  Oauth sql  -- MYSQL
--

Drop table  if exists oauth_client_details;
create table oauth_client_details (
  client_id VARCHAR(255) PRIMARY KEY,
  client_secret VARCHAR(256),
  client_name VARCHAR(256),
  client_uri VARCHAR(256),
  client_icon_uri VARCHAR(256),
  resource_ids VARCHAR(256),
  scope VARCHAR(256),
  grant_types VARCHAR(256),
  redirect_uri VARCHAR(256),
  roles VARCHAR(256),
  access_token_validity INTEGER default -1,
  refresh_token_validity INTEGER default -1,
  description VARCHAR(4096),
  create_time timestamp default now(),
  archived tinyint(1) default '0',
  trusted tinyint(1) default '0'
);

Drop table  if exists oauth_access_token;
create table oauth_access_token (
  create_time timestamp default now(),
  token_id VARCHAR(256),
  token BLOB,
  authentication_id VARCHAR(256),
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication BLOB,
  refresh_token VARCHAR(256)
);

Drop table  if exists oauth_refresh_token;
create table oauth_refresh_token (
  create_time timestamp default now(),
  token_id VARCHAR(256),
  token BLOB,
  authentication BLOB
);

Drop table  if exists oauth_code;
create table oauth_code (
  create_time timestamp default now(),
  code VARCHAR(256),
  authentication BLOB
);




