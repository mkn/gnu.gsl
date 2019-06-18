
@ECHO on
SET CWD=%CD%
SET DIR="gsl"
SET VERSION="windows"
SET URL="https://github.com/dekken/gsl"
IF NOT EXIST %CWD%\%DIR% (
git clone %URL% -b %VERSION% --depth 1 --recursive %DIR% || exit 666 /b
)
RD /Q /S %CWD%\inc %CWD%\lib
mkdir %CWD%\%DIR%\build %CWD%\inc %CWD%\lib
CD %CWD%\%DIR%\build
cmake -A x64 ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_INSTALL_PREFIX=. ^
      -DBUILD_SHARED_LIBS=ON ..
if errorlevel 1 exit 1
cmake --build . --config Release --target install
if errorlevel 1 exit 1
move %CWD%\%DIR%\build\gsl %CWD%\inc\gsl
move %CWD%\%DIR%\build\Release\* %CWD%\lib
move %CWD%\%DIR%\build\bin\Release\gsl* %CWD%\lib
move %CWD%\%DIR%\build\config.h %CWD%\inc\config.h
CD %CWD%
