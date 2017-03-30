
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Atleta
DROP TABLE IF EXISTS Atleta;

CREATE TABLE Atleta (
    CC          INTEGER NOT NULL PRIMARY KEY,
	Altura      DECIMAL NOT NULL,
    Peso        DECIMAL NOT NULL,
	EquipaNome TEXT REFERENCES Equipa(EquipaNome),
	TreinadorCC INTEGER REFERENCES Treinador(CC),
	CategoriaNome TEXT NOT NULL REFERENCES Categoria(CategoriaNome)
);
-- Alterar valores do CC para valores existentes e do treinador tambem

INSERT INTO Atleta VALUES (289443867,160,62,NULL,NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,150,58,'Gold',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,145,65,NULL,NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,155,55,NULL,NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,167,49,'Prozis',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,166,52,'Nike',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,162,53,'ON',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,150,55,'USN',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,153,54,'Dedicated Division',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,157,69,'Gymshark',NULL,'Women’s Physique');

INSERT INTO Atleta VALUES (289443867,160,52,'ON',NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,166,54,'Nike',NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,153,54,'USN',NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,152,55,NULL,NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,151,58,NULL,NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,169,60,NULL,NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,172,61,NULL,NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,153,66,NULL,NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,150,65,NULL,NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,1162,64,NULL,NULL,'Women´s Bikini Fitness');


INSERT INTO Atleta VALUES (289443867,175,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,180,62,'Nike',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,185,62,'ON',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,172,62,'ON',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,192,62,'USN',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,183,62,'USN',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,176,62,'Dedicated Division',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,169,62,'Gymshark',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,172,62,'Prozis',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,176,62,'Prozis',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,182,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,189,62,'4Invictus',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,174,62,'Gymshark',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,176,62,'Nike',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,177,62,NULL,NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,178,62,NULL,NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,179,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,172,62,NULL,NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,173,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,175,62,'Gold',NULL,'Men’s Physique');




-- Table: AtletaPatrocinio
DROP TABLE IF EXISTS AtletaPatrocinio;

CREATE TABLE AtletaPatrocinio (
    AtletaCC   INTEGER NOT NULL REFERENCES Atleta (CC),
    NomePatrocinio TEXT NOT NULL REFERENCES Patrocinio (PatrocinioNome) 
);

--Change CC

INSERT INTO AtletaPatrocinio VALUES (CC, 'Gold');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Gold');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Gold');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Nike');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Nike');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Nike');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Nike');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Nike');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Prozis');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Prozis');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Prozis');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Dedicated Division');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Dedicated Division');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Dedicated Division');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Gymshark');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Gymshark');
INSERT INTO AtletaPatrocinio VALUES (CC, 'Gymshark');
INSERT INTO AtletaPatrocinio VALUES (CC, 'USN');
INSERT INTO AtletaPatrocinio VALUES (CC, 'USN');
INSERT INTO AtletaPatrocinio VALUES (CC, 'USN');
INSERT INTO AtletaPatrocinio VALUES (CC, 'ON');
INSERT INTO AtletaPatrocinio VALUES (CC, 'ON');
INSERT INTO AtletaPatrocinio VALUES (CC, 'ON');
INSERT INTO AtletaPatrocinio VALUES (CC, '4Invictus');
INSERT INTO AtletaPatrocinio VALUES (CC, '4Invictus');
INSERT INTO AtletaPatrocinio VALUES (CC, '4Invictus');


-- Table: Campeonato
DROP TABLE IF EXISTS Campeonato;

CREATE TABLE Campeonato (
    CampeonatoID  INTEGER NOT NULL PRIMARY KEY,
    Nome       TEXT NOT NULL,
    DataInicio DATE NOT NULL,
    DataFim    DATE NOT NULL,
    Pais       TEXT NOT NULL     REFERENCES Pais (Pais) 
);

INSERT INTO Campeonato VALUES (1,'Nacional', 'Porto', '2017-07-10', '2017-07-12', 'Portugal');
INSERT INTO Campeonato VALUES (2,'Regional', 'Esposende', '2017-08-21', '2017-08-23', 'Portugal');

-- Table: CampeonatoCategoriaFase
DROP TABLE IF EXISTS CampeonatoCategoriaFase;

CREATE TABLE CampeonatoCategoriaFase (
    IDCampeonato  INTEGER NOT NULL REFERENCES Campeonato (CampeonatoID),
    CategoriaNome TEXT  NOT NULL  REFERENCES Categoria (CategoriaNome),
    FaseNome      TEXT  NOT NULL  REFERENCES Fase (FaseNome) 
);

INSERT INTO Campeonato VALUES (1, 'Men´s Physique', 'Eliminatoria');
INSERT INTO Campeonato VALUES (1, 'Men´s Physique', 'Final');
INSERT INTO Campeonato VALUES (1, 'Women´s Physique', 'Eliminatoria');
INSERT INTO Campeonato VALUES (1, 'Women´s Physique', 'Final');
INSERT INTO Campeonato VALUES (1, 'Women´s Bikini Fitness', 'Eliminatoria');
INSERT INTO Campeonato VALUES (1, 'Women´s Bikini Fitness', 'Final');
INSERT INTO Campeonato VALUES (2, 'Men´s Physique', 'Eliminatoria');
INSERT INTO Campeonato VALUES (2, 'Men´s Physique', 'Final');
INSERT INTO Campeonato VALUES (2, 'Women´s Physique', 'Eliminatoria');
INSERT INTO Campeonato VALUES (2, 'Women´s Physique', 'Final');
INSERT INTO Campeonato VALUES (2, 'Women´s Bikini Fitness', 'Eliminatoria');
INSERT INTO Campeonato VALUES (2, 'Women´s Bikini Fitness', 'Final');

-- Table: Categoria
DROP TABLE IF EXISTS Categoria;

CREATE TABLE Categoria (
    Nome                TEXT NOT NULL   PRIMARY KEY,
    NumMaxParticipantes INTEGER NOT NULL,
    AlturaMinima        INTEGER NOT NULL,
    AlturaMaxima        INTEGER NOT NULL,
    PesoMinimo          DECIMAL NOT NULL,
    PesoMaximo          DECIMAL NOT NULL,
    Genero              CHAR NOT NULL
);


--Check Pesos e alturas

INSERT INTO Categoria VALUES ('Men´s Physique',10, 155, 195, 65, 95, 'M');
INSERT INTO Categoria VALUES ('Men´s Classic',5, 186, 195, 86, 95, 'M');
INSERT INTO Categoria VALUES ('Culturismo Master',5, 196, 205, 96, 105, 'M');
INSERT INTO Categoria VALUES ('Women´s Physique',5, 145, 170, 45, 65, 'F');
INSERT INTO Categoria VALUES ('Women´s Bikini Fitness',5, 145, 175, 50, 75, 'F');
INSERT INTO Categoria VALUES ('Women´s Classic',5, 176, 185, 76, 85, 'F');


-- Table: Classificacao
DROP TABLE IF EXISTS Classificacao;

CREATE TABLE Classificacao (
    AtletaCC INTEGER NOT NULL REFERENCES Atleta (CC),
    JuriID   INTEGER NOT NULL REFERENCES Juri (JuriID),
    Pontos   INTEGER NOT NULL
);

--Corrected CC, ID

INSERT INTO Classificacao VALUES(CC, ID, 2);
INSERT INTO Classificacao VALUES(CC, ID, 0);
INSERT INTO Classificacao VALUES(CC, ID, 1);
INSERT INTO Classificacao VALUES(CC, ID, 5);
INSERT INTO Classificacao VALUES(CC, ID, 0);
INSERT INTO Classificacao VALUES(CC, ID, 2);
INSERT INTO Classificacao VALUES(CC, ID, 4);
INSERT INTO Classificacao VALUES(CC, ID, 5);
INSERT INTO Classificacao VALUES(CC, ID, 3);
INSERT INTO Classificacao VALUES(CC, ID, 1);
INSERT INTO Classificacao VALUES(CC, ID, 4);
INSERT INTO Classificacao VALUES(CC, ID, 7);
INSERT INTO Classificacao VALUES(CC, ID, 8);
INSERT INTO Classificacao VALUES(CC, ID, 1);
INSERT INTO Classificacao VALUES(CC, ID, 2);
INSERT INTO Classificacao VALUES(CC, ID, 0);
INSERT INTO Classificacao VALUES(CC, ID, 5);
INSERT INTO Classificacao VALUES(CC, ID, 3);


-- Table: DataCat
DROP TABLE IF EXISTS DataCat;

CREATE TABLE DataCat (
    NomeCategoria TEXT NOT NULL   REFERENCES Categoria (CategoriaNome),
    NomeFase      TEXT  NOT NULL  REFERENCES Fase (FaseNome),
	IDCampeonato  TEXT  NOT NULL  REFERENCES Campeonato (CampeonatoID),
    Dia           INTEGER NOT NULL,
    Hora          TEXT NOT NULL
);

--Verificar se tao todos

INSERT INTO DataCat VALUES('Men´s Physique', 'Eliminatoria', 1, 10, '15:00');
INSERT INTO DataCat VALUES('Men´s Physique', 'Final', 1, 11, '15:00');
INSERT INTO DataCat VALUES('Men´s Physique', 'Eliminatoria', 2, 21, '15:00');
INSERT INTO DataCat VALUES('Men´s Physique', 'Final', 2, 22, '15:00');
INSERT INTO DataCat VALUES('Women´s Physique', 'Eliminatoria', 1, 10, '18:00');
INSERT INTO DataCat VALUES('Women´s Physique', 'Final', 1, 11, '18:00');
INSERT INTO DataCat VALUES('Women´s Physique', 'Eliminatoria', 2, 21, '18:00');
INSERT INTO DataCat VALUES('Women´s Physique', 'Final', 2, 22, '18:00');
INSERT INTO DataCat VALUES('Women´s Bikini Fitness', 'Eliminatoria', 1, 10, '17:00');
INSERT INTO DataCat VALUES('Women´s Bikini Fitness', 'Final', 1, 11, '17:00');
INSERT INTO DataCat VALUES('Women´s Bikini Fitness', 'Eliminatoria', 2, 21, '17:00');
INSERT INTO DataCat VALUES('Women´s Bikini Fitness', 'Final', 2, 22, '17:00');

-- Table: Equipa
DROP TABLE IF EXISTS Equipa;

CREATE TABLE Equipa (
    EquipaNome  TEXT NOT NULL PRIMARY KEY,
    Local TEXT NOT NULL
);

--Verificar se estão todos

INSERT INTO Equipa VALUES('Gold', 'Freixieiro');
INSERT INTO Equipa VALUES('Silver', 'Amadora');
INSERT INTO Equipa VALUES('Bronze', 'Vila Franca de Xira');
INSERT INTO Equipa VALUES('ON', 'USA');
INSERT INTO Equipa VALUES('Dedicated Division', 'Belgic');
INSERT INTO Equipa VALUES('Nike', 'USA');
INSERT INTO Equipa VALUES('USN', 'England');
INSERT INTO Equipa VALUES('Prozis', 'Portugal');
INSERT INTO Equipa VALUES('Gymshark', 'USA');


-- Table: Fase
DROP TABLE IF EXISTS Fase;

CREATE TABLE Fase (
    FaseNome TEXT NOT NULL PRIMARY KEY
);

INSERT INTO Fase VALUES('Eliminatoria´');
INSERT INTO Fase VALUES('Final');


-- Table: Jurado
DROP TABLE IF EXISTS Jurado;

CREATE TABLE Jurado (
    CC     INTEGER NOT NULL PRIMARY KEY,
    JuriID INTEGER NOT NULL REFERENCES Juri (JuriID) 
);

-- change CC
INSERT INTO Jurado VALUES (CC, 1);
INSERT INTO Jurado VALUES (CC, 1);
INSERT INTO Jurado VALUES (CC, 1);
INSERT INTO Jurado VALUES (CC, 1);
INSERT INTO Jurado VALUES (CC, 2);
INSERT INTO Jurado VALUES (CC, 2);
INSERT INTO Jurado VALUES (CC, 2);
INSERT INTO Jurado VALUES (CC, 2);


-- Table: Juri
DROP TABLE IF EXISTS Juri;

CREATE TABLE Juri (
    JuriID INTEGER NOT NULL PRIMARY KEY
);

INSERT INTO Juri VALUES (1);
INSERT INTO Juri VALUES (2);

-- Table: Pais
DROP TABLE IF EXISTS Pais;

CREATE TABLE Pais (
    Pais TEXT NOT NULL PRIMARY KEY
);

INSERT INTO Pais VALUES ('Portugal');
INSERT INTO Pais VALUES ('Espanha');
INSERT INTO Pais VALUES ('Austrália');
INSERT INTO Pais VALUES ('USA');


-- Table: Patrocinio
DROP TABLE IF EXISTS Patrocinio;

CREATE TABLE Patrocinio (
    PatrocinioNome  TEXT  NOT NULL PRIMARY KEY,
    Valor INTEGER NOT NULL
);

--verificar se tao todas 
INSERT INTO Patrocinio VALUES('Nike', 4);
INSERT INTO Patrocinio VALUES('Prozis', 10);
INSERT INTO Patrocinio VALUES('4Invictus', 8);
INSERT INTO Patrocinio VALUES('Gymshark', 5);
INSERT INTO Patrocinio VALUES('Gold', 2);
INSERT INTO Patrocinio VALUES('USN', 8);
INSERT INTO Patrocinio VALUES('ON', 9);
INSERT INTO Patrocinio VALUES('Dedicated Division', 17);



-- Table: Pessoa
DROP TABLE IF EXISTS Pessoa;

CREATE TABLE Pessoa (
    CC             INTEGER NOT NULL PRIMARY KEY,
    Nome           TEXT NOT NULL,
    Morada         TEXT NOT NULL,
    Genero         CHAR NOT NULL,
    DataNascimento DATE NOT NULL,
    Pais           TEXT NOT NULL   REFERENCES Pais (Pais) 
);

INSERT INTO Pessoa VALUES (289443867,'Aileen Cohen','4189 Id Road','F','1988-08-26','Portugal');
INSERT INTO Pessoa VALUES (440925049,'Garth George','Ap #626-9050 Nec Avenue','M','1984-03-05','Espanha');
INSERT INTO Pessoa VALUES (586010744,'Louis Raymond','759-2197 Sodales Avenue','M','1984-06-07','Portugal');
INSERT INTO Pessoa VALUES (482036360,'Breanna Hill','Ap #774-9530 Arcu. Street','F','1983-08-22','Portugal');
INSERT INTO Pessoa VALUES (342938934,'Christopher Burke','4843 Pellentesque Rd.','M','1987-08-25','Portugal');
INSERT INTO Pessoa VALUES (337159639,'Julie Carroll','2578 Urna Rd.','F','1984-06-19','Portugal');
INSERT INTO Pessoa VALUES (812457849,'Ayanna Carver','292-7022 Nunc Road','F','1981-02-11','Portugal');
INSERT INTO Pessoa VALUES (706734793,'Reagan Reed','833-6141 Pharetra Road','M','1987-09-09','Portugal');
INSERT INTO Pessoa VALUES (774198838,'Kameko Hogan','P.O. Box 765, 7516 Nisl St.','M','1990-02-11','Portugal');
INSERT INTO Pessoa VALUES (647032341,'Nehru Griffith','P.O. Box 649, 1964 Eu Rd.','F','1981-07-15','Portugal');
INSERT INTO Pessoa VALUES (192724629,'Bradley Ortega','P.O. Box 828, 6173 Vestibulum Rd.','M','1983-11-12','Espanha');
INSERT INTO Pessoa VALUES (649135007,'Georgia Sears','3272 Arcu. St.','F','1987-08-25','Austrália');
INSERT INTO Pessoa VALUES (848746634,'Kiara Jarvis','642-5159 Vivamus Avenue','F','1988-12-12','Portugal');
INSERT INTO Pessoa VALUES (689595583,'Alma Swanson','P.O. Box 427, 9726 Vulputate Ave','F','1981-06-14','Portugal');
INSERT INTO Pessoa VALUES (327760545,'Rudyard Hull','P.O. Box 402, 8601 Consequat Rd.','M','1987-04-10','Portugal');
INSERT INTO Pessoa VALUES (650317465,'Helen Johns','Ap #928-9958 Libero. Ave','F','1981-01-04','Portugal');
INSERT INTO Pessoa VALUES (687667012,'Scarlet Hewitt','P.O. Box 322, 9776 Egestas Rd.','F','1980-04-10','Portugal');
INSERT INTO Pessoa VALUES (687032777,'Macy Day','Ap #111-1051 Urna, St.','F','1989-08-07','Austrália');
INSERT INTO Pessoa VALUES (842725632,'Laith Soto','2416 Ultricies Rd.','F','1985-11-26','Austrália');
INSERT INTO Pessoa VALUES (345776988,'Maxwell Kidd','P.O. Box 751, 8581 Congue. Street','M','1989-04-03','Portugal');
INSERT INTO Pessoa VALUES (759497796,'Dillon Huber','267-715 Phasellus Rd.','F','1988-11-27','Portugal');
INSERT INTO Pessoa VALUES (664020282,'Willow Houston','Ap #933-7342 A, Road','M','1984-06-02','Portugal');
INSERT INTO Pessoa VALUES (452873720,'Pascale Robles','354-9065 Nisi. Rd.','M','1987-04-07','Espanha');
INSERT INTO Pessoa VALUES (279968674,'Mason Patterson','3425 Suscipit Avenue','M','1980-03-10','Portugal');
INSERT INTO Pessoa VALUES (384917137,'Holly Anderson','Ap #294-9531 Sed St.','F','1984-11-24','Portugal');
INSERT INTO Pessoa VALUES (402135087,'Roary Lambert','Ap #434-5438 Eget Avenue','M','1988-10-17','Portugal');
INSERT INTO Pessoa VALUES (268054936,'Emily Atkinson','571-6782 Erat Av.','F','1990-01-31','Portugal');
INSERT INTO Pessoa VALUES (702765534,'Lacota Bowen','Ap #625-5475 Nullam St.','F','1980-04-26','Portugal');
INSERT INTO Pessoa VALUES (867567309,'Justin James','Ap #588-7150 Orci, Ave','M','1983-04-03','Portugal');
INSERT INTO Pessoa VALUES (719370836,'Zephania Swanson','Ap #338-6026 Ultrices. Road','F','1980-05-16','Espanha');
INSERT INTO Pessoa VALUES (214316401,'Baxter Wood','988-6254 Nisi Rd.','M','1985-04-13','Portugal');
INSERT INTO Pessoa VALUES (331316563,'Eleanor Tran','Ap #573-5923 Tempus Street','F','1983-02-25','Portugal');
INSERT INTO Pessoa VALUES (690549936,'Kenneth Sweeney','131-5183 Magna. St.','M','1989-12-15','Portugal');
INSERT INTO Pessoa VALUES (211331354,'Felix Holloway','8564 Fringilla Ave','M','1987-09-26','Espanha');
INSERT INTO Pessoa VALUES (337070355,'Grady Waller','6338 Morbi St.','M','1989-12-01','Austrália');
INSERT INTO Pessoa VALUES (393744021,'Finn Osborn','Ap #731-2522 Vulputate Av.','M','1986-08-23','Espanha');
INSERT INTO Pessoa VALUES (837133825,'Sawyer Bray','555-1353 Mauris St.','M','1985-06-18','Espanha');
INSERT INTO Pessoa VALUES (493487597,'Idola Battle','208-4733 Arcu. Rd.','F','1986-06-01','Portugal');
INSERT INTO Pessoa VALUES (560717123,'Cynthia Floyd','Ap #726-8461 Sodales Road','F','1987-04-07','Espanha');
INSERT INTO Pessoa VALUES (883870725,'Ignatius Holland','1787 Rutrum St.','M','1986-11-01','Portugal');
INSERT INTO Pessoa VALUES (110095596,'Charde Camacho','602-9318 Luctus, Ave','M','1981-05-19','Portugal');
INSERT INTO Pessoa VALUES (149612512,'Adrian Mcintosh','P.O. Box 712, 2289 Turpis Rd.','M','1984-07-31','Portugal');
INSERT INTO Pessoa VALUES (872715048,'Adele Porter','Ap #382-9513 Id, St.','F','1981-11-08','Portugal');
INSERT INTO Pessoa VALUES (350679118,'Chase Mathis','Ap #162-1612 Condimentum. Rd.','M','1980-08-11','Portugal');
INSERT INTO Pessoa VALUES (520382478,'Ishmael Stevens','4315 Et St.','M','1986-12-18','Portugal');
INSERT INTO Pessoa VALUES (162374251,'Harlan Slater','309-9090 Ornare Av.','M','1988-05-29','Espanha');
INSERT INTO Pessoa VALUES (566223289,'Michael Conley','672 Iaculis Road','M','1981-08-30','Portugal');
INSERT INTO Pessoa VALUES (767248358,'Nita Ross','Ap #132-1232 Risus. Rd.','F','1982-05-02','Portugal');
INSERT INTO Pessoa VALUES (581963682,'Cheryl Holland','8479 Auctor St.','F','1989-12-26','Portugal');
INSERT INTO Pessoa VALUES (246457932,'Pamela Vinson','P.O. Box 999, 9547 Varius. Street','F','1985-11-06','Portugal');
INSERT INTO Pessoa VALUES (182734034,'Chadwick Prince','1359 Tincidunt, Rd.','M','1982-10-30','Espanha');

INSERT INTO Pessoa VALUES (440925049,'Garth George','Ap #626-9050 Nec Avenue','M','1984-03-05','Espanha');
INSERT INTO Pessoa VALUES (586010744,'Louis Raymond','759-2197 Sodales Avenue','M','1984-06-07','Portugal');
INSERT INTO Pessoa VALUES (482036360,'Breanna Hill','Ap #774-9530 Arcu. Street','F','1983-08-22','Portugal');
INSERT INTO Pessoa VALUES (342938934,'Christopher Burke','4843 Pellentesque Rd.','M','1987-08-25','Portugal');
INSERT INTO Pessoa VALUES (337159639,'Julie Carroll','2578 Urna Rd.','F','1984-06-19','Portugal');
INSERT INTO Pessoa VALUES (812457849,'Ayanna Carver','292-7022 Nunc Road','F','1981-02-11','Portugal');
INSERT INTO Pessoa VALUES (706734793,'Reagan Reed','833-6141 Pharetra Road','M','1987-09-09','Portugal');
INSERT INTO Pessoa VALUES (774198838,'Kameko Hogan','P.O. Box 765, 7516 Nisl St.','M','1990-02-11','Portugal');
INSERT INTO Pessoa VALUES (647032341,'Nehru Griffith','P.O. Box 649, 1964 Eu Rd.','F','1981-07-15','Portugal');
INSERT INTO Pessoa VALUES (192724629,'Bradley Ortega','P.O. Box 828, 6173 Vestibulum Rd.','M','1983-11-12','Espanha');
INSERT INTO Pessoa VALUES (649135007,'Georgia Sears','3272 Arcu. St.','F','1987-08-25','Austrália');
INSERT INTO Pessoa VALUES (848746634,'Kiara Jarvis','642-5159 Vivamus Avenue','F','1988-12-12','Portugal');
INSERT INTO Pessoa VALUES (689595583,'Alma Swanson','P.O. Box 427, 9726 Vulputate Ave','F','1981-06-14','Portugal');
INSERT INTO Pessoa VALUES (327760545,'Rudyard Hull','P.O. Box 402, 8601 Consequat Rd.','M','1987-04-10','Portugal');
INSERT INTO Pessoa VALUES (650317465,'Helen Johns','Ap #928-9958 Libero. Ave','F','1981-01-04','Portugal');
INSERT INTO Pessoa VALUES (687667012,'Scarlet Hewitt','P.O. Box 322, 9776 Egestas Rd.','F','1980-04-10','Portugal');
INSERT INTO Pessoa VALUES (687032777,'Macy Day','Ap #111-1051 Urna, St.','F','1989-08-07','Austrália');
INSERT INTO Pessoa VALUES (842725632,'Laith Soto','2416 Ultricies Rd.','F','1985-11-26','Austrália');
INSERT INTO Pessoa VALUES (345776988,'Maxwell Kidd','P.O. Box 751, 8581 Congue. Street','M','1989-04-03','Portugal');
INSERT INTO Pessoa VALUES (759497796,'Dillon Huber','267-715 Phasellus Rd.','F','1988-11-27','Portugal');
INSERT INTO Pessoa VALUES (664020282,'Willow Houston','Ap #933-7342 A, Road','M','1984-06-02','Portugal');
INSERT INTO Pessoa VALUES (452873720,'Pascale Robles','354-9065 Nisi. Rd.','M','1987-04-07','Espanha');
INSERT INTO Pessoa VALUES (279968674,'Mason Patterson','3425 Suscipit Avenue','M','1980-03-10','Portugal');
INSERT INTO Pessoa VALUES (384917137,'Holly Anderson','Ap #294-9531 Sed St.','F','1984-11-24','Portugal');
INSERT INTO Pessoa VALUES (402135087,'Roary Lambert','Ap #434-5438 Eget Avenue','M','1988-10-17','Portugal');
INSERT INTO Pessoa VALUES (268054936,'Emily Atkinson','571-6782 Erat Av.','F','1990-01-31','Portugal');
INSERT INTO Pessoa VALUES (702765534,'Lacota Bowen','Ap #625-5475 Nullam St.','F','1980-04-26','Portugal');
INSERT INTO Pessoa VALUES (867567309,'Justin James','Ap #588-7150 Orci, Ave','M','1983-04-03','Portugal');
INSERT INTO Pessoa VALUES (719370836,'Zephania Swanson','Ap #338-6026 Ultrices. Road','F','1980-05-16','Espanha');
INSERT INTO Pessoa VALUES (214316401,'Baxter Wood','988-6254 Nisi Rd.','M','1985-04-13','Portugal');
INSERT INTO Pessoa VALUES (331316563,'Eleanor Tran','Ap #573-5923 Tempus Street','F','1983-02-25','Portugal');
INSERT INTO Pessoa VALUES (690549936,'Kenneth Sweeney','131-5183 Magna. St.','M','1989-12-15','Portugal');
INSERT INTO Pessoa VALUES (211331354,'Felix Holloway','8564 Fringilla Ave','M','1987-09-26','Espanha');
INSERT INTO Pessoa VALUES (337070355,'Grady Waller','6338 Morbi St.','M','1989-12-01','Austrália');
INSERT INTO Pessoa VALUES (393744021,'Finn Osborn','Ap #731-2522 Vulputate Av.','M','1986-08-23','Espanha');
INSERT INTO Pessoa VALUES (837133825,'Sawyer Bray','555-1353 Mauris St.','M','1985-06-18','Espanha');
INSERT INTO Pessoa VALUES (493487597,'Idola Battle','208-4733 Arcu. Rd.','F','1986-06-01','Portugal');
INSERT INTO Pessoa VALUES (560717123,'Cynthia Floyd','Ap #726-8461 Sodales Road','F','1987-04-07','Espanha');
INSERT INTO Pessoa VALUES (883870725,'Ignatius Holland','1787 Rutrum St.','M','1986-11-01','Portugal');
INSERT INTO Pessoa VALUES (110095596,'Charde Camacho','602-9318 Luctus, Ave','M','1981-05-19','Portugal');

-- Table: Premio
DROP TABLE IF EXISTS Premio;

CREATE TABLE Premio (
    CampeonatoID  INTEGER NOT NULL REFERENCES Campeonato (CampeonatoID),
    CategoriaNome TEXT NOT NULL   REFERENCES Categoria (CategoriaNome),
    Valor         INTEGER NOT NULL
);

--Verificar se tao todas
INSERT INTO Premio VALUES(1, 'Men´s Physique', 5000);
INSERT INTO Premio VALUES(1, 'Women´s Physique', 4500);
INSERT INTO Premio VALUES(1, 'Women´s Bikini Fitness', 4000);
INSERT INTO Premio VALUES(2, 'Men´s Physique', 3000);
INSERT INTO Premio VALUES(2, 'Women´s Physique', 2000);
INSERT INTO Premio VALUES(2, 'Women´s Bikini Physique', 1000);

-- Table: TipoDePatrocinio
DROP TABLE IF EXISTS TipoDePatrocinio;

CREATE TABLE TipoDePatrocinio (
    Tipo       TEXT NOT NULL PRIMARY KEY,
    Patrocinio TEXT NOT NULL  REFERENCES Patrocinio (PatrocinioNome) 
);

INSERT INTO TipoDePatrocinio VALUES('Sapatilhas', 'Nike');
INSERT INTO TipoDePatrocinio VALUES('Camisolas', 'Nike');
INSERT INTO TipoDePatrocinio VALUES('Suplementos', 'Prozis');
INSERT INTO TipoDePatrocinio VALUES('Suplementos', 'USN');
INSERT INTO TipoDePatrocinio VALUES('Suplementos', 'ON');
INSERT INTO TipoDePatrocinio VALUES('Roupa', 'Dedicated Division');
INSERT INTO TipoDePatrocinio VALUES('Roupa', 'Gymshark');
INSERT INTO TipoDePatrocinio VALUES('Dinheiro', 'Gold');

-- Table: Treinador
DROP TABLE IF EXISTS Treinador;

CREATE TABLE Treinador (
    CC           INTEGER NOT NULL  REFERENCES Pessoa (CC),
    DataDeAdesao DATE NOT NULL ,
    Equipa       TEXT REFERENCES Equipa (EquipaNome) 
);

--Change CC
INSERT INTO Treinador VALUES(CC, 25-10-1994, 'ON');
INSERT INTO Treinador VALUES(CC, 11-03-1992, 'Dedicated Division');
INSERT INTO Treinador VALUES(CC, 13-02-2010, 'USN');
INSERT INTO Treinador VALUES(CC, 14-08-2015, NULL);
INSERT INTO Treinador VALUES(CC, 15-12-1997, NULL);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
