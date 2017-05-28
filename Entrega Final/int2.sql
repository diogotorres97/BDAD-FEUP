.mode columns
.headers on
.nullvalue NULL

--2. Quais os 5 patrocinios que dao mais dinheiro em média por campeonato?

create view atletasCampeonato as  Select DISTINCT Atleta.AtletaCC, Campeonato.ID as CampeonatoID, Classificacao.Fase
from Atleta, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Campeonato.ID =  Classificacao.CampeonatoID
  AND
  Classificacao.Fase='Eliminatoria');

  
create view dinheiroPatrocinioPorCampeonato as 
Select Nome, atletasCampeonato.CampeonatoID, COUNT(PatrocinioNome) as Counter ,Valor, COUNT(PatrocinioNome)*Valor as Total
from Atleta, AtletaPatrocinio,Patrocinio, atletasCampeonato
where (atletasCampeonato.AtletaCC = Atleta.AtletaCC AND
  Atleta.AtletaCC = AtletaPatrocinio.AtletaCC AND AtletaPatrocinio.PatrocinioNome= Patrocinio.Nome)
group by PatrocinioNome, CampeonatoID
ORDER BY Total;


Select Nome, AVG(Total) as MediaTotal
from dinheiroPatrocinioPorCampeonato
group by Nome
order by MediaTotal desc limit 5;


drop view if exists atletasCampeonato;
drop view if exists dinheiroPatrocinioPorCampeonato;