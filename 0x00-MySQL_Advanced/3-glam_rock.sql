-- SQL script that lists all bands with Glam rock
SELECT band_name, (2022 - split(band_lifespan, '-')[0]) AS lifespan
FROM metal_bands
WHERE style = 'Glam rock';
