DROP TABLE IF EXISTS Classificacao;
DROP TABLE IF EXISTS AtletaPatrocinio;
DROP TABLE IF EXISTS Atleta;
DROP TABLE IF EXISTS Premio;
DROP TABLE IF EXISTS Jurado;
DROP TABLE IF EXISTS Juri;
DROP TABLE IF EXISTS DataCat;
DROP TABLE IF EXISTS Categoria;
DROP TABLE IF EXISTS Campeonato;
DROP TABLE IF EXISTS Patrocinio;
DROP TABLE IF EXISTS TipoDePatrocinio;
DROP TABLE IF EXISTS Treinador;
DROP TABLE IF EXISTS Equipa;
DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS Pais;

-- Table: Pais

CREATE TABLE Pais (
    Nome TEXT PRIMARY KEY
);

-- Table: Pessoa

CREATE TABLE Pessoa (
    CC             INTEGER PRIMARY KEY,
    Nome           TEXT NOT NULL,
    Morada         TEXT NOT NULL,
    Genero         CHAR NOT NULL,
    DataNascimento DATE NOT NULL,
    Pais           TEXT NOT NULL   REFERENCES Pais (Nome),
	CHECK (Genero == 'M' or Genero == 'F')
);

-- Table: Equipa

CREATE TABLE Equipa (
	Nome  TEXT PRIMARY KEY,
    Local TEXT NOT NULL
);

-- Table: Treinador

CREATE TABLE Treinador (
    TreinadorCC  INTEGER PRIMARY KEY REFERENCES Pessoa (CC),
    DataDeAdesao DATE NOT NULL ,
    Equipa       TEXT REFERENCES Equipa (Nome)
);

-- Table: TipoDePatrocinio

CREATE TABLE TipoDePatrocinio (
    Tipo       TEXT PRIMARY KEY
);

-- Table: Patrocinio

CREATE TABLE Patrocinio (
    Nome  TEXT  PRIMARY KEY,
    Valor INTEGER NOT NULL,
	Tipo TEXT NOT NULL REFERENCES TipoDePatrocinio(Tipo),
	CHECK (Valor > 0)
);

-- Table: Campeonato

CREATE TABLE Campeonato (
    ID  INTEGER PRIMARY KEY,
    Nome       TEXT NOT NULL,
    DataInicio DATE NOT NULL,
    DataFim    DATE NOT NULL,
    Pais       TEXT NOT NULL     REFERENCES Pais (Nome),
	CHECK(DataInicio <= DataFim)
);

-- Table: Categoria

CREATE TABLE Categoria (
    Nome                TEXT PRIMARY KEY,
    NumMaxParticipantes INTEGER NOT NULL,
    AlturaMinima        INTEGER NOT NULL,
    AlturaMaxima        INTEGER NOT NULL,
    PesoMinimo          DECIMAL NOT NULL,
    PesoMaximo          DECIMAL NOT NULL,
    Genero              CHAR NOT NULL,
	CHECK(AlturaMinima<AlturaMaxima),
	CHECK(PesoMinimo<PesoMaximo),
	CHECK (Genero == 'M' or Genero == 'F')
);

-- Table: DataCat

CREATE TABLE DataCat (
    NomeCategoria TEXT REFERENCES Categoria (Nome),
	IDCampeonato  TEXT REFERENCES Campeonato (ID),
    DiaElim           DATE NOT NULL,
    HoraElim          TEXT NOT NULL,
	DiaFinal          DATE NOT NULL,
    HoraFinal          TEXT NOT NULL,
	CHECK(DiaElim<=DiaFinal),
	PRIMARY KEY(NomeCategoria,IDCampeonato)
);


-- Table: Juri

CREATE TABLE Juri (
    ID INTEGER PRIMARY KEY,
    CampeonatoID INTEGER REFERENCES Campeonato(ID)
);


-- Table: Jurado

CREATE TABLE Jurado (
	JuradoCC     INTEGER REFERENCES Pessoa (CC),
	JuriID INTEGER REFERENCES Juri (ID),
	PRIMARY KEY(JuradoCC,JuriID)
);


-- Table: Premio

CREATE TABLE Premio (
    CampeonatoID  INTEGER REFERENCES Campeonato (ID),
    CategoriaNome TEXT REFERENCES Categoria (Nome),
    Valor         INTEGER NOT NULL,
	CHECK (Valor > 0),
	PRIMARY KEY(CampeonatoID,CategoriaNome)
);


-- Table: Atleta

CREATE TABLE Atleta (
    AtletaCC          INTEGER PRIMARY KEY REFERENCES Pessoa (CC),
	Altura      DECIMAL NOT NULL,
    Peso        DECIMAL NOT NULL,
	EquipaNome TEXT REFERENCES Equipa(Nome),
	TreinadorCC INTEGER REFERENCES Treinador(TreinadorCC),
	CategoriaNome TEXT NOT NULL REFERENCES Categoria(Nome)
);

-- Table: AtletaPatrocinio

CREATE TABLE AtletaPatrocinio (
    AtletaCC   INTEGER REFERENCES Atleta (AtletaCC),
    PatrocinioNome TEXT REFERENCES Patrocinio (Nome),
	PRIMARY KEY(AtletaCC, PatrocinioNome)
);


-- Table: Classificacao

CREATE TABLE Classificacao (
    AtletaCC INTEGER REFERENCES Atleta (AtletaCC),
    JuriID   INTEGER REFERENCES Juri (ID),
    Pontos   INTEGER NOT NULL,
	CampeonatoID INTEGER REFERENCES Campeonato(ID),
	Fase TEXT,
	CHECK(Fase == 'Eliminatoria' or Fase == 'Final'),
	PRIMARY KEY(AtletaCC, CampeonatoID, Fase)
);
