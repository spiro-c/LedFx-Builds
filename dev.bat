cd frontend
if "%~1"=="" goto both
if "%~1"=="frontend" (goto frontend) else goto backend

:frontend
yarn start
goto done

:backend
cd..
venv\Scripts\activate.bat & ledfx -vv --offline
goto done

:both
cd ..
call wt -d "./backend" cmd /k "title LedFx-Backend & code . & cd .. && venv\Scripts\activate.bat & ledfx -vv --offline"; ^
split-pane -H -d "./frontend" cmd /k "title LedFx-Frontend & code . & yarn start"

:done
cls
echo LedFx-Dev-Environment startet!