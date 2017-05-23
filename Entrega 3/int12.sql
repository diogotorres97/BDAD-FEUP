.mode columns
.headers on
.nullvalue NULL

-- 12.Quantas vezes um determinado juri avaliou os atletas?

drop view if exists countJurisAvaliations;
create view countJurisAvaliations as  select DISTINCT Atleta.AtletaCC, Campeonato.ID, Classificacao.Fase, Classificacao.JuriID
from Atleta, Juri, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Juri.ID = Classificacao.JuriID
  AND
  Juri.CampeonatoID = Campeonato.ID);

  
  Select countJurisAvaliations.AtletaCC, JuriID, COUNT(countJurisAvaliations.AtletaCC) as NumberAvaliations
  from countJurisAvaliations
  where(countJurisAvaliations.JuriID = '1')
  group by(countJurisAvaliations.AtletaCC)
  order by NumberAvaliations DESC;
  