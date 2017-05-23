.mode columns
.headers on
.nullvalue NULL

-- 8.Qual o top5 de atletas que receberam o maior premio de sempre?

--

drop view if exists vencedoresCampeonato;

create view vencedoresCampeonato as  select DISTINCT Atleta.AtletaCC, Campeonato.ID, Classificacao.Fase, Atleta.CategoriaNome
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


drop view if exists premioCategoriaCampeonato;
create view premioCategoriaCampeonato as select DISTINCT  CampeonatoID, CategoriaNome, Valor
  from Premio;
  

Select vencedoresCampeonato.AtletaCC, vencedoresCampeonato.CategoriaNome, SUM(Valor) as TotalReceived
from vencedoresCampeonato, premioCategoriaCampeonato
where(vencedoresCampeonato.ID = premioCategoriaCampeonato.CampeonatoID
AND vencedoresCampeonato.CategoriaNome = premioCategoriaCampeonato.CategoriaNome)
group by vencedoresCampeonato.AtletaCC 
order by TotalReceived DESC limit 5 ;
 
