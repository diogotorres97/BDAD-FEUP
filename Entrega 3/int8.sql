.mode columns
.headers on
.nullvalue NULL

-- 8.Qual o top5 de atletas que receberam o maior premio de sempre

--ACABAR ESTA

drop view if exists Temp;

create view Temp as  select DISTINCT Atleta.AtletaCC, Campeonato.ID, Classificacao.Fase, Atleta.CategoriaNome
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
create view Temp2 as select DISTINCT  CampeonatoID, CategoriaNome, Valor
  from Premio;
  
  
  /*
 
Select Temp.AtletaCC, Temp.CategoriaNome,CampeonatoID,  Valor
from Temp, Temp2
where(Temp.ID = Temp2.CampeonatoID
AND Temp.CategoriaNome = Temp2.CategoriaNome);
 */
Select Temp.AtletaCC, Temp.CategoriaNome, SUM(Valor) as TotalReceived
from Temp, Temp2
where(Temp.ID = Temp2.CampeonatoID
AND Temp.CategoriaNome = Temp2.CategoriaNome)
group by Temp.AtletaCC limit 5;
 
