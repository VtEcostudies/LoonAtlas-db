--Leave geometry in native 4326, degrees
select * from vpmapped where ST_PointInsideCircle("itemLocation",-72.98838,43.80005,0.0005);

--convert geometry to 5186, meters
select * from vpmapped where ST_DWITHIN(
	ST_Transform("itemLocation", 5186),
	ST_Transform(ST_SetSRID(ST_Point(-72.98838, 43.80005), 4386), 5186),
	50);

SELECT ST_Distance(
	ST_Transform(a."itemLocation", 5186),
	ST_Transform(b."itemLocation", 5186)
	) AS meters
FROM vpmapped a, vpmapped b
WHERE a."itemId"='NEW1085'
AND b."itemId"='MLS1759';

SELECT ST_Distance(
	a."itemLocation"::geography,
	b."itemLocation"::geography
	) AS meters
FROM vpmapped a, vpmapped b
WHERE a."itemId"='12345'
AND b."itemId"='56789';
