CREATE DATABASE "curso-jsp"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;
	   
	   
	   
CREATE SEQUENCE usersequence
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 8
  CACHE 1;
ALTER TABLE usersequence
  OWNER TO postgres;
	   
	   
CREATE TABLE usuario
(
  id bigint NOT NULL DEFAULT nextval('usersequence'::regclass),
  login character varying(500),
  senha character varying(20),
  CONSTRAINT usuario_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE usuario
  OWNER TO postgres;
  
 
ALTER TABLE usuario ADD COLUMN nome character varying(500); 
  
  INSERT INTO usuario(
            id, login, senha)
    VALUES (1, 'alex', 'alex');

INSERT INTO usuario(
            id, login, senha)
    VALUES (2, 'admin', 'admin');


    
	   