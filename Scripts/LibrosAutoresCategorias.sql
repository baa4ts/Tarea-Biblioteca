SELECT  
    l.titulo, 
    a.nombre_completo AS autor, 
    c.nombre_categoria AS categoria
FROM Libros l 
JOIN Libros_Autores la ON l.isbn = la.isbn 
JOIN Autores a ON la.id_autor = a.id_autor 
JOIN Libros_Categorias lc ON l.isbn = lc.isbn 
JOIN Categorias c ON lc.id_categoria = c.id_categoria 
ORDER BY l.titulo;
