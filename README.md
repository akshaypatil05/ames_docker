# 🧪 How to Run the Docker Image Locally

## 📌 Prerequisites
- Docker Desktop installed on your system  
- `optical-stereo-dsm.tar` image file  
- A local folder containing:
  - `data/` directory (with images, DEMs, and RPCs)
  - `config_spot.json`
  - `run_spot_pipeline.py`

## ✅ Steps

1. **Open PowerShell** and go to your project folder:
   ```powershell
   cd "C:\Users\YourUsername\Downloads\project-folder"
2. **Load Docker File**
```
docker load -i optical-stereo-dsm.tar
```
3. **Run the Container**
```
docker run --rm ^
  -v "${PWD}\data:/app/data" ^
  -v "${PWD}\run_spot_pipeline.py:/app/run_spot_pipeline.py" ^
  -v "${PWD}\config_spot.json:/app/config_spot.json" ^
  -v "${PWD}\spot_results:/app/spot_results" ^
  optical-stereo-dsm run_spot_pipeline.py config_spot.json
```
🗂️ Notes
- Make sure the spot_results/ folder exists, or Docker will create it.
- All heavy inputs like images should be mounted, not copied into Docker.

# 🐳 How to Pull and Run Docker Image from Docker Hub

## ✅ Prerequisites
- Docker Desktop installed
- Docker image published to Docker Hub (e.g. `akshaypatil05/optical-stereo-dsm`)
- A local folder containing:
  - `data/` – folder with input images, RPCs, and DEM
  - `run_spot_pipeline.py` – the main Python script
  - `config_spot.json` – the configuration file
  - `spot_results/` – an empty or existing folder for output

---

Pull the Docker Image

In **PowerShell** or **WSL**, run:

```bash
docker pull akshaypatil05/optical-stereo-dsm:latest
```
docker run --rm `
  -v "${PWD}\data:/app/data" `
  -v "${PWD}\run_spot_pipeline.py:/app/run_spot_pipeline.py" `
  -v "${PWD}\config_spot.json:/app/config_spot.json" `
  -v "${PWD}\spot_results:/app/spot_results" `
  akshaypatil05/optical-stereo-dsm run_spot_pipeline.py config_spot.json
```
Folder Structure
project-folder/
├── data/
├── run_spot_pipeline.py
├── config_spot.json
└── spot_results/

📝 Notes
- --rm cleans up the container after it finishes running.
- Output will be stored in spot_results/ as mounted.
- The Docker image already contains the required environment and dependencies.
