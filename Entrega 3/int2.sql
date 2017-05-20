.mode columns
.headers on
.nullvalue NULL

--2. Atletas que passaram a final no campeonato X.

--Como fazer a ligação ao campeoanto??

Select DISTINCT *
from Atleta, Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
AND
Classificacao.Fase='Final' AND Classificacao.Pontos=0);
