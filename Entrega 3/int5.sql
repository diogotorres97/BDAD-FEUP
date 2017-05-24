.mode columns
.headers on
.nullvalue NULL

--5. Quais os treinadores sem equipa que treinaram atletas?

Select Treinador.TreinadorCC, Pessoa.Nome, Treinador.Equipa, COUNT(Treinador.TreinadorCC) as NoAtletas
from Atleta, Treinador, Pessoa
where (Atleta.TreinadorCC = Treinador.TreinadorCC AND  Treinador.TreinadorCC=Pessoa.CC and Treinador.Equipa is NULL)
group by Treinador.TreinadorCC;
