create schema fabrica;

CREATE TABLE veiculo
					(
						 cod_veic INT PRIMARY KEY NOT NULL AUTO_INCREMENT
                        ,des_veic VARCHAR (40)
                        ,des_fabric_veic VARCHAR (40)
                        ,des_valor_veic decimal (10,2)
                        ,dat_ano_fabric_veic INT
                        ,dat_cadast_veic DATE
                        ,des_cidade_veic VARCHAR (40)	
                        ,sta_ativ_desativ_veic CHAR (1)			
					);
                    
INSERT INTO veiculo
				VALUES
					 ('1','Civic', 'Honda', 87000.00, 2017, '2017-09-14', 'Ubatuba', 'A')
					,('2','Corolla', 'Toyota', 99000.00, 2007, '2010-03-27', 'Ribeirão Preto', 'A')
					,('3','Captur', 'Renault', 87000.00, 2017, '2017-10-24', 'Florianópolis', 'A')
					,('4','Hilux', 'Toyota', 72000.00, 2000, '2016-02-10', 'São Paulo', 'A')
					,('5','CRV', 'Honda', 65000.00, 2012, '2017-02-15', 'Fortaleza', 'A')
					,('6','C3', 'Citroen', 40000.00, 2014, '2015-11-19', 'Sertãozinho', 'A')
					,('7','Fox', 'Wolksvagem', 19000.00, 2001, '2001-09-11', 'Rio de Janeiro', 'D')
					,('8','HB20', 'Hyundai', 41000.00, 2014, '2017-01-13', 'Ubatuba', 'A')
					,('9','Fusion', 'Ford', 49000.00, 2007, '2016-04-25', 'Vitória', 'A')
					,('10','Elantra', 'Hyundai', 35000.00, 2010, '2011-06-09', 'Ribeirão Preto', 'A')
					,('11','City', 'Honda', 48000.00, 2014, '2015-11-27', 'Fortaleza', 'A')
					,('12','ix35', 'Hyundai', 51000.00, 2013, '2016-07-08', 'Campinas', 'A')
					,('13','Fiesta', 'Ford', 17000.00, 2009, '2010-08-30', 'Ribeirão Preto', 'D')
					,('14','Celta', 'Chevrolet', 14000.00, 2010, '2016-04-21', 'Jundiaí', 'D')
					,('15','Cruze', 'Chevrolet', 53000.00, 2015, '2017-05-05', 'São Paulo', 'A');

SELECT * FROM veiculo WHERE dat_ano_fabric_veic BETWEEN '2014' AND '2017';

SELECT des_veic, des_fabric_veic, dat_ano_fabric_veic, des_cidade_veic, sta_ativ_desativ_veic FROM veiculo WHERE des_cidade_veic IN ('Ribeirão Preto') AND sta_ativ_desativ_veic IN ('A');

SELECT des_veic, dat_cadast_veic FROM veiculo WHERE dat_cadast_veic > '2015-11-19';

SELECT cod_veic, des_veic, des_fabric_veic, dat_ano_fabric_veic, sta_ativ_desativ_veic FROM veiculo WHERE des_fabric_veic = 'Honda' AND dat_cadast_veic > '2016-01-01' AND dat_ano_fabric_veic BETWEEN 2015 AND 2017;

SELECT cod_veic, des_veic, des_fabric_veic, des_valor_veic, dat_ano_fabric_veic FROM veiculo WHERE dat_ano_fabric_veic IN (2017) OR des_valor_veic > 80000.00 AND sta_ativ_desativ_veic <> 'D';

SELECT des_veic, des_cidade_veic, dat_ano_fabric_veic FROM veiculo WHERE des_fabric_veic IN ('Hyundai', 'Toyota') AND dat_ano_fabric_veic NOT IN (2014, 2015, 2016, 2017);

SELECT * FROM veiculo WHERE dat_ano_fabric_veic NOT IN(2014) ORDER BY des_fabric_veic ASC;

SELECT * FROM veiculo WHERE dat_ano_fabric_veic NOT IN(2014, 2017) AND des_valor_veic <= '60000.00';

SELECT des_fabric_veic, des_veic, dat_ano_fabric_veic FROM veiculo WHERE des_fabric_veic LIKE 'H%';

SELECT DISTINCT des_fabric_veic FROM veiculo ORDER BY des_fabric_veic DESC;

SELECT AVG (des_valor_veic) AS Media_Fabricante FROM veiculo WHERE des_fabric_veic = 'Hyundai';

SELECT COUNT(cod_veic) AS Total_registro FROM veiculo;

SELECT SUM(des_valor_veic) AS Soma_SP FROM veiculo WHERE des_cidade_veic = 'São Paulo';

SELECT MAX(des_valor_veic) AS Maior_Valor_Veiculo FROM veiculo;

SELECT MIN(dat_ano_fabric_veic) AS Menor_Ano_Fabricacao FROM veiculo;