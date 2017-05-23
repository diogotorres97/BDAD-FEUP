.mode columns
.headers on
.nullvalue NULL

-- 6.Quais os atletas estrangeiros que participam numa competicao X?


drop view if exists Temp;

create view Temp as  select DISTINCT Atleta.AtletaCC, Campeonato.ID, Campeonato.Pais, Classificacao.Fase
from Atleta, Juri, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Juri.ID = Classificacao.JuriID
  AND
  Juri.CampeonatoID = '1'
  AND
  Campeonato.ID = '1'
AND
Classificacao.Fase = 'Eliminatoria');


Select DISTINCT Temp.AtletaCC, Pessoa.Pais
from Temp, Pessoa
where(Temp.AtletaCC = Pessoa.CC AND Temp.Pais <> Pessoa.Pais)
ORDER BY Pessoa.Pais ASC;
