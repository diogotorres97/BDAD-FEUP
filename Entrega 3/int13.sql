.mode columns
.headers on
.nullvalue NULL

--13.Quais os juris com jurados do mesmo pais?

create view juradosJuri as Select DISTINCT Jurado.JuriID, Jurado.JuradoCC, Pessoa.Pais
from Juri, Jurado, Pessoa
where (Juri.ID = Jurado.JuriID AND Jurado.JuradoCC=Pessoa.CC)
order by JuriID;

select distinct JuriID, Pais
from juradosJuri
group by JuriID
having 1 = count(distinct Pais);

drop view if exists juradosJuri;
 
