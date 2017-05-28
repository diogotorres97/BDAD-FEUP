.mode columns
.headers on
.nullvalue NULL

-- 6.Qual o top5 de atletas que receberam o maior premio de sempre?

create view vencedoresCampeonato as  Select DISTINCT Atleta.AtletaCC, Pessoa.Nome, Campeonato.ID, Classificacao.Fase, Atleta.CategoriaNome
from Atleta, Campeonato,Classificacao, Pessoa
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Atleta.AtletaCC = Pessoa.CC
  AND
  Classificacao.CampeonatoID =  Campeonato.ID
  AND
  Classificacao.Fase='Final'
  AND
  Classificacao.Pontos = '0');
  

create view premioCategoriaCampeonato as select DISTINCT  CampeonatoID, CategoriaNome, Valor
  from Premio;
  

Select vencedoresCampeonato.AtletaCC, vencedoresCampeonato.Nome, vencedoresCampeonato.CategoriaNome, SUM(Valor) as TotalReceived
from vencedoresCampeonato, premioCategoriaCampeonato
where(vencedoresCampeonato.ID = premioCategoriaCampeonato.CampeonatoID
AND vencedoresCampeonato.CategoriaNome = premioCategoriaCampeonato.CategoriaNome)
group by vencedoresCampeonato.AtletaCC 
order by TotalReceived DESC limit 5 ;
 
 
drop view if exists vencedoresCampeonato;
drop view if exists premioCategoriaCampeonato;