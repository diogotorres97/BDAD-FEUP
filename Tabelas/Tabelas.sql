
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Atleta
DROP TABLE IF EXISTS Atleta;

CREATE TABLE Atleta (
    CC          INTEGER NOT NULL PRIMARY KEY,
    Peso        DECIMAL NOT NULL,
    Altura      DECIMAL NOT NULL,
	EquipaNome TEXT REFERENCES Equipa(Nome),
	TreinadorCC INTEGER REFERENCES Treinador(CC),
	CategoriaNome TEXT NOT NULL REFERENCES Categoria(Nome)
);
-- Alterar valores do CC para valores existentes

INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women’s Physique');

INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women´s Bikini Fitness');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Women´s Bikini Fitness');


INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');
INSERT INTO Atleta VALUES (289443867,160,62,'Gold',NULL,'Men’s Physique');




-- Table: AtletaPatrocinio
DROP TABLE IF EXISTS AtletaPatrocinio;

CREATE TABLE AtletaPatrocinio (
    AtletaCC   INTEGER REFERENCES Atleta (CC),
    NomePatrocinio TEXT REFERENCES Patrocinio (Nome) 
);




-- Table: Campeonato
DROP TABLE IF EXISTS Campeonato;

CREATE TABLE Campeonato (
    ID         INTEGER PRIMARY KEY,
    Nome       TEXT,
    Local      TEXT,
    DataInicio DATE,
    DataFim    DATE,
    Pais       TEXT    REFERENCES Pais (Pais) 
);

INSERT INTO Campeonato VALUES (1,'Nacional', 'Porto', '2017-07-10', '2017-07-12', 'Portugal');
INSERT INTO Campeonato VALUES (2,'Regional', 'Esposende', '2017-08-21', '2017-08-23', 'Portugal');
INSERT INTO Campeonato VALUES (3, 'Distrital', 'Lisboa', '2017-11-07', '2017-11-09', 'Portugal');


-- Table: CampeonatoCategoriaFase
DROP TABLE IF EXISTS CampeonatoCategoriaFase;

CREATE TABLE CampeonatoCategoriaFase (
    IDCampeonato  INTEGER REFERENCES Campeonato (ID),
    CategoriaNome TEXT    REFERENCES Categoria (Nome),
    FaseNome      TEXT    REFERENCES Fase (Nome) 
);


-- Table: Categoria
DROP TABLE IF EXISTS Categoria;

CREATE TABLE Categoria (
    Nome                TEXT    PRIMARY KEY,
    NumMaxParticipantes INTEGER,
    AlturaMinima        INTEGER,
    AlturaMaxima        INTEGER,
    PesoMinimo          DECIMAL,
    PesoMaximo          DECIMAL,
    Genero              CHAR
);

INSERT INTO Categoria VALUES ('Muscular Physique',4, 155, 165, 55, 65, 'M');
INSERT INTO Categoria VALUES ('Wellness',4, 166, 175, 66, 75, 'M');
INSERT INTO Categoria VALUES ('Muscular Dominian',4, 176, 185, 76, 85, 'M');
INSERT INTO Categoria VALUES ('Culturismo Classico',4, 186, 195, 86, 95, 'M');
INSERT INTO Categoria VALUES ('Culturismo Master',4, 196, 205, 96, 105, 'M');
INSERT INTO Categoria VALUES ('Women’s Physique',4, 155, 165, 55, 65, 'F');
INSERT INTO Categoria VALUES ('Bikini Fitness',4, 166, 175, 66, 75, 'F');
INSERT INTO Categoria VALUES ('Women´s Classic',4, 176, 185, 76, 85, 'F');
INSERT INTO Categoria VALUES ('Women´s Muscular',4, 186, 195, 86, 95, 'F');
INSERT INTO Categoria VALUES ('Women´s Master',4, 196, 205, 96, 105, 'F');


-- Table: Classificacao
DROP TABLE IF EXISTS Classificacao;

CREATE TABLE Classificacao (
    AtletaCC INTEGER REFERENCES Atleta (CC),
    JuriID   INTEGER REFERENCES Juri (ID),
    Pontos   INTEGER
);


-- Table: DataCat
DROP TABLE IF EXISTS DataCat;

CREATE TABLE DataCat (
    NomeCategoria TEXT    REFERENCES Categoria (Nome),
    NomeFase      TEXT    REFERENCES Fase (Nome),
	IDCampeonato  TEXT    REFERENCES Campeonato (ID),
    Dia           INTEGER,
    Hora          TEXT
);


-- Table: Equipa
DROP TABLE IF EXISTS Equipa;

CREATE TABLE Equipa (
    Nome  TEXT PRIMARY KEY,
    Local TEXT
);

INSERT INTO Equipa VALUES('Gold', 'Freixieiro');
INSERT INTO Equipa VALUES('Silver', 'Amadora');
INSERT INTO Equipa VALUES('Bronze', 'Vila Franca de Xira');


-- Table: Fase
DROP TABLE IF EXISTS Fase;

CREATE TABLE Fase (
    Nome TEXT PRIMARY KEY
);

INSERT INTO Fase VALUES('Meia-final');
INSERT INTO Fase VALUES('Final');


-- Table: Jurado
DROP TABLE IF EXISTS Jurado;

CREATE TABLE Jurado (
    CC     INTEGER PRIMARY KEY,
    JuriID INTEGER REFERENCES Juri (ID) 
);


-- Table: Juri
DROP TABLE IF EXISTS Juri;

CREATE TABLE Juri (
    ID INTEGER PRIMARY KEY
);



-- Table: Pais
DROP TABLE IF EXISTS Pais;

CREATE TABLE Pais (
    Pais TEXT PRIMARY KEY
);

INSERT INTO Pais VALUES ('Portugal');
INSERT INTO Pais VALUES ('Espanha');
INSERT INTO Pais VALUES ('Austrália');


-- Table: Patrocinio
DROP TABLE IF EXISTS Patrocinio;

CREATE TABLE Patrocinio (
    Nome  TEXT PRIMARY KEY,
    Valor INTEGER
);

INSERT INTO Patrocinio VALUES('Nike', 4);
INSERT INTO Patrocinio VALUES('Prozis', 10);


-- Table: Pessoa
DROP TABLE IF EXISTS Pessoa;

CREATE TABLE Pessoa (
    CC             INTEGER PRIMARY KEY,
    Nome           TEXT,
    Morada         TEXT,
    Genero         CHAR,
    DataNascimento DATE,
    Pais           TEXT    REFERENCES Pais (Pais) 
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
    CampeonatoID  INTEGER REFERENCES Campeonato (ID),
    CategoriaNome TEXT    REFERENCES Categoria (Nome),
    Valor         INTEGER
);


-- Table: TipoDePatrocinio
DROP TABLE IF EXISTS TipoDePatrocinio;

CREATE TABLE TipoDePatrocinio (
    Tipo       TEXT PRIMARY KEY,
    Patrocinio TEXT REFERENCES Patrocinio (Nome) 
);

INSERT INTO TipoDePatrocinio VALUES('Sapatilhas', 'Nike');
INSERT INTO TipoDePatrocinio VALUES('Camisolas', 'Nike');
INSERT INTO TipoDePatrocinio VALUES('Suplementos', 'Prozis');

-- Table: Treinador
DROP TABLE IF EXISTS Treinador;

CREATE TABLE Treinador (
    CC           INTEGER REFERENCES Pessoa (CC),
    DataDeAdesao DATE,
    Equipa       TEXT    REFERENCES Equipa (Nome) 
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
