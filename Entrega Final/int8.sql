.mode columns
.headers on
.nullvalue NULL

--8.Em quais campeonatos dois atletas se encontraram?

create view atletasCampeonato as  Select DISTINCT Atleta.AtletaCC, Pessoa.Nome, Campeonato.ID as CampeonatoID
from Atleta, Campeonato,Classificacao, Pessoa
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Atleta.AtletaCC = Pessoa.CC
  AND
  Campeonato.ID = Classificacao.CampeonatoID
  AND
  Classificacao.Fase='Eliminatoria');
  
  
select T1.AtletaCC, T1.Nome, T2.AtletaCC,T2.Nome, group_concat(T1.CampeonatoID) as Campeonatos
from atletasCampeonato T1, atletasCampeonato T2
where T1.CampeonatoID = T2.CampeonatoID and T1.AtletaCC = '730906404' and T2.AtletaCC = '232493475'
group by T1.AtletaCC, T2.AtletaCC;


drop view if exists atletasCampeonato;





