--
-- File generated with SQLiteStudio v3.1.1 on ter mar 28 17:18:13 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

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

INSERT INTO Categoria (Nome, NumMaxParticipantes, AlturaMinima, AlturaMaxima, PesoMinimo, PesoMaximo, Genero) VALUES ('Men''s Physique', 10, 165, 175, 69, 89, 'M');
INSERT INTO Categoria (Nome, NumMaxParticipantes, AlturaMinima, AlturaMaxima, PesoMinimo, PesoMaximo, Genero) VALUES ('Bikini Fitness', 10, 159, 169, 40, 55, 'F');
INSERT INTO Categoria (Nome, NumMaxParticipantes, AlturaMinima, AlturaMaxima, PesoMinimo, PesoMaximo, Genero) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO Categoria (Nome, NumMaxParticipantes, AlturaMinima, AlturaMaxima, PesoMinimo, PesoMaximo, Genero) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
