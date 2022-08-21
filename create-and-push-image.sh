#!/usr/bin/env bash

# Frontend

git clone https://github.com/carlosrv999/nextjs-prisma-CRUD.git
cd nextjs-prisma-CRUD
npm install
docker build -t notesapp .
gcloud auth configure-docker us-central1-docker.pkg.dev
docker tag notes-app us-central1-docker.pkg.dev/agile-terra-359116/notes-app-repo/notes-app:latest
docker push us-central1-docker.pkg.dev/agile-terra-359116/notes-app-repo/notes-app:latest

# Database

cd database
docker build -t database-app .
gcloud auth configure-docker us-central1-docker.pkg.dev
docker tag database-app us-central1-docker.pkg.dev/agile-terra-359116/notes-app-repo/database-app:latest
docker push us-central1-docker.pkg.dev/agile-terra-359116/notes-app-repo/database-app:latest
