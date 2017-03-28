
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Atleta
DROP TABLE IF EXISTS Atleta;

CREATE TABLE Atleta (
    CC          INTEGER PRIMARY KEY,
    Peso        DECIMAL,
    Altura      INTEGER,
	EquipaNome TEXT REFERENCES Equipa(Nome),
	TreinadorCC INTEGER REFERENCES Treinador(CC),
	CategoriaNome TEXT REFERENCES Categoria(Nome)
);


-- Table: AtletaPatrocinio
DROP TABLE IF EXISTS AtletaPatrocinio;

CREATE TABLE AtletaPatrocinio (
    AtletaCC   INTEGER REFERENCES Atleta (CC),
    NomeEquipa TEXT    REFERENCES Patrocinio (Nome) 
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


-- Table: Fase
DROP TABLE IF EXISTS Fase;

CREATE TABLE Fase (
    Nome TEXT PRIMARY KEY
);


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


-- Table: Patrocinio
DROP TABLE IF EXISTS Patrocinio;

CREATE TABLE Patrocinio (
    Nome  TEXT PRIMARY KEY,
    Valor INTEGER
);


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


-- Table: Treinador
DROP TABLE IF EXISTS Treinador;

CREATE TABLE Treinador (
    CC           INTEGER REFERENCES Pessoa (CC),
    DataDeAdesao DATE,
    Equipa       TEXT    REFERENCES Equipa (Nome) 
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
