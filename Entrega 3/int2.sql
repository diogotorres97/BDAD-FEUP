.mode columns
.headers on
.nullvalue NULL

--2. Atletas que passaram a final no campeonato 2.

Select DISTINCT Atleta.AtletaCC, Pessoa.Nome, Campeonato.ID as CampeonatoID, Classificacao.Fase
from Atleta, Campeonato,Classificacao, Pessoa
where ( Atleta.AtletaCC=Classificacao.AtletaCC
AND
 Atleta.AtletaCC = Pessoa.CC
  AND
  Classificacao.CampeonatoID = '2'
  AND
  Campeonato.ID = '2'
  AND
  Classificacao.Fase='Final');
