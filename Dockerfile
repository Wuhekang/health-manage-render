FROM node:22-bookworm-slim AS frontend-build
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm ci
COPY frontend/ ./
RUN VITE_API_BASE_URL= npm run build

FROM maven:3.9-eclipse-temurin-17 AS backend-build
WORKDIR /app/backend
COPY backend/pom.xml ./
RUN mvn dependency:go-offline -DskipTests
COPY backend/src ./src
COPY --from=frontend-build /app/frontend/dist ./src/main/resources/static
RUN mvn package -DskipTests

FROM mysql:8.0-debian
RUN apt-get update \
    && apt-get install -y --no-install-recommends openjdk-17-jre-headless \
    && rm -rf /var/lib/apt/lists/*

ENV MYSQL_DATABASE=health_management \
    MYSQL_USER=health \
    MYSQL_PASSWORD=health_render_demo \
    MYSQL_ROOT_PASSWORD=health_render_root \
    DATABASE_URL=jdbc:mysql://127.0.0.1:3306/health_management?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai \
    DATABASE_USERNAME=health \
    DATABASE_PASSWORD=health_render_demo

COPY sql/health_management.sql /docker-entrypoint-initdb.d/01-health-management.sql
COPY --from=backend-build /app/backend/target/health-management-1.0.0.jar /app/app.jar
COPY deploy/start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 10000
CMD ["/app/start.sh"]
