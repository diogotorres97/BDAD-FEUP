.mode columns
.headers on
.nullvalue NULL

--7. Qual o pais onde decorreram mais campeonatos?

Select Campeonato.Pais, count(*) as counter
from Campeonato
group by Campeonato.Pais
ORDER BY counter desc limit 1;
