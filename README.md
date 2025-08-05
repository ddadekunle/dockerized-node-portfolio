# 🐳 DevOps Portfolio Infrastructure — Damilare Adekunle

> “I don’t just automate infrastructure. I engineer peace of mind.”

A production-ready personal portfolio site deployed using DevOps best practices — built with Node.js, Docker, and deployed to Railway via a Docker artifact.

---

## 📌 Overview

This project demonstrates how to treat even a personal project like infrastructure — separating build and deploy phases, containerizing for consistency, and deploying in a platform-agnostic way.

---

## ⚙️ System Components

| Component          | Description                                             |
|--------------------|---------------------------------------------------------|
| **App**            | Node.js + Express app serving static content            |
| **Container**      | Docker-based build targeting `linux/amd64`              |
| **Registry**       | Docker Hub — artifact hosting                           |
| **Runtime**        | Railway — pulls and runs container without rebuilding   |
| **Ports**          | Respects dynamic `PORT` from environment                |
| **Delivery**       | Pull-based deployment via Docker image                  |

---

## 📦 Build Artifact

### 🛠️ Purpose

The Docker image is the core delivery artifact — designed to be portable, cross-platform, and cloud-compatible.

### 🧱 Properties

- Built with Docker `buildx` for `linux/amd64`
- Stateless and self-contained
- No dev dependencies or source needed at runtime
- Dynamic `PORT` support via `process.env.PORT`

### 📤 Build & Push Commands

```bash
docker buildx build --platform linux/amd64 -t ddadekunle/devops-portfolio .
docker push ddadekunle/devops-portfolio
```

### 🧪 Run Locally

```bash
docker run -d -p 5050:5000 ddadekunle/devops-portfolio
open http://localhost:5050
```

---

## 🚂 Deployment Architecture

### ✅ Strategy

The app is deployed using Railway’s container runtime — **not source code**.  
The cloud pulls the image from Docker Hub and runs it without building.

### 📦 Registry

```text
docker.io/ddadekunle/devops-portfolio:latest
```

### 🌐 Live App

[https://devops-portfolio.up.railway.app](https://devops-portfolio.up.railway.app)

### ⚙️ Runtime Behavior

| Runtime | Injected |
|---------|----------|
| `PORT`  | ✅        |
| `ENV`   | Optional |

> This deployment style is compatible with any OCI-compatible platform: Railway, Fly.io, ECS, etc.

---

## 🐋 Dockerfile Highlights

```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY . .
EXPOSE 5000
CMD ["npm", "start"]
```

### ✅ Design Decisions

- Uses Alpine for minimal image size
- Omits devDependencies for smaller, safer runtime
- Exposes port 5000 but respects dynamic env via Express
- Runs without build tools in production

---

## 📁 Project Structure

```bash
.
├── views/             # HTML layout
├── public/            # CSS and assets
├── server.js          # Express app logic
├── Dockerfile         # Container definition
├── .dockerignore      # Clean build context
├── package.json       # Node project metadata
└── README.md          # This file
```

---

## 🔁 CI/CD Ready

Although this project uses a manual Docker build + push workflow, it's designed to plug into:

- GitHub Actions
- GitLab CI
- Jenkins pipelines
- Railway GitHub triggers (if needed)

You could easily configure a workflow that:

```yaml
- builds for linux/amd64
- pushes tagged images to Docker Hub
- notifies Railway to redeploy
```

---

## 👤 Author

**Damilare Adekunle**  
Cloud & DevOps Engineer

- 📄 Resume: [ddadekunle.com/resume](https://ddadekunle.com/resume)
- 🌐 Portfolio: [ddadekunle.com](https://ddadekunle.com)
- 💻 GitHub: [github.com/ddadekunle](https://github.com/ddadekunle)
- 🔗 LinkedIn: [linkedin.com/in/ddadekunle](https://linkedin.com/in/ddadekunle)
- 📧 Email: [adekunledare12@gmail.com](mailto:adekunledare12@gmail.com)

---

## 📝 License

MIT — use, fork, deploy, or adapt freely.