.mode columns
.headers on
.nullvalue NULL

--Os Primeiros dois valores são inválidos, e os segundos são válidos.

Select * from DataCat;

INSERT INTO DataCat VALUES('Men´s Physique', 1, '2017-07-15', '15:00', '2017-07-11', '15:00');
INSERT INTO DataCat VALUES('Men´s Physique', 2, '2017-08-21', '15:00', '2017-08-25', '15:00');

INSERT INTO DataCat VALUES('Men´s Physique', 3, '2017-11-21', '15:00', '2017-11-23', '15:00');
INSERT INTO DataCat VALUES('Men´s Physique', 4, '2017-12-21', '15:00', '2017-12-23',  '15:00');

Select * from DataCat;