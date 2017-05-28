-- Gatilho que impede a inscrição de um atleta se o seu peso e altura e genero
-- nao estiverem dentro dos parametros da categoria a qual se quer inscrever

drop view if exists atletaGenero;

create view atletaGenero as 
Select AtletaCC, Genero
from Atleta,Pessoa 
Where (Atleta.AtletaCC=Pessoa.CC);

drop view if exists categoriaGenero;

create view categoriaGenero as 
Select Nome, Genero
from Categoria;

CREATE TRIGGER pesoAlturaGeneroCategoria
BEFORE INSERT ON Atleta
FOR EACH ROW
WHEN (new.Peso < (Select PesoMinimo from Categoria where Categoria.Nome = new.CategoriaNome)
OR new.Peso > (Select PesoMaximo from Categoria where Categoria.Nome = new.CategoriaNome)
OR new.Altura > (Select AlturaMaxima from Categoria where Categoria.Nome = new.CategoriaNome)
OR new.Altura < (Select AlturaMinima from Categoria where Categoria.Nome = new.CategoriaNome)
OR ( Select Genero from atletaGenero where atletaGenero.AtletaCC = new.AtletaCC)
 <> 
(Select Genero from CategoriaGenero where new.CategoriaNome = CategoriaGenero.Nome))

BEGIN
SELECT RAISE(rollback, 'Peso ou Altura ou Genero invalidos.');
END;


