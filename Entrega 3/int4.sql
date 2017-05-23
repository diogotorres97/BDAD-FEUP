.mode columns
.headers on
.nullvalue NULL

--4.  Quais os juris só com jurados do mesmo pais?
´Qual o atleta com mais vitorias

--sem o desc

drop view if exists Temp;

create view Temp as  select DISTINCT Atleta.AtletaCC, Campeonato.ID, Classificacao.Fase
from Atleta, Juri, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Juri.ID = Classificacao.JuriID
  AND
  Juri.CampeonatoID = Campeonato.ID
AND
Classificacao.Fase = 'Final'
AND
Classificacao.Pontos = '0');

Select Temp.AtletaCC, COUNT(Temp.AtletaCC) as Victories
from Temp
group by Temp.AtletaCC
ORDER BY Victories desc limit 1;
