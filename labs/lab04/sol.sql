-- 1. (a) create tablespace / datafile
CREATE TABLESPACE aebd_tables DATAFILE 'aebd_tables_01.dbf' SIZE 100m;

-- 1. (b) create temporary tablespace /datafile
CREATE TEMPORARY TABLESPACE aebd_taemp TEMPFILE 'aebd_temp_01.dbf' SIZE 50M AUTOEXTEND ON;

-- 1. (c) list all tablespaces
SELECT * FROM dba_tablespaces;

-- 1. (d) create user
CREATE USER aebd IDENTIFIED BY "aebd" DEFAULT TABLESPACE aebd_tables TEMPORARY TABLESPACE aebd_temp QUOTA UNLIMITED ON aebd_tables;

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

-- 2. (b) e (c) => done with Oracle SQL Developer



-- 3. => done with Oracle SQL Developer



-- 4. (a) how many athletes play at "FC Porto"
select count(*) as "#Players"
from aebd.clube
    join aebd.jogador on aebd.clube.id_clube = aebd.jogador.id_clube
where aebd.clube.nome LIKE 'FC Porto%';

-- 4 (b) list all players that are "Defesa Direito" at sports teams founded at 1910
select jogador.id_jogador, jogador.nome, idade, jogador.cidade, clube.nome as "clube_nome", clube.cidade as "clube_cidade", ano_fundacao, desc_posicao
from aebd.jogador
    inner join aebd.clube on jogador.id_clube = clube.id_clube
    inner join aebd.posicao on jogador.id_posicao = posicao.id_posicao
where desc_posicao = 'Defesa Direito' and ano_fundacao = 1910;

-- 4. (c) list age average (with 1 decimal case) of each athlete playing at "Braga", per field position
select desc_posicao, cast(avg(idade) as decimal(*,1)) as age_avg
from aebd.jogador
    join aebd.clube on aebd.jogador.id_clube = aebd.clube.id_clube
    join aebd.posicao on aebd.jogador.id_posicao = aebd.posicao.id_posicao
where clube.nome LIKE 'Braga'
group by desc_posicao;

-- 4. (d) list the names and roles of each coach of every sports steam founded prior to 1950
select treinador.nome, desc_cargo
from aebd.clube
    join aebd.treinador on aebd.clube.id_clube = aebd.treinador.id_clube
    join aebd.cargo on aebd.treinador.id_cargo = aebd.cargo.id_cargo
where ano_fundacao < 1950;

-- 4. (e) list the names and roles of each coach, name, city and foundation year of every sports steam founded after 1945
select treinador.nome, clube.nome as clube_nome, desc_cargo, cidade, ano_fundacao
from aebd.clube
    join aebd.treinador on aebd.clube.id_clube = aebd.treinador.id_clube
    join aebd.cargo on aebd.treinador.id_cargo = aebd.cargo.id_cargo
where ano_fundacao > 1945;



-- 5. create view named 'jogador_new' with athlete info:
--    -> id_jogador
--    -> nome
--    -> idade
--    -> nome_clube
--    -> desc_posicao
--    -> nome_liga
--    -> cidade_clube
--    -> ano_fundacao
create or replace view jogador_new as
    select jogador.id_jogador, jogador.nome, idade, clube.nome as nome_clube, desc_posicao, liga.nome as nome_liga, clube.cidade as cidade_clube, clube.ano_fundacao as ano_fundacao
    from aebd.jogador
        join aebd.clube on aebd.jogador.id_clube = aebd.clube.id_clube
        join aebd.posicao on aebd.jogador.id_posicao = aebd.posicao.id_posicao
        join aebd.liga on aebd.clube.id_liga = aebd.liga.id_liga
    ;
    


-- 6. list all athletes playing at II Liga
select *
from jogador_new
where nome_liga = 'II Liga';


-- 7. list all athletes with less than 27 years, whose position is 'Trinco' and that don't play at II Liga
select *
from jogador_new
where idade < 27 and  desc_posicao = 'Trinco' and nome_liga != 'II Liga';


-- 8. create view named 'treinador_new' with coach info:
--    -> id_treinador
--    -> nome_treinador
--    -> nome_clube
--    -> desc_cargo
create or replace view treinador_new as
    select treinador.id_treinador, treinador.nome as nome_treinador, clube.nome as nome_clube, desc_cargo
    from aebd.treinador
        join aebd.clube on aebd.treinador.id_clube = aebd.clube.id_clube
        join aebd.cargo on aebd.treinador.id_cargo = aebd.cargo.id_cargo
    ;
    
