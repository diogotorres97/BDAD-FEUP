.mode columns
.headers on
.nullvalue NULL

-- 10.Quais os 3 treinadores que tiveram mais atletas vencedores


drop view if exists Temp;

create view Temp as  select DISTINCT Atleta.AtletaCC, Campeonato.ID, Classificacao.Fase, Atleta.TreinadorCC
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


drop view if exists Temp2;

create view Temp2 as Select Temp.AtletaCC, COUNT(DISTINCT Temp.AtletaCC) as Victories, Temp.TreinadorCC
from Temp
group by Temp.AtletaCC
ORDER BY Victories;

Select TreinadorCC, COUNT(Temp2.TreinadorCC) as CounterVictories
from Temp2
where (TreinadorCC is not NULL)
group by Temp2.TreinadorCC
ORDER BY CounterVictories desc limit 3;
