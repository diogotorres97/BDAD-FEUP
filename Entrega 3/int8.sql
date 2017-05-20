.mode columns
.headers on
.nullvalue NULL

-- 8.Qual o top5 de atletas que receberam o maior premio de sempre

--ACABAR ESTA

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

drop view if exists Temp2;
create view Temp2 as select DISTINCT  CampeonatoID, CategoriaNome, Valor
  from Temp, Premio
  where(Temp.ID = Premio.CampeonatoID);
