.mode columns
.headers on
.nullvalue NULL

--7. Qual o segundo pais onde decorreram mais campeonatos?

drop view if exists counterPais;

create view counterPais as 
Select Campeonato.Pais, count(*) as counter
from Campeonato
group by Campeonato.Pais;

Select T.Pais, MAX(T.counter) as NoCampeonatos
from (Select * from counterPais where counterPais.counter NOT IN (Select MAX(counterPais.counter) from counterPais)) T;
