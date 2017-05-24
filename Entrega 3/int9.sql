.mode columns
.headers on
.nullvalue NULL

-- 9.Qual a equipa com mais vitorias?

create view vencedoresCampeonato as  Select DISTINCT Atleta.AtletaCC, Campeonato.ID, Classificacao.Fase, Atleta.EquipaNome
from Atleta, Campeonato,Classificacao
where ( Atleta.AtletaCC=Classificacao.AtletaCC
  AND
  Classificacao.CampeonatoID =  Campeonato.ID
  AND
  Classificacao.Fase='Final'
  AND
  Classificacao.Pontos = '0');


create view vitoriasAtletas as Select vencedoresCampeonato.AtletaCC, COUNT(vencedoresCampeonato.AtletaCC) as Victories, vencedoresCampeonato.EquipaNome
from vencedoresCampeonato
group by vencedoresCampeonato.AtletaCC
ORDER BY Victories;


Select EquipaNome, COUNT(vitoriasAtletas.EquipaNome)*vitoriasAtletas.Victories as Victories
from vitoriasAtletas
where (EquipaNome is not NULL)
group by vitoriasAtletas.EquipaNome
ORDER BY Victories desc limit 1;


drop view if exists vencedoresCampeonato;
drop view if exists vitoriasAtletas;
