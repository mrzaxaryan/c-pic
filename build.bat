@echo off
setlocal enabledelayedexpansion

set OPTIMIZATION_LEVEL=-Os

rmdir /s /q bin 2>nul

rem ==== Windows classic builds  =====

call compiler.bat   bin\windows i386-pc-windows-msvc ^
                    windows_i386  ^
                    src\*.c ^
                    -DARCHITECTURE_I386 ^
                    -DPLATFORM_WINDOWS ^
                    -DPLATFORM_WINDOWS_I386 ^
                    %OPTIMIZATION_LEVEL%
if errorlevel 1 goto :end

call compiler.bat   bin\windows x86_64-pc-windows-msvc ^
                    windows_x86_64 ^
                    src\*.c ^
                    -DARCHITECTURE_X86_64 ^
                    -DPLATFORM_WINDOWS ^
                    -DPLATFORM_WINDOWS_X86_64 ^
                    %OPTIMIZATION_LEVEL% 
if errorlevel 1 goto :end

call compiler.bat   bin\windows armv7a-pc-windows-msvc ^
                    windows_arm32 ^
                    src\*.c ^
                    -DARCHITECTURE_ARM7A ^
                    -DPLATFORM_WINDOWS ^
                    -DPLATFORM_WINDOWS_ARM7A ^
                    %OPTIMIZATION_LEVEL%
if errorlevel 1 goto :end

call compiler.bat   bin\windows aarch64-pc-windows-msvc ^
                    windows_aarch64 ^
                    src\*.c ^
                    -DARCHITECTURE_AARCH64 ^
                    -DPLATFORM_WINDOWS ^
                    -DPLATFORM_WINDOWS_AARCH64 ^
                    %OPTIMIZATION_LEVEL%
if errorlevel 1 goto :end

rem ===== Windows payloads (built with linux triples, but PLATFORM_WINDOWS macros) =====
call pic-compiler.bat  bin\windows i386-unknown-linux-gnu ^
                    windows_i386  ^
                    src\*.c ^
                    -DARCHITECTURE_I386 ^
                    -DPLATFORM_WINDOWS ^
                    -DPLATFORM_WINDOWS_I386 ^
                    %OPTIMIZATION_LEVEL% ^
                    -fshort-wchar 
if errorlevel 1 goto :end

call pic-compiler.bat  bin\windows x86_64-unknown-linux-gnu ^
                    windows_x86_64 ^
                    src\*.c ^
                    -DARCHITECTURE_X86_64 ^
                    -DPLATFORM_WINDOWS ^
                    -DPLATFORM_WINDOWS_X86_64 ^
                    %OPTIMIZATION_LEVEL% ^
                    -fshort-wchar
if errorlevel 1 goto :end

call pic-compiler.bat  bin\windows thumbv7a-none-linux-gnueabi ^
                    windows_arm32 ^
                    src\*.c ^
                    -DARCHITECTURE_ARM7A ^
                    -DPLATFORM_WINDOWS ^
                    -DPLATFORM_WINDOWS_ARM7A ^
                    %OPTIMIZATION_LEVEL% ^
                    -fshort-wchar
if errorlevel 1 goto :end

call pic-compiler.bat  bin\windows aarch64-unknown-linux-gnu ^
                    windows_aarch64 ^
                    src\*.c ^
                    -DARCHITECTURE_AARCH64 ^
                    -DPLATFORM_WINDOWS ^
                    -DPLATFORM_WINDOWS_AARCH64 ^
                    %OPTIMIZATION_LEVEL% ^
                    -fshort-wchar
if errorlevel 1 goto :end

rem ===== Linux payloads =====
call pic-compiler.bat  bin\linux i386-unknown-linux-gnu ^
                    linux_i386 ^
                    src\*.c ^
                    -DARCHITECTURE_I386 ^
                    -DPLATFORM_LINUX ^
                    -DPLATFORM_LINUX_I386 ^
                    %OPTIMIZATION_LEVEL%
if errorlevel 1 goto :end

call pic-compiler.bat  bin\linux x86_64-unknown-linux-gnu ^
                    linux_x86_64 ^
                    src\*.c ^
                    -DARCHITECTURE_X86_64 ^
                    -DPLATFORM_LINUX ^
                    -DPLATFORM_LINUX_X86_64 ^
                    %OPTIMIZATION_LEVEL%
if errorlevel 1 goto :end

call pic-compiler.bat  bin\linux aarch64-unknown-linux-gnu ^
                    linux_aarch64 ^
                    src\*.c ^
                    -DARCHITECTURE_AARCH64 ^
                    -DPLATFORM_LINUX ^
                    -DPLATFORM_LINUX_AARCH64 ^
                    %OPTIMIZATION_LEVEL%
if errorlevel 1 goto :end

:end
endlocal
