SELECT  
    s.nombre_completo AS socio, 
    l.titulo AS libro, 
    p.fecha_prestamo, 
    p.fecha_devolucion_prevista
FROM Prestamos p 
JOIN Socios s ON p.numero_socio = s.numero_socio 
JOIN Detalle_Prestamos dp ON p.numero_prestamo = dp.numero_prestamo 
JOIN Libros l ON dp.isbn = l.isbn 
WHERE p.fecha_devolucion_real IS NULL;
