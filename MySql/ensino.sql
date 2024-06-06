create database ENSINO;
create table professor(
cod_prof int primary key,
nom_prof varchar (45),
des_titul varchar (20),
des_idade int
);

create table curso(
cod_curso int primary key,
nom_curso varchar (45),
des_area varchar (20)
);

create table disciplina(
cod_disc int primary key,
cod_prof int,
cod_curso int,
nom_disc varchar(40),
max_aluno int,
min_aluno int,
FOREIGN KEY (cod_prof) REFERENCES professor(cod_prof),
foreign key (cod_curso) references curso (cod_curso)
);


insert into professor values
(1,'Evelyn','Mestre',25),
(2,'Juliana','Doutor',35);

insert into curso values
(1,'Computacao','Exatas'),
(2,'Administracao','Humanas');

insert into Disciplina values
(1,1,1,'Banco de dados',35,30),
(2,1,2,'Programacao estruturada',35,30),
(3,2,1,'Metodologia Cientifica',70,50),
(4,2,2,'Metodos de pesquisa',70,50),
(5,1,1,'Analise de sistemas',35,25);


-- Quantidade de disciplinas por curso
-- Number of subjects per course
select cod_curso, count(cod_disc) 
from disciplina
group by cod_curso;

-- Quantidade de disciplinas por professor
-- Number of subjects per teacher
select cod_prof , count(cod_disc)
from disciplina
group by cod_prof;

-- Professor de banco de dados, a qual disciplina pertence e o numero minimo e maximo de alunos
-- Database teacher, which subject it belongs to and the minimum and maximum number of students
select professor.nom_prof as nome_professor,  disciplina.nom_disc as nome_disciplina, curso.nom_curso, disciplina.max_aluno,disciplina.min_aluno
from disciplina
inner join curso  on disciplina.cod_curso = curso.cod_curso
inner join professor  on disciplina.cod_prof = professor.cod_prof
where disciplina.nom_disc = 'Banco de dados';

-- Professores e suas discilinas, desde que o professor ministre mais que duas
-- Teachers and their subjects, as long as the teacher teaches more than two
SELECT professor.nom_prof AS nome_professor, COUNT(disciplina.cod_disc) AS Total_disciplina
FROM disciplina
INNER JOIN professor ON disciplina.cod_prof = professor.cod_prof
GROUP BY professor.nom_prof
HAVING COUNT(disciplina.cod_disc) > 2;

-- Quantidade de alunos da faculdade
-- Number of students at the college
select sum(max_aluno) as total_alunos
from disciplina;

-- Nome do professor, disciplinas que ministra e total de alunos
-- Name of the teacher, subjects taught and total number of students
SELECT professor.nom_prof AS nome_professor, 
       COUNT(disciplina.cod_disc) AS total_disciplinas, 
       SUM(disciplina.max_aluno) AS total_alunos
FROM disciplina
INNER JOIN professor ON disciplina.cod_prof = professor.cod_prof
INNER JOIN curso ON disciplina.cod_curso = curso.cod_curso
GROUP BY professor.nom_prof;

-- Media de alunos por disciplina
-- Average number of students per subject
SELECT AVG((max_aluno + min_aluno) / 2) AS media_alunos
FROM disciplina;

