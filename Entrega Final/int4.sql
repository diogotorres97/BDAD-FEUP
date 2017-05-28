.mode columns
.headers on
.nullvalue NULL

--4.Quais os atletas estrangeiros que participam na competicao 1?

create view atletasCampeonato as  Select DISTINCT Atleta.AtletaCC,Pessoa.Nome, Campeonato.ID as CampeonatoID, Campeonato.Pais
from Atleta, Campeonato,Classificacao, Pessoa
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Atleta.AtletaCC=Pessoa.CC
  AND
  Campeonato.ID = '1'
  AND
  Classificacao.CampeonatoID = '1'
  AND
  Classificacao.Fase='Eliminatoria');

Select DISTINCT atletasCampeonato.AtletaCC, atletasCampeonato.Nome, Pessoa.Pais
from atletasCampeonato, Pessoa
where(atletasCampeonato.AtletaCC = Pessoa.CC AND atletasCampeonato.Pais <> Pessoa.Pais)
ORDER BY Pessoa.Pais ASC;

drop view if exists atletasCampeonato;