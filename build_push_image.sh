#!/bin/bash


echo "=== Starting Docker Build Process ==="

echo "Step 1: Building Docker image..."
docker build -t item-app:v1 .

echo ""
echo "=== Build Complete ==="
echo ""

echo "Step 2: Listing local Docker images..."
docker images

echo ""
echo "=== Preparing to Push Image ==="
echo ""

echo "Step 3: Tagging image for Docker Hub..."
docker tag item-app:v1 khoirulmalik/item-app:v1

echo "Step 4: Logging in to Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u khoirulmalik --password-stdin

echo ""
echo "=== Pushing Image to Docker Hub ==="
echo ""

echo "Step 5: Pushing image to Docker Hub..."
docker push khoirulmalik/item-app:v1

echo ""
echo "=== Process Complete ==="
echo "Image successfully pushed to Docker Hub!"