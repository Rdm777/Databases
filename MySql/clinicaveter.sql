-- Criar o banco de dados
CREATE DATABASE CLINICAVETER;
USE CLINICAVETER;

-- Criar a tabela PROPRIETARIO
CREATE TABLE PROPRIETARIO (
    cod_pro INT PRIMARY KEY,
    nom_pro VARCHAR(50),
    des_end_pro VARCHAR(100),
    num_tel_pro VARCHAR(20)
);

-- Criar a tabela VETERINARIO
CREATE TABLE VETERINARIO (
    cod_vet INT PRIMARY KEY,
    nom_vet VARCHAR(50),
    des_espec_vet VARCHAR(50)
);

-- Criar a tabela ANIMAL
CREATE TABLE ANIMAL (
    cod_anim INT PRIMARY KEY,
    cod_pro INT,
    cod_vet INT,
    nom_anim VARCHAR(50),
    dat_nasc_anim DATE,
    des_raca_anim VARCHAR(50),
    des_sexo_anim CHAR(1),
    FOREIGN KEY (cod_pro) REFERENCES PROPRIETARIO(cod_pro),
    FOREIGN KEY (cod_vet) REFERENCES VETERINARIO(cod_vet)
);

-- Inserir dados na tabela PROPRIETARIO
INSERT INTO PROPRIETARIO (cod_pro, nom_pro, des_end_pro, num_tel_pro) VALUES
(1, 'Sebastian Vettel', 'Av. Paulista, 1200', '(11) 98866-9988'),
(2, 'Fausto Silva', 'Av. Brasil, 350', '(21) 3456-8634'),
(3, 'Fernando Alonso', 'Al. Santos, 126', '(11) 98789-9988'),
(4, 'Hanna Prater', 'Av. Ibirapuera, 300', '(11) 98723-9274'),
(5, 'Violeta Mimosa', 'Av. 9 de julho, 234', '(16) 99988-7766');

-- Inserir dados na tabela VETERINARIO
INSERT INTO VETERINARIO (cod_vet, nom_vet, des_espec_vet) VALUES
(1, 'Max Verstappen', 'Geral'),
(2, 'Pedro Perez', 'Geral'),
(3, 'Renata Vasconcelos', 'Ortopedia'),
(4, 'Marco Diniz', 'Nutrição');

-- Inserir dados na tabela ANIMAL
INSERT INTO ANIMAL (cod_anim, cod_pro, cod_vet, nom_anim, dat_nasc_anim, des_raca_anim, des_sexo_anim) VALUES
(1, 3, 1, 'Kaka', '2011-10-10', 'Poodle', 'F'),
(2, 1, 2, 'Croca', '2012-12-25', 'Collie', 'F'),
(3, 2, 1, 'Furacão', '2013-01-23', 'Pit Bull', 'M'),
(4, 5, 1, 'Ploc', '2014-04-30', 'Fox', 'M'),
(5, 4, 3, 'Tigra', '2010-09-27', 'Pastor Alemão', 'M');


-------------------------
-- Consultas
-------------------------

-- Mostrar todos os dados dos animais que a Veterinária Renata Vasconcelos atende:
SELECT 
    a.cod_anim AS Codigo_Animal,
    a.cod_pro AS Codigo_Proprietario,
    a.cod_vet AS Codigo_Veterinario,
    a.nom_anim AS Nome_Animal,
    a.dat_nasc_anim AS Data_Nascimento,
    a.des_raca_anim AS Raca_Animal,
    a.des_sexo_anim AS Sexo_Animal
FROM ANIMAL a
JOIN VETERINARIO v ON a.cod_vet = v.cod_vet
WHERE v.nom_vet = 'Renata Vasconcelos';

-- Mostrar o nome do Veterinário e do Proprietário do Animal Croca:
SELECT 
    v.nom_vet AS Nome_Veterinario,
    p.nom_pro AS Nome_Proprietario
FROM ANIMAL a
JOIN VETERINARIO v ON a.cod_vet = v.cod_vet
JOIN PROPRIETARIO p ON a.cod_pro = p.cod_pro
WHERE a.nom_anim = 'Croca';

-- Mostrar o nome, a raça e o sexo do Animal e o nome do Proprietário tratado pelo Max Verstappen, ordenado por data de nascimento:
SELECT 
    a.nom_anim AS Nome_Animal,
    a.des_raca_anim AS Raca_Animal,
    a.des_sexo_anim AS Sexo_Animal,
    p.nom_pro AS Nome_Proprietario
FROM ANIMAL a
JOIN VETERINARIO v ON a.cod_vet = v.cod_vet
JOIN PROPRIETARIO p ON a.cod_pro = p.cod_pro
WHERE v.nom_vet = 'Max Verstappen'
ORDER BY a.dat_nasc_anim;


-------------------------
-- Alterações
-------------------------
-- Renomear a Tabela ANIMAL para ANIMAL_GERAL:
RENAME TABLE ANIMAL TO ANIMAL_GERAL;

-- Adicionar a coluna dat_cad_vet com tipo de dados datetime na Tabela VETERINARIO:
ALTER TABLE VETERINARIO ADD COLUMN dat_cad_vet datetime;

-- Alterar a largura da coluna nom_anim para varchar(40):
ALTER TABLE ANIMAL_GERAL MODIFY COLUMN nom_anim varchar(40);

-- Alterar o nome da coluna des_end_pro para des_endere_pro:
ALTER TABLE PROPRIETARIO CHANGE COLUMN des_end_pro des_endere_pro VARCHAR(100);


-------------------------
-- Atualizações
-------------------------
-- Alterar a especialidade do veterinário Pedro Perez para Ortopedia:
UPDATE VETERINARIO SET des_espec_vet = "Ortopedia" WHERE nom_vet = "Pedro Perez";

-- Alterar a data de nascimento do animal de nome Furacão para 25/01/2013:
UPDATE ANIMAL_GERAL SET dat_nasc_anim = "2013-01-25" WHERE nom_anim = "Furacão";

-- Exclua o animal de raça Pastor Alemão.
DELETE FROM ANIMAL_GERAL WHERE des_raca_anim= "Pastor Alemão";





