--quais atributos tem maior influencia no preço--
SELECT * FROM listings;

--query para ver os atributos principais do dataset--
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

