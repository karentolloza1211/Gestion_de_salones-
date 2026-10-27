-- =====================================================
-- 02 - Vista vista_salones_disponibles
-- Salones activos con capacidad, ubicación, tarifa y estado actual
-- =====================================================
USE eventos_premier;

CREATE OR REPLACE VIEW vista_salones_disponibles AS
SELECT id_salon,
       nombre,
       capacidad,
       ubicacion,
       tarifa_hora,
       estado            -- 'Disponible' / 'Ocupado'
FROM salones
WHERE activo = 1;

-- Uso:
-- SELECT * FROM vista_salones_disponibles;
-- SELECT * FROM vista_salones_disponibles WHERE estado = 'Disponible';
