-- Gatilho que impede a inscrição de um atleta se o seu genero 
-- nao estiverem dentro do genero da categoria a qual se quer inscrever


drop view if exists atletaGenero;

create view atletaGenero as 
Select AtletaCC, Genero
from Atleta,Pessoa 
Where (Atleta.AtletaCC=Pessoa.CC);

drop view if exists categoriaGenero;

create view categoriaGenero as 
Select Nome, Genero
from Categoria;


CREATE TRIGGER checkGeneroCategoria
BEFORE INSERT ON Atleta
FOR EACH ROW
WHEN ( ( Select Genero from atletaGenero where atletaGenero.AtletaCC = new.AtletaCC)
 <> 
(Select Genero from CategoriaGenero where new.CategoriaNome = CategoriaGenero.Nome))
BEGIN
SELECT RAISE(rollback, 'Genero invalidos.');
END;



