-- Gatilho que impede a inscrição de um atleta se o seu peso e altura  
-- nao estiverem dentro dos parametros da categoria a qual se quer inscrever

--Peso e altura Categoria


CREATE TRIGGER pesoAlturaCategoria
BEFORE INSERT ON Atleta
FOR EACH ROW
WHEN (new.Peso < (Select PesoMinimo from Categoria where Categoria.Nome = new.CategoriaNome)
OR new.Peso > (Select PesoMaximo from Categoria where Categoria.Nome = new.CategoriaNome)

OR new.Altura > (Select AlturaMaxima from Categoria where Categoria.Nome = new.CategoriaNome)
OR new.Altura < (Select AlturaMinima from Categoria where Categoria.Nome = new.CategoriaNome))

BEGIN
SELECT RAISE(rollback, 'Peso ou Altura ou Genero invalidos.');
END;


