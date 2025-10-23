--quais atributos tem maior influencia no preço--

USE projeto_airbnb;


SELECT * FROM listings;

SELECT neighbourhood, property_type, room_type, accommodates, bedrooms, amenities, price
FROM listings;

--aprender a lidar com jason no sql--
SELECT neighbourhood,
    JSON_EXTRACT (amenities, "$.Shampoo") AS comodidades_visinhanca
FROM listings;


