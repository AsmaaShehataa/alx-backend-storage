-- script that ranks country origins of bands
SELECT origins, SUM(fans) as nb_fans from metal_bands
GROUP_BY origin ORDER_BY nb_fans DESC;
