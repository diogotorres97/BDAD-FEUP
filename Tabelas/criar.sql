
--PRAGMA foreign_keys = off;
--BEGIN TRANSACTION;

-- Table: Pais
DROP TABLE IF EXISTS Pais;

CREATE TABLE Pais (
    Pais TEXT NOT NULL PRIMARY KEY
);

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

-- Table: Equipa
DROP TABLE IF EXISTS Equipa;

CREATE TABLE Equipa (
    EquipaNome  TEXT NOT NULL PRIMARY KEY,
    Local TEXT NOT NULL
);


-- Table: Treinador
DROP TABLE IF EXISTS Treinador;

CREATE TABLE Treinador (
    TreinadorCC  INTEGER NOT NULL PRIMARY KEY REFERENCES Pessoa (CC),
    DataDeAdesao DATE NOT NULL ,
    Equipa       TEXT REFERENCES Equipa (EquipaNome)

);

-- Table: TipoDePatrocinio
DROP TABLE IF EXISTS TipoDePatrocinio;

CREATE TABLE TipoDePatrocinio (
    Tipo       TEXT NOT NULL PRIMARY KEY
);

-- Table: Patrocinio
DROP TABLE IF EXISTS Patrocinio;

CREATE TABLE Patrocinio (
    PatrocinioNome  TEXT  NOT NULL PRIMARY KEY,
    Valor INTEGER NOT NULL,
	Tipo TEXT NOT NULL REFERENCES TipoDePatrocinio(Tipo)
);


-- Table: Campeonato
DROP TABLE IF EXISTS Campeonato;

CREATE TABLE Campeonato (
    CampeonatoID  INTEGER NOT NULL PRIMARY KEY,
    Nome       TEXT NOT NULL,
    DataInicio DATE NOT NULL,
    DataFim    DATE NOT NULL,
    Pais       TEXT NOT NULL     REFERENCES Pais (Pais) 
);

-- Table: Categoria
DROP TABLE IF EXISTS Categoria;

CREATE TABLE Categoria (
    CategoriaNome                TEXT NOT NULL   PRIMARY KEY,
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
    NomeCategoria TEXT NOT NULL   REFERENCES Categoria (CategoriaNome),
	IDCampeonato  TEXT  NOT NULL  REFERENCES Campeonato (CampeonatoID),
    DiaElim           INTEGER NOT NULL,
    HoraElim          TEXT NOT NULL,
	DiaFinal          INTEGER NOT NULL,
    HoraFinal          TEXT NOT NULL
);


-- Table: Juri
DROP TABLE IF EXISTS Juri;

CREATE TABLE Juri (
    JuriID INTEGER NOT NULL PRIMARY KEY
);


-- Table: Jurado
DROP TABLE IF EXISTS Jurado;

CREATE TABLE Jurado (
    JuradoCC     INTEGER NOT NULL PRIMARY KEY REFERENCES Pessoa (CC),
    JuriID INTEGER NOT NULL REFERENCES Juri (JuriID) 
);


-- Table: Premio
DROP TABLE IF EXISTS Premio;

CREATE TABLE Premio (
    CampeonatoID  INTEGER NOT NULL REFERENCES Campeonato (CampeonatoID),
    CategoriaNome TEXT NOT NULL   REFERENCES Categoria (CategoriaNome),
    Valor         INTEGER NOT NULL
);


-- Table: Atleta
DROP TABLE IF EXISTS Atleta;

CREATE TABLE Atleta (
    AtletaCC          INTEGER NOT NULL PRIMARY KEY REFERENCES Pessoa (CC),
	Altura      DECIMAL NOT NULL,
    Peso        DECIMAL NOT NULL,
	EquipaNome TEXT REFERENCES Equipa(EquipaNome),
	TreinadorCC INTEGER REFERENCES Treinador(TreinadorCC),
	CategoriaNome TEXT NOT NULL REFERENCES Categoria(CategoriaNome)
);

-- Table: AtletaPatrocinio
DROP TABLE IF EXISTS AtletaPatrocinio;

CREATE TABLE AtletaPatrocinio (
    AtletaCC   INTEGER NOT NULL REFERENCES Atleta (AtletaCC),
    NomePatrocinio TEXT NOT NULL REFERENCES Patrocinio (PatrocinioNome) 
);


-- Table: Classificacao
DROP TABLE IF EXISTS Classificacao;

CREATE TABLE Classificacao (
    AtletaCC INTEGER NOT NULL REFERENCES Atleta (AtletaCC),
    JuriID   INTEGER NOT NULL REFERENCES Juri (JuriID),
    Pontos   INTEGER NOT NULL,
	Fase TEXT NOT NULL,
	CHECK(Fase == 'Eliminatoria' or Fase == 'Final')
);


--COMMIT TRANSACTION;
--PRAGMA foreign_keys = on;