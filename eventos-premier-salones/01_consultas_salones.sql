-- =====================================================
-- 01 - Consultas de salones
-- =====================================================
USE eventos_premier;

-- 1) Salones disponibles (no reservados) el 2025-11-15, usando NOT IN
SELECT s.nombre,
       s.capacidad,
       s.tarifa_hora
FROM salones s
WHERE s.id_salon NOT IN (
        SELECT r.id_salon
        FROM reservas r
        WHERE r.fecha_reserva = '2025-11-15'
      )
ORDER BY s.nombre;

-- 2) Salones con capacidad entre 50 y 150 y tarifa menor a 500000,
--    ordenados de menor a mayor tarifa
SELECT nombre,
       capacidad,
       tarifa_hora
FROM salones
WHERE capacidad BETWEEN 50 AND 150
  AND tarifa_hora < 500000
ORDER BY tarifa_hora ASC;
