
--PRAGMA foreign_keys = off;
--BEGIN TRANSACTION;

-- Table: Pais
DROP TABLE IF EXISTS Pais;

CREATE TABLE Pais (
    Nome TEXT NOT NULL PRIMARY KEY
);

-- Table: Pessoa
DROP TABLE IF EXISTS Pessoa;

CREATE TABLE Pessoa (
    CC             INTEGER NOT NULL PRIMARY KEY,
    Nome           TEXT NOT NULL,
    Morada         TEXT NOT NULL,
    Genero         CHAR NOT NULL,
    DataNascimento DATE NOT NULL,
    Pais           TEXT NOT NULL   REFERENCES Pais (Nome) 
);

-- Table: Equipa
DROP TABLE IF EXISTS Equipa;

CREATE TABLE Equipa (
	Nome  TEXT NOT NULL PRIMARY KEY,
    Local TEXT NOT NULL
);


-- Table: Treinador
DROP TABLE IF EXISTS Treinador;

CREATE TABLE Treinador (
    CC  INTEGER NOT NULL PRIMARY KEY REFERENCES Pessoa (CC),
    DataDeAdesao DATE NOT NULL ,
    Equipa       TEXT REFERENCES Equipa (Nome)

);

-- Table: TipoDePatrocinio
DROP TABLE IF EXISTS TipoDePatrocinio;

CREATE TABLE TipoDePatrocinio (
    Tipo       TEXT NOT NULL PRIMARY KEY
);

-- Table: Patrocinio
DROP TABLE IF EXISTS Patrocinio;

CREATE TABLE Patrocinio (
    Nome  TEXT  NOT NULL PRIMARY KEY,
    Valor INTEGER NOT NULL,
	Tipo TEXT NOT NULL REFERENCES TipoDePatrocinio(Tipo)
);


-- Table: Campeonato
DROP TABLE IF EXISTS Campeonato;

CREATE TABLE Campeonato (
    ID  INTEGER NOT NULL PRIMARY KEY,
    Nome       TEXT NOT NULL,
    DataInicio DATE NOT NULL,
    DataFim    DATE NOT NULL,
    Pais       TEXT NOT NULL     REFERENCES Pais (Nome) 
);

-- Table: Categoria
DROP TABLE IF EXISTS Categoria;

CREATE TABLE Categoria (
    Nome                TEXT NOT NULL PRIMARY KEY,
    NumMaxParticipantes INTEGER NOT NULL,
    AlturaMinima        INTEGER NOT NULL,
    AlturaMaxima        INTEGER NOT NULL,
    PesoMinimo          DECIMAL NOT NULL,
    PesoMaximo          DECIMAL NOT NULL,
    Genero              CHAR NOT NULL
);

-- Table: DataCat
DROP TABLE IF EXISTS DataCat;

CREATE TABLE DataCat (
    NomeCategoria TEXT NOT NULL   REFERENCES Categoria (Nome),
	IDCampeonato  TEXT  NOT NULL  REFERENCES Campeonato (ID),
    DiaElim           INTEGER NOT NULL,
    HoraElim          TEXT NOT NULL,
	DiaFinal          INTEGER NOT NULL,
    HoraFinal          TEXT NOT NULL
);


-- Table: Juri
DROP TABLE IF EXISTS Juri;

CREATE TABLE Juri (
    ID INTEGER NOT NULL PRIMARY KEY
);


-- Table: Jurado
DROP TABLE IF EXISTS Jurado;

CREATE TABLE Jurado (
	CC     INTEGER NOT NULL PRIMARY KEY REFERENCES Pessoa (CC),
    IDJuri INTEGER NOT NULL REFERENCES Juri (ID) 
);


-- Table: Premio
DROP TABLE IF EXISTS Premio;

CREATE TABLE Premio (
    IDCampeonato  INTEGER NOT NULL REFERENCES Campeonato (ID),
    NomeCategoria TEXT NOT NULL   REFERENCES Categoria (Nome),
    Valor         INTEGER NOT NULL
);


-- Table: Atleta
DROP TABLE IF EXISTS Atleta;

CREATE TABLE Atleta (
    CC          INTEGER NOT NULL PRIMARY KEY REFERENCES Pessoa (CC),
	Altura      DECIMAL NOT NULL,
    Peso        DECIMAL NOT NULL,
	Equipa TEXT REFERENCES Equipa(Nome),
	TreinadorCC INTEGER REFERENCES Treinador(CC),
	NomeCategoria TEXT NOT NULL REFERENCES Categoria(Nome)
);

-- Table: AtletaPatrocinio
DROP TABLE IF EXISTS AtletaPatrocinio;

CREATE TABLE AtletaPatrocinio (
    AtletaCC   INTEGER NOT NULL REFERENCES Atleta (CC),
    NomePatrocinio TEXT NOT NULL REFERENCES Patrocinio (Nome) 
);


-- Table: Classificacao
DROP TABLE IF EXISTS Classificacao;

CREATE TABLE Classificacao (
    AtletaCC INTEGER NOT NULL REFERENCES Atleta (CC),
    JuriID   INTEGER NOT NULL REFERENCES Juri (ID),
    Pontos   INTEGER NOT NULL,
	Fase TEXT NOT NULL,
	CHECK(Fase == 'Eliminatoria' or Fase == 'Final')
);


--COMMIT TRANSACTION;
--PRAGMA foreign_keys = on;