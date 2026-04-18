@echo off
title ComplainTracker AI - Launcher
color 0A

echo.
echo ============================================
echo    ComplainTracker AI - Starting All Services
echo ============================================
echo.

:: ---- 1. Start ML Engine (Python FastAPI on port 8001) ----
echo [1/3] Starting ML Engine (FastAPI)...
cd /d "%~dp0ml_engine"
start "ML-Engine" cmd /k "title ML Engine (Port 8001) && venv\Scripts\python -m uvicorn main:app --host 0.0.0.0 --port 8001 --reload"
timeout /t 4 /nobreak >nul

:: ---- 2. Start Backend (Node.js Express on port 5000) ----
echo [2/3] Starting Backend (Express)...
cd /d "%~dp0backend"
start "Backend" cmd /k "title Backend (Port 5000) && node server.js"
timeout /t 3 /nobreak >nul

:: ---- 3. Start Frontend (Vite React on port 5173) ----
echo [3/3] Starting Frontend (Vite)...
cd /d "%~dp0frontend"
start "Frontend" cmd /k "title Frontend (Port 5173) && npx vite --host"
timeout /t 3 /nobreak >nul

echo.
echo ============================================
echo    All services launched!
echo.
echo    ML Engine:  http://localhost:8001
echo    Backend:    http://localhost:5000
echo    Frontend:   http://localhost:5173
echo.
echo    Test Accounts:
echo       admin@gmail.com    / admin123
echo       manager@gmail.com  / manager123
echo       qa@gmail.com       / qa123
echo       cse@gmail.com      / cse123
echo       customer@gmail.com / customer123
echo ============================================
echo.
echo Press any key to open the app in your browser...
pause >nul
start http://localhost:5173
