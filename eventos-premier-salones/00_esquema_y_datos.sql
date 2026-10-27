
CREATE DATABASE IF NOT EXISTS eventos_premier CHARACTER SET utf8mb4;
USE eventos_premier;

DROP TABLE IF EXISTS reservas;
DROP TABLE IF EXISTS salones;

CREATE TABLE salones (
    id_salon      INT AUTO_INCREMENT PRIMARY KEY,
    nombre        VARCHAR(100)  NOT NULL,
    capacidad     INT           NOT NULL CHECK (capacidad > 0),
    ubicacion     VARCHAR(150)  NOT NULL,
    tarifa_hora   DECIMAL(12,2) NOT NULL CHECK (tarifa_hora >= 0),
    estado        ENUM('Disponible','Ocupado') NOT NULL DEFAULT 'Disponible',
    activo        TINYINT(1)    NOT NULL DEFAULT 1
);

CREATE TABLE reservas (
    id_reserva     INT AUTO_INCREMENT PRIMARY KEY,
    id_salon       INT  NOT NULL,
    cliente        VARCHAR(120) NOT NULL,
    fecha_reserva  DATE NOT NULL,
    hora_inicio    TIME NOT NULL,
    hora_fin       TIME NOT NULL,
    CONSTRAINT fk_reserva_salon FOREIGN KEY (id_salon) REFERENCES salones(id_salon)
);

INSERT INTO salones (nombre, capacidad, ubicacion, tarifa_hora, activo) VALUES
('Salón Esmeralda', 80,  'Piso 1 - Ala Norte', 350000, 1),
('Salón Zafiro',    120, 'Piso 2 - Ala Sur',   450000, 1),
('Salón Diamante',  300, 'Piso 3',             900000, 1),
('Salón Rubí',      40,  'Piso 1 - Ala Sur',   200000, 1),
('Salón Ópalo',     100, 'Piso 2 - Ala Norte', 480000, 1),
('Salón Perla',     140, 'Terraza',            520000, 0);

-- Reserva de prueba para el 2025-11-15 (se insertará con el trigger ya creado, ver nota en README)
