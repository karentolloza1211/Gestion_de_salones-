# Eventos Premier S.A.S. - Módulo de administración de salones

Motor: **MySQL 8.x**

## Orden de ejecución
1. `00_esquema_y_datos.sql` – tablas `salones` y `reservas` + datos de prueba
2. `01_consultas_salones.sql` – salones disponibles y filtro por capacidad/tarifa
3. `02_vista_salones_disponibles.sql` – vista `vista_salones_disponibles`
4. `03_funcion_calcular_tarifa_total.sql` – función `calcular_tarifa_total`
5. `04_trigger_actualizar_estado_salon.sql` – triggers de estado

## Subir a GitHub
```bash
git init
git add .
git commit -m "Módulo de administración de salones - Eventos Premier"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/eventos-premier-salones.git
git push -u origin main
```
