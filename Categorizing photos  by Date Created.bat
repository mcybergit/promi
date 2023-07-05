@echo off
setlocal EnableDelayedExpansion

set "path_to_images=./"
set "output_folder_prefix="

for %%f in ("%path_to_images%\*.jpg" "%path_to_images%\*.png") do (
    set "file_creation_time=%%~tf"
    set "formatted_creation_time=!file_creation_time:~6,4!-!file_creation_time:~3,2!-!file_creation_time:~0,2!"
    set "output_folder_name=%output_folder_prefix%!formatted_creation_time!"

    if not exist "%path_to_images%\!output_folder_name!\" (
        mkdir "%path_to_images%\!output_folder_name!\"
    )

    move "%%~ff" "%path_to_images%\!output_folder_name!\"
)