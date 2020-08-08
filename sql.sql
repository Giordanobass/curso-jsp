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
 
 CREATE SEQUENCE produtosequence
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 8
  CACHE 1;
ALTER TABLE usersequence
  OWNER TO postgres;
 
 CREATE SEQUENCE categoriasequence
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 8
  CACHE 1;
ALTER TABLE usersequence
  OWNER TO postgres;

create sequence serialuser
increment 1
minvalue 1
maxvalue 9223372036854775807
start 82
cache 1;
alter table serialuser
owner to postgres;
	   

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
 
 CREATE TABLE categoria
(
  id bigint NOT NULL DEFAULT nextval('categoriasequence'::regclass),
  nome character varying(500),
  
  CONSTRAINT categoria_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE categoria
  OWNER TO postgres;
 
 CREATE TABLE produto
(
  id bigint NOT NULL DEFAULT nextval('produtosequence'::regclass),
  nome character varying(500),
  quantidade bigint,
  valor numeric(10,4),
  categoria_id bigint,
  CONSTRAINT produto_pkey PRIMARY KEY (id),
  constraint categoria_fk foreign key (categoria_id)
  references categoria (id) match simple
  on update no action on delete no action 
)
WITH (
  OIDS=FALSE
);
ALTER TABLE produto
  OWNER TO postgres;

SELECT * FROM usuario;

alter table usuario owner to postgres;
alter table usuario add column nome character varying(500);
alter table usuario add column telefone character varying(20);
alter table usuario add column cep character varying(200);
alter table usuario add column rua character varying(200);
alter table usuario add column bairro character varying(200);
alter table usuario add column cidade character varying(200);
alter table usuario add column estado character varying(200);
alter table usuario add column ibge character varying(200);
alter table usuario add column fotobase64 text;
alter table usuario add column contenttype text;
alter table usuario add column id bigint not null;
alter table usuario alter column id set default nextval('usersequence'::regclass); 
ALTER TABLE usuario ADD COLUMN nome character varying(500); 
  
  INSERT INTO usuario(
            id, login, senha)
    VALUES (1, 'alex', 'alex');

INSERT INTO usuario(
            id, login, senha)
    VALUES (2, 'admin', 'admin');


    
	   