.mode columns
.headers on
.nullvalue NULL

--2. Atletas que passaram a final no campeonato 2.

Select DISTINCT Atleta.AtletaCC, Campeonato.ID as CampeonatoID, Classificacao.Fase
from Atleta, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Classificacao.CampeonatoID = '2'
  AND
  Campeonato.ID = '2'
  AND
  Classificacao.Fase='Final');
