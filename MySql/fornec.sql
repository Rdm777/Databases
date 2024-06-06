create schema FORNEC;

create table FORNECEDOR 
					( 
                      cod_forn int primary key 
                     ,nom_forn VARCHAR(10)
                     ,sta_forn int
                     ,qtd_peca int 
                     ,des_cidade_forn varchar(80)
                    );
                    
insert into FORNECEDOR
			VALUES
				    (1, 'Smith', 20, 2000, 'Londres'),
					(2, 'Jones', 10, 1000, 'Paris'),
					(3, 'Blake', 30, 3000, 'Paris'),
					(4, 'Clark', 20, 2500, 'Londres'),
					(5, 'Adams', 30, 1000, 'Atenas'),
					(6, 'Ivete', 40, 1000, 'Nova York'),
					(7, 'Mariana', 70, 2500, 'Tóquio'),
					(8, 'Zita', 50, 1000, 'São Paulo'),
					(9, 'Anna', 60, 1500, 'Paris'),
					(10, 'Fausto', 40, 2000, 'São Paulo');
                    
SELECT * FROM fornecedor;

SELECT * FROM fornecedor WHERE des_cidade_forn = "Paris";

SELECT * FROM fornecedor WHERE qtd_peca	>= "1000";

SELECT nom_forn, sta_forn, qtd_peca FROM fornecedor WHERE qtd_peca <= "1500";

SELECT nom_forn, des_cidade_forn, qtd_peca FROM fornecedor WHERE qtd_peca = "1000";

SELECT nom_forn, sta_forn, des_cidade_forn FROM fornecedor WHERE sta_forn < "30";

SELECT nom_forn, sta_forn FROM fornecedor WHERE qtd_peca <> "1000";		

SELECT * FROM fornecedor WHERE des_cidade_forn <> "São Paulo";

SELECT nom_forn FROM FORNECEDOR WHERE des_cidade_forn = 'Paris' AND des_cidade_forn = 'Londres';

SELECT * FROM FORNECEDOR WHERE NOT(des_cidade_forn = 'Londres') AND qtd_peca >= 1000 ;

SELECT nom_forn, sta_forn, qtd_peca FROM FORNECEDOR WHERE qtd_peca= 1000 AND sta_forn = 10; 

SELECT nom_forn,des_cidade_forn,qtd_peca FROM FORNECEDOR WHERE qtd_peca =1000 OR qtd_peca = 2500;

SELECT nom_forn, sta_forn, des_cidade_forn FROM FORNECEDOR WHERE sta_forn < 30 AND nom_forn = 'Ivete' AND des_cidade_forn = 'Nova York';

SELECT nom_forn, sta_forn FROM FORNECEDOR WHERE qtd_peca NOT LIKE 1000 AND sta_forn not like 10;

SELECT * FROM FORNECEDOR WHERE des_cidade_forn NOT LIKE 'Sao Paulo' AND qtd_peca > 900 AND sta_fORn NOT LIKE 60;