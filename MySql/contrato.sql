CREATE TABLE depto
			(
				 cod_depto INT PRIMARY KEY
                ,nom_depto VARCHAR(80)
                ,val_orcam_depto NUMERIC(10.2)
                ,des_local_depto VARCHAR(20)
            );
            
CREATE TABLE empregado
			(
				 cod_emp INT PRIMARY KEY
                ,cod_depto INT
                ,FOREIGN KEY (cod_depto) REFERENCES depto (cod_depto)
                ,des_nom_emp VARCHAR(80)
                ,des_idade_emp INT
                ,dat_adm_emp DATE
                ,des_cargo VARCHAR(20)
                ,val_salar_emp NUMERIC(10.2)
            );
            
INSERT INTO DEPTO
		VALUES
			 ("1", "Engenharia", "123000.00", "Prédio Engenharia")
			,("2", "Marketing", "1000000.00", "Prédio 1")
			,("3", "Finanças", "2000000.00", "Sala 2")
			,("4", "Diretoria", "2300000.00", "Mesanino");
            
INSERT INTO EMPREGADO
		VALUES
			  ("1", "1", "Joao Gonzo", "35", "2000-01-10", "Engenheiro", "3500.00")
             ,("2", "1", "Marita Silvita", "25", "1988-03-01", "Secretária", "1000.00")
             ,("3", "1", "Inácio Borboleta", "23", "1999-06-06", "Engenheiro", "3000.00")
             ,("4", "4", "Crisóstema Vazia", "34", "1997-02-23", "Copeira", "500.00")
             ,("5", "2", "Saturnino Ponte ", "44", "2003-11-25", "Continuo", "2700.00")
             ,("6", "4", "Vera Lama", "18", "2005-02-23", "Presidente", "50000.00")
             ,("7", "3", "Justiniano Limoeiro", "45", "2002-05-17", "Contador", "3000.00")
             ,("8", "4", "Josefina Varsóvia", "31", "1996-10-11", "Secretária", "1200.00")
             ,("9", "3", "Lepeka Tossi", "26", "2000-12-12", "Secretária", "1100.00")
             ,("10", "2", "Pacífico Gerra", "31", "1997-01-01", "Vendedor", "2500.00");

-- Atualizar Cargo do Joao Gonzo para Engenheiro Meste.
-- Update Joao Gonzo's Job Title to Master Engineer.
UPDATE EMPREGADO
SET des_cargo = "Engenheiro Meste"
WHERE des_nom_emp = "Joao Gonzo";

-- Atualizar o salario de quem tem 40 anos para 3200.00.
-- Update the salary of those aged 40 to 3200.00.
UPDATE EMPREGADO
SET val_salar_emp = "3200.00"
WHERE des_idade_emp = "40";

-- Atualizar o salario de quem tem o cargo de copeira para 2300.
-- Update the salary of those who have the role of kitchen maid to 2300.
UPDATE EMPREGADO
SET val_salar_emp = "2300.00"
WHERE des_cargo = "Copeira";

-- Atualizar o nome e a idade do empregado João Gonzo.
-- Update the name and age of employee João Gonzo.
UPDATE EMPREGADO
SET des_nom_emp = "João Gonzzo", des_idade_emp = "37"
WHERE des_nom_emp = "Joao Gonzo";

-- Atualizar o valor do orcamento para todos os valores que sejam maior ou igual a 2000000.
-- Update the budget value for all values ​​that are greater than or equal to 2000000.
UPDATE DEPTO
SET val_orcam_depto = "2500000.00"
WHERE val_orcam_depto >= "2000000.00";

-- Atualizar o local do departamento Diretoria para Prédio Central.
-- Update the location of the Directorate department to Central Building.
UPDATE DEPTO
SET des_local_depto = "Prédio Central"
WHERE nom_depto = "Diretoria";

-- Atualizar a idade para quem nasceu no dia ou depois de 12/12/2000.
-- Update age for those born on or after 12/12/2000.
UPDATE EMPREGADO
SET des_idade_emp = "27"
WHERE dat_adm_emp >= "2000-12-12";

-- Alterar a coluna des_cargo para des_cargo_emp.
-- Change the des_cargo column to des_cargo_emp.
ALTER TABLE EMPREGADO
CHANGE des_cargo des_cargo_emp VARCHAR(20);

-- Alterar a coluna des_nom_emp para receber o tipo de dado VARCHAR com 60 caracteres.
-- Change the des_nom_emp column to receive the VARCHAR data type with 60 characters.
ALTER TABLE EMPREGADO
MODIFY COLUMN des_nom_emp VARCHAR(60);



