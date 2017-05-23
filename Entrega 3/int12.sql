.mode columns
.headers on
.nullvalue NULL

-- 12.Quantas vezes um determinado juri avaliou os atletas

drop view if exists Temp;
create view Temp as  select DISTINCT Atleta.AtletaCC, Campeonato.ID, Classificacao.Fase, Classificacao.JuriID
from Atleta, Juri, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Juri.ID = Classificacao.JuriID
  AND
  Juri.CampeonatoID = Campeonato.ID);

  
  Select Temp.AtletaCC, JuriID, COUNT(Temp.AtletaCC) as NumberAvaliations
  from Temp
  where(Temp.JuriID = '1')
  group by(Temp.AtletaCC)
  order by NumberAvaliations DESC;
  