#!/bin/bash

# Script untuk build dan push Docker image ke Docker Hub
echo "=== Starting Docker Build Process ==="

# 1. Membuat Docker image dari Dockerfile dengan nama item-app dan tag v1
# -t: memberikan nama dan tag pada image
# .: context build adalah direktori saat ini
echo "Step 1: Building Docker image..."
docker build -t item-app:v1 .

echo ""
echo "=== Build Complete ==="
echo ""

# 2. Melihat daftar image di lokal
# Untuk memverifikasi bahwa image berhasil dibuat
echo "Step 2: Listing local Docker images..."
docker images

echo ""
echo "=== Preparing to Push Image ==="
echo ""

# 3. Mengubah nama image agar sesuai dengan format Docker Hub
# Format: username/repository:tag
# Tag ini diperlukan agar Docker tahu ke mana harus push image
echo "Step 3: Tagging image for Docker Hub..."
docker tag item-app:v1 khoirulmalik/item-app:v1

# 4. Login ke Docker Hub via Terminal menggunakan environment variable
# Password diambil dari environment variable PASSWORD_DOCKER_HUB untuk keamanan
# --password-stdin: membaca password dari standard input
echo "Step 4: Logging in to Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u khoirulmalik --password-stdin

echo ""
echo "=== Pushing Image to Docker Hub ==="
echo ""

# 5. Mengunggah image ke Docker Hub
# Image akan tersimpan di repository khoirulmalik/item-app dengan tag v1
echo "Step 5: Pushing image to Docker Hub..."
docker push khoirulmalik/item-app:v1

echo ""
echo "=== Process Complete ==="
echo "Image successfully pushed to Docker Hub!"