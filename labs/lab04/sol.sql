-- 1. (a) create tablespace / datafile
CREATE TABLESPACE aebd_tables DATAFILE 'aebd_tables_01.dbf' SIZE 100m;

-- 1. (b) create temporary tablespace /datafile
CREATE TEMPORARY TABLESPACE aebd_taemp TEMPFILE 'aebd_temp_01.dbf' SIZE 50M AUTOEXTEND ON;

-- 1. (c) list all tablespaces
SELECT * FROM dba_tablespaces;

-- 1. (d) create user
CREATE USER aebd IDENTIFIED BY "aebd" DEFAULT TABLESPACE aebd_tables QUOTA UNLIMITED ON aebd_tables;

-- 1. (e) grant accesses
GRANT CONNECT, RESOURCE , CREATE VIEW, CREATE SEQUENCE TO aebd;

-- 1. (f) list all users
SELECT * from dba_users;

-- 2. (a) 
CREATE TABLE aebd.patrocinador (
    "id_patrocinador"   NUMBER              NOT NULL ENABLE,
    "nome"              VARCHAR2(200 byte)  NOT NULL ENABLE,
    "montante"          NUMBER              NOT NULL ENABLE,
    
    CONSTRAINT "PATROCINADOR_PK" PRIMARY KEY ("id_patrocinador")
);

-- 2. (b) e (c) => feitas com o Oracle SQL Developer

-- 3. => feito com o Oracle SQL Developer

