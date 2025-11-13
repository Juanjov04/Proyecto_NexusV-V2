# 1. IMAGEN BASE
FROM php:8.1-fpm-alpine

# 2. INSTALAR DEPENDENCIAS DEL SISTEMA (Añadimos libpq para PostgreSQL)
RUN apk update && apk add \
    git \
    curl \
    libxml2-dev \
    postgresql-dev \
    libpq \
    unzip \
    nodejs \
    npm

# 3. INSTALAR EXTENSIONES DE PHP (Ahora sí se puede instalar pdo_pgsql)
# RUN docker-php-ext-install pdo_pgsql mbstring exif pcntl bcmath opcache

# 4. DIRECTORIO DE TRABAJO
WORKDIR /app

# 5. COPIAR CÓDIGO
COPY . /app

# 6. INSTALAR COMPOSER
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 7. INSTALAR DEPENDENCIAS DE PHP
RUN composer install --no-dev --optimize-autoloader

# 8. COMPILAR FRONTEND
RUN npm install && npm run build

# 9. PERMISOS DE LARAVEL
RUN chown -R www-data:www-data /app/storage /app/bootstrap/cache && \
    chmod -R 775 /app/storage /app/bootstrap/cache

# 10. EXPONER PUERTO
EXPOSE 8000

# 11. COMANDO DE ARRANQUE
CMD sh -c "php-fpm & php artisan serve --host=0.0.0.0 --port=8000"


