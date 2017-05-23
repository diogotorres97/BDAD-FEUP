.mode columns
.headers on
.nullvalue NULL

--3. Quais os 5 patrocinios que dao mais dinheiro em média por campeonato?

drop view if exists atletasCampeonato;

create view atletasCampeonato as  Select DISTINCT Atleta.AtletaCC, Campeonato.ID as CampeonatoID, Classificacao.Fase
from Atleta, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Campeonato.ID =  Classificacao.CampeonatoID
  AND
  Classificacao.Fase='Eliminatoria');

drop view if exists dinheiroPatrocinioPorCampeonato;

create view dinheiroPatrocinioPorCampeonato as 
Select Nome, atletasCampeonato.CampeonatoID, COUNT(PatrocinioNome) as Counter ,Valor, COUNT(PatrocinioNome)*Valor as Total
from Atleta, AtletaPatrocinio,Patrocinio, atletasCampeonato
where (atletasCampeonato.AtletaCC = Atleta.AtletaCC AND
  Atleta.AtletaCC = AtletaPatrocinio.AtletaCC AND AtletaPatrocinio.PatrocinioNome= Patrocinio.Nome)
group by PatrocinioNome, CampeonatoID
ORDER BY Total;-- desc limit 5;

Select Nome, AVG(Total) as MediaTotal
from dinheiroPatrocinioPorCampeonato
group by Nome
order by MediaTotal desc limit 5;
