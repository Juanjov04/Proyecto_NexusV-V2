<p align="center">
  <a href="https://laravel.com" target="_blank">
    <img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo">
  </a>
</p>

<p align="center">
  <a href="https://github.com/AnthonnyM31/Proyecto_NexusV-V2">
    <img src="https://img.shields.io/badge/Status-Development-blue" alt="Status">
  </a>
  <a href="https://packagist.org/packages/laravel/framework">
    <img src="https://img.shields.io/badge/Framework-Laravel%2011%2B-red" alt="Laravel Version">
  </a>
  <a href="https://github.com/AnthonnyM31/Proyecto_NexusV-V2/blob/main/LICENSE">
    <img src="https://img.shields.io/packagist/l/laravel/framework" alt="License">
  </a>
</p>

---

# 🚀 Proyecto NexusV-V2  
**Plataforma de Cursos con Roles Diferenciados**

**NexusV-V2** es una plataforma de ingeniería web desarrollada en **Laravel** que simula un sistema de **venta y gestión de cursos en tiempo real**.  
Su arquitectura se basa en la separación de roles: **Vendedor** y **Comprador**, permitiendo gestionar la publicación, compra e inscripción a cursos.

---

## 📚 Índice

1. [🧩 Stack Tecnológico](#-stack-tecnológico)  
2. [💡 Lecciones Aprendidas](#-lecciones-aprendidas)  
3. [⚙️ Instalación Local](#️-instalación-local)  
4. [🧪 Flujo de Pruebas](#-flujo-de-pruebas)  
5. [🌎 Despliegue y Repositorio](#-despliegue-y-repositorio)

---

## 🧩 Stack Tecnológico

| Componente | Versión | Propósito |
| :--- | :--- | :--- |
| **Framework** | Laravel 11+ | Backend PHP (lógica de negocio y API). |
| **Frontend** | Blade + Vite + Tailwind CSS | Interfaz de usuario, estilos y compilación de assets. |
| **Base de Datos** | SQLite (Desarrollo) / PostgreSQL (Producción) | Almacenamiento de datos. |
| **Autenticación** | Laravel Breeze | Sistema de login y registro multi-rol. |

---

## 💡 Lecciones Aprendidas

Durante el desarrollo se presentaron diversos desafíos técnicos, especialmente relacionados con el entorno de desarrollo y la configuración del sistema de autenticación:

- **Errores Cíclicos en Entorno Windows:**  
  Problemas con `BindingResolutionException` y `BadMethodCallException` por inestabilidad de Composer.

- **Fallos en Clases de Breeze:**  
  Controladores como `ProfileController` y `AuthenticatedSessionController` no se generaron correctamente.

- **Reestructuración de Rutas:**  
  Se eliminaron alias de rutas (por ejemplo, de `route('seller.courses.index')` a `/seller/courses`) para mejorar la estabilidad.

- **Corrupción de Base de Datos:**  
  La tabla `enrollments` se generó sin claves foráneas, requiriendo ejecutar `php artisan migrate:fresh`.

---

## ⚙️ Instalación Local

Esta guía asume que tienes instalados **PHP (8.2 o superior)**, **Composer**, y **Node.js (con NPM)**.

### 🔹 Paso 1: Clonar el Repositorio

```bash
git clone https://github.com/AnthonnyM31/Proyecto_NexusV-V2.git
cd Proyecto_NexusV-V2
```

---

### 🔹 Paso 2: Configurar el Entorno

Copia el archivo de entorno y genera la clave de la aplicación:

```bash
copy .env.example .env
php artisan key:generate
```

---

### 🔹 Paso 3: Instalar Dependencias

Instala las dependencias de PHP y JavaScript:

```bash
composer install
npm install
```

---

### 🔹 Paso 4: Configurar y Migrar la Base de Datos

El proyecto usa **SQLite** para desarrollo local.  
Crea el archivo de base de datos y ejecuta las migraciones:

```bash
touch database/database.sqlite
php artisan migrate
```

#### ⚠️ Si aparecen errores de clase o rutas:
Ejecuta lo siguiente para limpiar cachés y autoloads:

```bash
php artisan optimize:clear
composer dump-autoload -o
```

---

### 🔹 Paso 5: Ejecutar la Aplicación

Abre **dos terminales** en la raíz del proyecto.

**Terminal 1 (Backend - Laravel):**
```bash
php artisan serve
```

**Terminal 2 (Frontend - Vite):**
```bash
npm run dev
```

**URL local:**  
👉 [http://127.0.0.1:8000](http://127.0.0.1:8000)

---

## 🧪 Flujo de Pruebas Funcionales

Sigue los pasos para verificar la funcionalidad completa:

### 🔸 Registro y Login  
- Accede a `/register`.  
- Verifica el campo desplegable **“Registrarse como”**.

### 🔸 Rol Vendedor  
- Regístrate como *Vendedor*.  
- Publica un curso nuevo.  
- Verifica que el curso aparezca como **Publicado**.

### 🔸 Rol Comprador  
- Regístrate como *Comprador*.  
- Accede a **Explorar Cursos** y selecciona un curso.  
- Haz clic en **“Inscribirse ahora”**.  
- Confirma que aparece en **Mis Cursos Inscritos**.

---

## 🌎 Despliegue y Repositorio

El proyecto está preparado para su despliegue en **Render**.

- **Repositorio Oficial:**  
  🔗 [https://github.com/AnthonnyM31/Proyecto_NexusV-V2](https://github.com/AnthonnyM31/Proyecto_NexusV-V2)

- **Ejemplo de Deploy:**  
  🔗 [https://nexusv-web-service.onrender.com/](https://nexusv-web-service.onrender.com/)
