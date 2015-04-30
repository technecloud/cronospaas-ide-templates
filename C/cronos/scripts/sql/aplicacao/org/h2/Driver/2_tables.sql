CREATE TABLE cargos(
  numero NUMBER(9) NOT NULL,
  nome VARCHAR2(20) NOT NULL,
  jornada NUMBER(2) NOT NULL,
  CONSTRAINT cargos_pk
    PRIMARY KEY(numero)
)
/

CREATE TABLE funcionarios(
  numero NUMBER(9) NOT NULL,
  nome VARCHAR2(70) NOT NULL,
  dtnasc DATE,
  horentrada DATE,
  mae VARCHAR2(70),
  cpf VARCHAR2(20),
  estcivil VARCHAR2(20),
  salario NUMBER(9,3),
  cargo NUMBER(9),
  anoentrada NUMBER(4),
  possuidependente CHAR(1),
  password VARCHAR2(20),
  foto blob,
  biografia clob,
  foto1 long raw,
  foto2 VARCHAR2(200),
  CONSTRAINT funcionarios_pk
    PRIMARY KEY(numero),
  CONSTRAINT funcionarios_cargos_fk
    FOREIGN KEY(cargo)
    REFERENCES cargos(numero)
)
/

CREATE TABLE vinculos(
  numfunc NUMBER(9) NOT NULL,
  numero NUMBER(8) NOT NULL,
  categoria VARCHAR2(50),
  CONSTRAINT vinculos_pk
    PRIMARY KEY(numfunc, numero),
  CONSTRAINT vinculos_funcionarios_fk
    FOREIGN KEY(numfunc)
    REFERENCES funcionarios(numero)
)
/

CREATE TABLE organograma(
  id_org NUMBER(9) NOT NULL,
  nivel NUMBER(3) NOT NULL,
  nome VARCHAR2(50) NOT NULL,
  CONSTRAINT org_pk
    PRIMARY KEY(id_org)
)
/

create table TEST_FUNCIONARIO
(
 NUMERO            NUMBER(9) NOT NULL
,NOME              VARCHAR2(70) NOT NULL
,DTNASC                    DATE
,ESTCIVIL                  VARCHAR2(20)
,SALARIO                   NUMBER(9,3)
,CARGO                     NUMBER(9)
,POSSUIDEPENDENTE          CHAR(1)
,HORAENTRADA               DATE
,   CONSTRAINT test_funcionarios_pk
    PRIMARY KEY(numero)
)
/

create table treeview_test
(id        number
,nivel     number
,descricao varchar2(100)
)
/

CREATE VIEW funcionarios_vw AS
  SELECT f.numero, f.nome, f.dtnasc, f.horentrada, f.mae, f.cpf, f.estcivil, f.salario, f.cargo,
    f.anoentrada, f.possuidependente, f.biografia, f._ROWID_ rowid_reg, c.nome as nomecargo
    FROM funcionarios f left outer join cargos c on f.cargo = c.numero
/
INSERT INTO cargos(numero, nome, jornada)
  VALUES(1, 'Professor', 4)
/
INSERT INTO cargos(numero, nome, jornada)
  VALUES(2, 'Analista', 6)
/
INSERT INTO cargos(numero, nome, jornada)
  VALUES(3, 'Vendedor', 8)
/
INSERT INTO cargos(numero, nome, jornada)
  VALUES(4, 'Jornalista', 6)
/
INSERT INTO cargos(numero, nome, jornada)
  VALUES(5, 'Engenheiro', 6)
/
INSERT INTO cargos(numero, nome, jornada)
  VALUES(6, 'Arquiteto', 8)
/
INSERT INTO cargos(numero, nome, jornada)
  VALUES(7, 'Motorista', 4)
/

INSERT INTO funcionarios(numero, nome, dtnasc, horentrada, mae, cpf, estcivil, salario, cargo, anoentrada, possuidependente, biografia)
  VALUES(1, 'Marina Bressane Pessoa', parsedatetime('21-12-2005', 'DD-MM-YYYY'), parsedatetime('01-02-2010 08:00', 'DD-MM-YYYY HH:mm'), 'Georgina Pauperio Bressane', '82334114855', 'SOLTEIRO', 985.501, 1, 2007, 'S', 'Este campo precisa ter mais de uma linha para teste de propriedade MULTILINE: - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição - Testando edição')
/
INSERT INTO funcionarios(numero, nome, dtnasc, horentrada, mae, cpf, estcivil, salario, cargo, anoentrada, possuidependente)
VALUES(2, 'Juvenal Nunes de Siqueira', parsedatetime('17-01-1994', 'DD-MM-YYYY'), parsedatetime('01-02-2010 10:00', 'DD-MM-YYYY HH:mm'), 'Leonor Maria de Souza', '62088820280', 'SOLTEIRO', 1985.589, 2, 2005, 'S')
/
INSERT INTO funcionarios(numero, nome, dtnasc, horentrada, mae, cpf, estcivil, salario, cargo, anoentrada, possuidependente)
  VALUES(3, 'Magda Sanches', parsedatetime('29-04-1951', 'DD-MM-YYYY'), null, 'Maria Feres Davi', '70774839325', 'CASADO', 585.500, null, 1980, 'N')
/
INSERT INTO funcionarios(numero, nome, dtnasc, horentrada, mae, cpf, estcivil, salario, cargo, anoentrada, possuidependente)
  VALUES(4, 'Joana Gomes', null, parsedatetime('01-02-2010 09:00', 'DD-MM-YYYY HH:mm'), 'Antonia Pereira', null, 'CASADO', null, 3, null, 'N')
/
INSERT INTO funcionarios(numero, nome, dtnasc, horentrada, mae, cpf, estcivil, salario, cargo, anoentrada, possuidependente)
  VALUES(5, 'Jose Oliveira', null, null, 'Marlene de Souza', null, 'CASADO', 0, 4, null, 'S')
/
INSERT INTO funcionarios(numero, nome) VALUES(501, 'Adriana Helena Queiroz')
/
INSERT INTO funcionarios(numero, nome) VALUES(502, 'Alexandra Velasco De Oliveira')
/
INSERT INTO funcionarios(numero, nome) VALUES(503, 'Alexandre Rosa De Rezende')
/
INSERT INTO funcionarios(numero, nome) VALUES(504, 'Clara De Carvalho Campos')
/
INSERT INTO funcionarios(numero, nome) VALUES(505, 'Edilaine Leila Da Silva Granato')
/
INSERT INTO funcionarios(numero, nome) VALUES(506, 'Elinardo Silva Pereira')
/
INSERT INTO funcionarios(numero, nome) VALUES(507, 'Elisa Maria Lana Leite')
/
INSERT INTO funcionarios(numero, nome) VALUES(508, 'Fernanda Carvalho Arantes')
/
INSERT INTO funcionarios(numero, nome) VALUES(509, 'Fernanda Goulart Pereira')
/
INSERT INTO funcionarios(numero, nome) VALUES(510, 'Fernanda Liliane Marugeiro')
/
INSERT INTO funcionarios(numero, nome) VALUES(511, 'Fernanda Machado Ferreira')
/
INSERT INTO funcionarios(numero, nome) VALUES(512, 'Fernanda Santana Martins')
/
INSERT INTO funcionarios(numero, nome) VALUES(513, 'Fernando Andrade Cerceau')
/
INSERT INTO funcionarios(numero, nome) VALUES(514, 'Gilda Maria Santos Linhares')
/
INSERT INTO funcionarios(numero, nome) VALUES(515, 'Giovanna Cunha Mello Lazarini')
/
INSERT INTO funcionarios(numero, nome) VALUES(516, 'Giovanna De Carvalho Simões')
/
INSERT INTO funcionarios(numero, nome) VALUES(517, 'Irinalvo Silva Galdino Júnior')
/
INSERT INTO funcionarios(numero, nome) VALUES(518, 'Jeova Da Silva Campos')
/
INSERT INTO funcionarios(numero, nome) VALUES(519, 'Joana D''Arc Da Costa Vilela')
/
INSERT INTO funcionarios(numero, nome) VALUES(520, 'Julianne Costa E Malta Veloso')
/
INSERT INTO funcionarios(numero, nome) VALUES(521, 'Keila Da Silva Moreira')
/
INSERT INTO funcionarios(numero, nome) VALUES(522, 'Kátia Oliveira Freitas')
/
INSERT INTO funcionarios(numero, nome) VALUES(523, 'Leonardo De Carvalho Abud')
/
INSERT INTO funcionarios(numero, nome) VALUES(524, 'Luana Caldeira Fernandes')
/
INSERT INTO funcionarios(numero, nome) VALUES(525, 'Lucia Helena Alves Carrieri')
/
INSERT INTO funcionarios(numero, nome) VALUES(526, 'Lúiza De Souza Pereira Campos')
/
INSERT INTO funcionarios(numero, nome) VALUES(527, 'Maria Kirihara Kimura')
/
INSERT INTO funcionarios(numero, nome) VALUES(528, 'Maria Natividade Pires Tavares')
/
INSERT INTO funcionarios(numero, nome) VALUES(529, 'Maria Virgínia Vieira De Almeida Sampaio')
/
INSERT INTO funcionarios(numero, nome) VALUES(530, 'Maria Cristina Alvarez Leite')
/
INSERT INTO funcionarios(numero, nome) VALUES(531, 'Maria Cristina Lacerda De Gabriel')
/
INSERT INTO funcionarios(numero, nome) VALUES(532, 'Maria Cristina Tavares Chamonge')
/
INSERT INTO funcionarios(numero, nome) VALUES(533, 'Maria Cristina De Araújo Fernandes Nunes Coelho')
/
INSERT INTO funcionarios(numero, nome) VALUES(534, 'Maria Madalena Cáceres Pereira')
/
INSERT INTO funcionarios(numero, nome) VALUES(535, 'Maria Madalena Queiroz Borges')
/
INSERT INTO funcionarios(numero, nome) VALUES(536, 'Maria Susana Alamy Reis')
/
INSERT INTO funcionarios(numero, nome) VALUES(537, 'Mariana Freitas Rodrigues')
/
INSERT INTO funcionarios(numero, nome) VALUES(538, 'Nádia Teixeira Arruda De Carvalho')
/
INSERT INTO funcionarios(numero, nome) VALUES(539, 'Silvana Fátima Magalhães')
/
INSERT INTO funcionarios(numero, nome) VALUES(540, 'Stefania Silva Carneiro Netto Ferraz')
/
INSERT INTO funcionarios(numero, nome) VALUES(541, 'Sônia Cristina Fagundes Malta')
/
INSERT INTO funcionarios(numero, nome) VALUES(542, 'Sônia Maria Nascimento Silva')
/
INSERT INTO funcionarios(numero, nome) VALUES(543, 'Érika Cristina Ribeiro Tavares')
/
INSERT INTO funcionarios(numero, nome) VALUES(544, 'Érica De Souza Amorim')
/
INSERT INTO funcionarios(numero, nome) VALUES(545, 'Érika Horst Viana Magalhãções')
/
INSERT INTO funcionarios(numero, nome) VALUES(546, 'Érika Nesralla Ribeiro De Tassis')
/

INSERT INTO vinculos(numfunc, numero, categoria)
  VALUES(1, 1, 'Administração Geral')
/
INSERT INTO vinculos(numfunc, numero, categoria)
  VALUES(1, 2, 'Membro do Conselho')
/
INSERT INTO vinculos(numfunc, numero, categoria)
  VALUES(1, 3, 'Comissionados')
/
INSERT INTO vinculos(numfunc, numero, categoria)
  VALUES(2, 1, 'Proteção e Segurança')
/
INSERT INTO vinculos(numfunc, numero, categoria)
  VALUES(2, 2, 'Administração Tribut')
/
INSERT INTO vinculos(numfunc, numero, categoria)
  VALUES(2, 3, 'Magistério Superior')
/
INSERT INTO vinculos(numfunc, numero, categoria)
  VALUES(3, 1, 'Administração Geral')
/
INSERT INTO vinculos(numfunc, numero, categoria)
  VALUES(3, 2, 'Comissionados')
/
INSERT INTO vinculos(numfunc, numero, categoria)
  VALUES(3, 3, 'Atividade Jurídica')
/
INSERT INTO vinculos(numfunc, numero, categoria)
  VALUES(4, 1, 'Administração Geral')
/
INSERT INTO vinculos(numfunc, numero, categoria)
  VALUES(5, 1, 'Membro do Conselho')
/

INSERT INTO organograma(id_org, nivel, nome)
  VALUES(1, 1, 'Prefeitura do Mundo Perdido')
/
INSERT INTO organograma(id_org, nivel, nome)
  VALUES(2, 2, 'Secretaria da Imaginação')
/
INSERT INTO organograma(id_org, nivel, nome)
  VALUES(3, 2, 'Gabinete do Prefeito')
/
INSERT INTO organograma(id_org, nivel, nome)
  VALUES(4, 2, 'Secretaria dos Encantos e Magias')
/
INSERT INTO organograma(id_org, nivel, nome)
  VALUES(5, 3, 'Departamento de Poções Mágicas')
/
INSERT INTO organograma(id_org, nivel, nome)
  VALUES(6, 4, 'Setor dos Elixirs')
/
INSERT INTO organograma(id_org, nivel, nome)
  VALUES(7, 4, 'Setor de Poções de cura')
/
INSERT INTO organograma(id_org, nivel, nome)
  VALUES(8, 4, 'Setor de Venenos Magicos')
/
INSERT INTO organograma(id_org, nivel, nome)
  VALUES(9, 3, 'Departamento de Armas Mágicas')
/
INSERT INTO organograma(id_org, nivel, nome)
  VALUES(10, 4, 'Setor de Espadas')
/
INSERT INTO organograma(id_org, nivel, nome)
  VALUES(11, 2, 'Gabinete do Pirata Caolho')
/
commit
/

insert into treeview_test
(id,nivel,descricao)
values
(1,1,'T')
/
insert into treeview_test
(id,nivel,descricao)
values
(2,2,'e')
/
insert into treeview_test
(id,nivel,descricao)
values
(3,3,'s')
/
insert into treeview_test
(id,nivel,descricao)
values
(4,4,'t')
/
insert into treeview_test
(id,nivel,descricao)
values
(5,5,'E')
/
commit
/
