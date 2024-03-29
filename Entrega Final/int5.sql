.mode columns
.headers on
.nullvalue NULL

--5. Qual o segundo pais onde decorreram mais campeonatos?


create view counterPais as 
Select Campeonato.Pais, count(*) as counter
from Campeonato
group by Campeonato.Pais;


Select T.Pais as Pais, MAX(T.counter) as NoCampeonatos
from (Select * from counterPais where counterPais.counter NOT IN (Select MAX(counterPais.counter) from counterPais)) T;

drop view if exists counterPais;