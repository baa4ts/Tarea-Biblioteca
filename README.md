# 📚 Tarea: Sistema de Biblioteca

**📄 Consigna:** [Ver PDF de la tarea](/Tarea.pdf)

---

## ✅ Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

* [Docker](https://www.docker.com/)

---

## ▶️ Pasos para Ejecutar el Proyecto

### 1️⃣ Clonar el Repositorio

Abre una terminal y ejecuta:

```bash
git clone https://github.com/baa4ts/Tarea-Biblioteca.git
```

### 2️⃣ Acceder al Directorio del Proyecto

```bash
cd Tarea-Biblioteca
```

### 3️⃣ Levantar los Contenedores con Docker

Puedes iniciar el entorno de desarrollo de dos formas:

#### 🔹 Con logs en la consola:

```bash
docker compose up --build
```

#### 🔹 En segundo plano (modo *detached*):

```bash
docker compose up -d --build
```

> ℹ️ Una vez desplegado, puedes verificar que los servicios están funcionando correctamente ejecutando:
>
> ```bash
> docker ps
> ```

---

## 🛠️ Comandos Adicionales

### 🛑 Detener el servidor

```bash
docker stop mysql
```

### ❌ Eliminar el contenedor del servidor

```bash
docker rm mysql
```

### 🧹 Eliminar los datos persistentes (base de datos local)

> ⚠️ Este comando elimina el directorio `./DB` donde se almacenan los datos de MySQL. Úsalo con precaución.

```powershell
Remove-Item -Force -Recurse -Path ./DB
```

### 🔁 Comando combinado (detener, eliminar contenedor y datos)

```powershell
docker stop mysql; docker rm mysql; Remove-Item -Force -Recurse -Path ./DB
```