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

--query para separar as amenities (comodidades) por neighbourhood (visinhanca)--
SELECT l.neighbourhood,
    c.amenities
FROM listings AS l
    JOIN JSON_TABLE(
        l.amenities,
        '$[*]' COLUMNS (amenities VARCHAR(100) PATH '$')
    ) AS c;




