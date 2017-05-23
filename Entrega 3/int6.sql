.mode columns
.headers on
.nullvalue NULL

-- 6.Quais os atletas estrangeiros que participam na competicao 1?

drop view if exists atletasCampeonato;

create view atletasCampeonato as  Select DISTINCT Atleta.AtletaCC, Campeonato.ID as CampeonatoID, Campeonato.Pais
from Atleta, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Campeonato.ID = '1'
  AND
  Classificacao.CampeonatoID = '1'
  AND
  Classificacao.Fase='Eliminatoria');

Select DISTINCT atletasCampeonato.AtletaCC, Pessoa.Pais
from atletasCampeonato, Pessoa
where(atletasCampeonato.AtletaCC = Pessoa.CC AND atletasCampeonato.Pais <> Pessoa.Pais)
ORDER BY Pessoa.Pais ASC;
