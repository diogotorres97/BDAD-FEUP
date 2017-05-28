.mode columns
.headers on
.nullvalue NULL

-- 7.Quais os 3 treinadores que tiveram mais atletas vencedores?

create view atletasVencedores as  Select DISTINCT Atleta.AtletaCC, Campeonato.ID, Classificacao.Fase, Atleta.TreinadorCC
from Atleta, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Classificacao.CampeonatoID =  Campeonato.ID
  AND
  Classificacao.Fase='Final'
  AND
  Classificacao.Pontos = '0');
 
 
create view atletasVitorias as Select atletasVencedores.AtletaCC, COUNT(atletasVencedores.AtletaCC) as Victories, atletasVencedores.TreinadorCC
from atletasVencedores
group by atletasVencedores.AtletaCC
ORDER BY Victories;


Select TreinadorCC,Pessoa.Nome, COUNT(atletasVitorias.TreinadorCC) as CounterVictories
from atletasVitorias, Pessoa
where (TreinadorCC is not NULL AND atletasVitorias.TreinadorCC=Pessoa.CC)
group by atletasVitorias.TreinadorCC
ORDER BY CounterVictories desc limit 3;


drop view if exists atletasVencedores;
drop view if exists atletasVitorias;