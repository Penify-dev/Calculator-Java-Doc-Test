# Use OpenJDK 11 as base image
FROM openjdk:11-jre-slim

# Set maintainer label
LABEL maintainer="agent@example.com"
LABEL description="Calculator Java Application"
LABEL version="1.0.0"

# Set working directory
WORKDIR /app

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    xvfb \
    x11vnc \
    fluxbox \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Copy the Maven wrapper and pom.xml first for better layer caching
COPY pom.xml ./
COPY .mvn .mvn
COPY mvnw ./

# Make Maven wrapper executable
RUN chmod +x ./mvnw

# Download dependencies (this layer will be cached unless pom.xml changes)
RUN ./mvnw dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Create a non-root user for security
RUN useradd -r -u 1000 calculator && \
    chown -R calculator:calculator /app

# Switch to non-root user
USER calculator

# Set environment variables for GUI applications
ENV DISPLAY=:1
ENV JAVA_OPTS="-Djava.awt.headless=false"

# Expose VNC port for GUI access (optional, for remote GUI access)
EXPOSE 5901

# Create startup script
RUN echo '#!/bin/bash' > /app/start.sh && \
    echo 'Xvfb :1 -screen 0 1024x768x16 &' >> /app/start.sh && \
    echo 'fluxbox &' >> /app/start.sh && \
    echo 'x11vnc -display :1 -nopw -listen localhost -xkb -forever &' >> /app/start.sh && \
    echo 'java $JAVA_OPTS -cp "target/classes:target/lib/*" com.houarizegai.calculator.App' >> /app/start.sh && \
    chmod +x /app/start.sh

# Set the default command
CMD ["/app/start.sh"]

# Health check (optional)
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD pgrep -f "com.houarizegai.calculator.App" || exit 1

# Alternative simpler version without GUI setup (headless mode)
# If you want to run in headless mode, uncomment the following and comment out the GUI setup above:

# FROM openjdk:11-jre-slim
# WORKDIR /app
# COPY pom.xml ./
# COPY .mvn .mvn  
# COPY mvnw ./
# RUN chmod +x ./mvnw
# RUN ./mvnw dependency:go-offline -B
# COPY src ./src
# RUN ./mvnw clean package -DskipTests
# RUN useradd -r -u 1000 calculator && chown -R calculator:calculator /app
# USER calculator
# ENV JAVA_OPTS="-Djava.awt.headless=true"
# CMD ["java", "-cp", "target/classes:target/lib/*", "com.houarizegai.calculator.App"]
