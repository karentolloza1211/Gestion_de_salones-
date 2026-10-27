-- =====================================================
-- 03 - Función calcular_tarifa_total
-- total = tarifa_hora * horas * 1.10  (10% recargo por mantenimiento)
-- =====================================================
USE eventos_premier;

DROP FUNCTION IF EXISTS calcular_tarifa_total;

DELIMITER $$
CREATE FUNCTION calcular_tarifa_total(p_tarifa_hora DECIMAL(12,2), p_horas INT)
RETURNS DECIMAL(14,2)
DETERMINISTIC
BEGIN
    DECLARE v_subtotal DECIMAL(14,2);

    IF p_tarifa_hora IS NULL OR p_horas IS NULL OR p_tarifa_hora < 0 OR p_horas < 0 THEN
        RETURN NULL;
    END IF;

    SET v_subtotal = p_tarifa_hora * p_horas;
    RETURN ROUND(v_subtotal * 1.10, 2);
END$$
DELIMITER ;

-- Uso: 350000 x 4 horas + 10% = 1.540.000
-- SELECT calcular_tarifa_total(350000, 4);
-- SELECT nombre, calcular_tarifa_total(tarifa_hora, 5) AS total_5h FROM salones;
