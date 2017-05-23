.mode columns
.headers on
.nullvalue NULL

-- 6.Quais os atletas estrangeiros que participam numa competicao?


drop view if exists Temp;

create view Temp as  select DISTINCT Atleta.AtletaCC, Campeonato.ID, Campeonato.Pais, Classificacao.Fase
from Atleta, Juri, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Juri.ID = Classificacao.JuriID
  AND
  Juri.CampeonatoID = Campeonato.ID
AND
Classificacao.Fase = 'Eliminatoria');


Select DISTINCT Temp.AtletaCC, Pessoa.Pais
from Temp, Pessoa
where(Temp.AtletaCC = Pessoa.CC AND Temp.Pais <> Pessoa.Pais)
ORDER BY Pessoa.Pais ASC;
