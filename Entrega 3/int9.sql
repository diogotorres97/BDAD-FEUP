.mode columns
.headers on
.nullvalue NULL

-- 9.Qual a equipa com mais vitorias

drop view if exists Temp;

create view Temp as  select DISTINCT Atleta.AtletaCC, Campeonato.ID, Classificacao.Fase, Atleta.EquipaNome
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

create view Temp2 as Select Temp.AtletaCC, COUNT(DISTINCT Temp.AtletaCC) as Victories, Temp.EquipaNome
from Temp
group by Temp.AtletaCC
ORDER BY Victories desc limit 3;

Select EquipaNome, COUNT(Temp2.EquipaNome) as CounterVictories
from Temp2
where (EquipaNome is not NULL)
group by Temp2.EquipaNome
ORDER BY CounterVictories desc limit 1;
