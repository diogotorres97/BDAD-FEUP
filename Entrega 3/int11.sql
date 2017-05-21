.mode columns
.headers on
.nullvalue NULL

-- 11.Para um atleta saber qual a fase mais longe que chegou

drop view if exists Temp;

create view Temp as  select DISTINCT Atleta.AtletaCC, Campeonato.ID, Classificacao.Fase
from Atleta, Juri, Campeonato,Classificacao
where ( Atleta.AtletaCC='580495453'
AND
Classificacao.AtletaCC = '580495453'
  AND
  Juri.ID = Classificacao.JuriID
  AND
  Juri.CampeonatoID = Campeonato.ID);
  
  Select * 
  from Temp
  order by Temp.Fase DESC limit 1;
  

