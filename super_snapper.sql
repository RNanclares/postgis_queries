CREATE TABLE catastro.numeros_exteriores_inegi_snap AS
SELECT distinct on (num_exteriores_inegi_desplazados.idunico) num_exteriores_inegi_desplazados.*,
ST_ClosestPoint(lineas_manzanas_utm_13n_1a1.geom, num_exteriores_inegi_desplazados.geom) as snapped_point
FROM catastro.lineas_manzanas_utm_13n_1a1 INNER JOIN catastro.num_exteriores_inegi_desplazados on ST_Dwithin(lineas_manzanas_utm_13n_1a1.geom,
num_exteriores_inegi_desplazados.geom, 50) AND num_exteriores_inegi_desplazados.cvegeo = catastro.lineas_manzanas_utm_13n_1a1.cvegeo
ORDER BY num_exteriores_inegi_desplazados.idunico;
