.mode columns
.headers on
.nullvalue NULL

--4. Qual o atleta com mais vitorias?

drop view if exists atletasVencedores;

create view atletasVencedores as  Select DISTINCT Atleta.AtletaCC, Campeonato.ID as CampeonatoID, Classificacao.Fase
from Atleta, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Classificacao.CampeonatoID =  Campeonato.ID
  AND
  Classificacao.Fase='Final'
  AND
  Classificacao.Pontos = '0');
  
  
drop view if exists atletasVitorias;
create view atletasVitorias as Select atletasVencedores.AtletaCC, COUNT(atletasVencedores.AtletaCC) as Victories
from atletasVencedores
group by atletasVencedores.AtletaCC
ORDER BY Victories;

Select AtletaCC, MAX(Victories) as Victories
from atletasVitorias;
