.mode columns
.headers on
.nullvalue NULL

--2. Atletas que passaram a final no campeonato 2.

Select DISTINCT Atleta.AtletaCC, Campeonato.ID as CampeonatoID, Classificacao.Fase
from Atleta, Juri, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Juri.ID = Classificacao.JuriID
  AND
  Juri.CampeonatoID = Campeonato.ID
  AND
  Campeonato.ID = '2'
  AND
  Classificacao.Fase='Final');
