DESC uscensus;

select * from uscensus where id=9000;

explain plan set statement_id='sel1' into plan_table for
select * from uscensus where id=9000;

create or replace view custo as 
( SELECT LPAD(' ',2*(LEVEL-1))||operation operation, options, object_name objname, position pos, cost, statement_id
FROM plan_table
START WITH id = 0 
CONNECT BY PRIOR id = parent_id);

select operation, options, objname, pos, cost FROM custo
Where statement_id = 'sel1';

select sum(cost) from custo WHERE statement_id='sel1';

ALTER TABLE uscensus ADD CONSTRAINT minhaContrain PRIMARY KEY (workclass);

CREATE INDEX idx_education ON uscensus(education) B-TREE;

CREATE INDEX idx_sex_country_income ON uscensus(sex, country, income) BITMAP;

SELECT COUNT(*) AS numero_de_linhas FROM uscensus;

SELECT BLOCKS FROM USER_TABLES WHERE Uncensus  = 'USCENSUS';

SELECT HEIGHT FROM USER_INDEXES WHERE Uncensus  = 'USCENSUS' AND INDEX_NAME = 'NOME_DO_INDICE';
SELECT LAST_ANALYZED FROM USER_TABLES WHERE Uncensus  = 'USCENSUS';

SELECT OWNER, COUNT(*) AS numero_de_tabelas
FROM ALL_TABLES
WHERE OWNER NOT IN ('SYS', 'SYSTEM')
GROUP BY OWNER;

SELECT OWNER, TABLESPACE_NAME, COUNT(*) AS numero_de_indices
FROM DBA_INDEXES
WHERE OWNER NOT IN ('SYS', 'SYSTEM')
GROUP BY OWNER, TABLESPACE_NAME;

SELECT OWNER, Uncensus 
FROM DBA_INDEXES
WHERE OWNER NOT IN ('SYS', 'SYSTEM')
GROUP BY OWNER, Uncensus 
HAVING COUNT(*) > 3;

SELECT Uncensus 
FROM ALL_TABLES
WHERE Uncensus  LIKE '%APEX%';

