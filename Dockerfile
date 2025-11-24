# 1. Menggunakan base image Node.js versi 14
# Base image ini menyediakan runtime Node.js yang diperlukan aplikasi
FROM node:14

# 2. Menentukan working directory untuk container adalah /app
# Semua perintah selanjutnya akan dijalankan di direktori ini
WORKDIR /app

# 3. Menyalin seluruh source code ke working directory di container
# Perintah ini mengcopy semua file dari host ke container
COPY . .

# 4. Menentukan environment variables untuk production mode dan database host
# NODE_ENV: menjalankan aplikasi dalam mode production
# DB_HOST: menentukan hostname database yang akan digunakan
ENV NODE_ENV=production DB_HOST=item-db

# 5. Menginstal dependencies untuk production dan build aplikasi
# --production: hanya install dependencies yang diperlukan untuk production
# --unsafe-perm: mengizinkan npm run sebagai root user
# npm run build: compile/build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# 6. Ekspos port 8080 yang digunakan oleh aplikasi
# Port ini akan digunakan untuk mengakses aplikasi dari luar container
EXPOSE 8080

# 7. Menjalankan server saat container diluncurkan
# Perintah ini akan dieksekusi ketika container dijalankan
CMD ["npm", "start"]