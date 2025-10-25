--quais atributos tem maior influencia no preço--

USE projeto_airbnb;


SELECT * FROM listings;

SELECT neighbourhood,
    property_type,
    room_type,
    accommodates,
    bedrooms,
    amenities,
    price
FROM listings;

--aprender a lidar com array jason no sql--
--query não funiona--
SELECT neighbourhood,
    JSON_EXTRACT (amenities, "$[:]") AS comodidades_visinhanca
FROM listings;

--faz lista de todos os arays json-- 
SELECT neighbourhood,
    JSON_UNQUOTE(amenities) as lista
    FROM listings;

--quero separar os atributos do array em linhas separadas--
--query que funciona--
SELECT l.neighbourhood,
    c.amenities
FROM listings AS l
    JOIN JSON_TABLE(
        l.amenities,
        '$[*]' COLUMNS (amenities VARCHAR(100) PATH '$')
    ) AS c;




