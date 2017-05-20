.mode columns
.headers on
.nullvalue NULL

--5. Quais os treinadores sem equipa que treinaram atletas


Select *
from Atleta, Treinador
where (Atleta.TreinadorCC = Treinador.TreinadorCC AND
  Treinador.Equipa is NULL);
