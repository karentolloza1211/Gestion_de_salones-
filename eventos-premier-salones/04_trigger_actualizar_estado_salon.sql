-- =====================================================
-- 04 - Triggers actualizar_estado_salon
-- INSERT de reserva  -> salón 'Ocupado'
-- DELETE de reserva  -> salón 'Disponible' (si no le quedan otras reservas)
-- =====================================================
USE eventos_premier;

DROP TRIGGER IF EXISTS actualizar_estado_salon;
DROP TRIGGER IF EXISTS actualizar_estado_salon_delete;

DELIMITER $$

CREATE TRIGGER actualizar_estado_salon
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
    UPDATE salones
    SET estado = 'Ocupado'
    WHERE id_salon = NEW.id_salon;
END$$

CREATE TRIGGER actualizar_estado_salon_delete
AFTER DELETE ON reservas
FOR EACH ROW
BEGIN
    -- Solo vuelve a Disponible si el salón ya no tiene más reservas
    IF NOT EXISTS (SELECT 1 FROM reservas WHERE id_salon = OLD.id_salon) THEN
        UPDATE salones
        SET estado = 'Disponible'
        WHERE id_salon = OLD.id_salon;
    END IF;
END$$

DELIMITER ;

-- Prueba:
-- INSERT INTO reservas (id_salon, cliente, fecha_reserva, hora_inicio, hora_fin)
-- VALUES (1, 'Cliente Demo', '2025-11-15', '14:00', '18:00');
-- SELECT id_salon, nombre, estado FROM salones WHERE id_salon = 1;   -- Ocupado
-- DELETE FROM reservas WHERE cliente = 'Cliente Demo';
-- SELECT id_salon, nombre, estado FROM salones WHERE id_salon = 1;   -- Disponible
