.mode columns
.headers on
.nullvalue NULL

--7. Qual o 2º pais onde decorreram mais campeonatos?

--sem o desc e sem o limite

Select Campeonato.Pais, count(*) as counter
from Campeonato
group by Campeonato.Pais
ORDER BY counter desc limit 1;
