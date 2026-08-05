# Django App Deployment with Docker & Nginx on AWS EC2

A production-style deployment pipeline for a Django application, containerized with Docker and served through Nginx on an AWS EC2 instance — with fully automated build and redeploy via shell scripting.

## Overview

This project demonstrates a complete DevOps deployment workflow: taking a Django application from local code to a running, publicly accessible service on the cloud, using containerization and reverse proxying for a consistent, production-like environment.

## Features

- **Containerized Django application** — Docker & Docker Compose orchestrate the app, database, and web server as isolated, reproducible services, eliminating "it works on my machine" issues.
- **Nginx reverse proxy** — All incoming HTTP traffic is routed through Nginx, which forwards requests to the Django app container, providing a clean separation between the web-facing layer and the application layer.
- **AWS EC2 hosting** — The full stack is deployed on an EC2 instance, simulating a real production cloud environment.
- **Automated deployment** — A shell script handles building images, tearing down old containers, and bringing up the updated stack, removing the need for manual redeployment steps.

## Architecture

    Client → Nginx (reverse proxy) → Django App (Docker container) → Database

## Tech Stack

- **Application:** Django
- **Containerization:** Docker, Docker Compose
- **Web Server / Reverse Proxy:** Nginx
- **Cloud Hosting:** AWS EC2
- **Automation:** Bash shell scripting

## Deployment

The deployment is fully automated via a shell script that:
1. Pulls the latest code
2. Builds the Docker images
3. Stops and removes existing containers
4. Brings up the updated containers via Docker Compose
5. Verifies the app is served correctly through Nginx

    ./deploy_django_app.sh

## Getting Started (Local)

    git clone https://github.com/waleedansarii/django-app-deployment.git
    cd django-app-deployment
    docker compose up -d --build

The app will be available through Nginx at the configured port.

## Environment Variables

Configuration is managed through a `.env` file (not committed to version control). Update it with the values required by your Django settings and database service before running.

## Notes

- This project was built as a hands-on exercise in containerized deployment workflows, reverse proxy configuration, and deployment automation for DevOps/Cloud engineering practice.
