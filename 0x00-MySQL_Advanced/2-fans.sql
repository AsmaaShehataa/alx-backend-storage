-- script that ranks country origins of bands
SELECT origins, SUM(fans) as nb_fans from metal_bands
GROUP BY origin ORDER BY nb_fans DESC;
