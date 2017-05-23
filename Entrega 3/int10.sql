.mode columns
.headers on
.nullvalue NULL

-- 10.Quais os 3 treinadores que tiveram mais atletas vencedores?

drop view if exists atletasVencedores;

create view atletasVencedores as  Select DISTINCT Atleta.AtletaCC, Campeonato.ID, Classificacao.Fase, Atleta.TreinadorCC
from Atleta, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Classificacao.CampeonatoID =  Campeonato.ID
  AND
  Classificacao.Fase='Final'
  AND
  Classificacao.Pontos = '0');
 
drop view if exists atletasVitorias;

create view atletasVitorias as Select atletasVencedores.AtletaCC, COUNT(atletasVencedores.AtletaCC) as Victories, atletasVencedores.TreinadorCC
from atletasVencedores
group by atletasVencedores.AtletaCC
ORDER BY Victories;

Select TreinadorCC, COUNT(atletasVitorias.TreinadorCC) as CounterVictories
from atletasVitorias
where (TreinadorCC is not NULL)
group by atletasVitorias.TreinadorCC
ORDER BY CounterVictories desc limit 3;
