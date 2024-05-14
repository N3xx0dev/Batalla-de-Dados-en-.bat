@echo off

echo Batalla de dados
echo ------------------------------------------------------------------
echo Este juego consiste en una batalla de suerte.
echo Ambos jugadores de forma aleatoria sacaran un numero entre 1 y 6.
echo Como se contaran los puntos:
echo Separación de 0 o 1 entre ambos dados = 0 puntos.
echo Separación de 2 o 3 entre ambos dados = 1 puntos.
echo Separación de 4 o 5 entre ambos dados = 2 puntos.
echo ------------------------------------------------------------------
echo Ejemplo practico
echo Dado Jugador 1 = 2.
echo Dado Jugador 2 = 5.
echo Separacion = 3.
echo Resultado = El jugador 2 ha ganado un punto.
echo ------------------------------------------------------------------

set /p puntos=A cuantos puntos quieres jugar? 

set /a puntosj1=0
set /a puntosj2=0

:Juego

cls

if %puntosj1% GEQ %puntos% (
    
    echo Gana Jugador 1
    pause
    exit
)
if %puntosj2% GEQ %puntos% (
    
    echo Gana Jugador 2
    pause
    exit

)

echo Batalla de Dados
echo --------------------------------------
echo Puntos Jugador1: %puntosj1%
echo Puntos Jugador2: %puntosj2%
echo --------------------------------------
echo Jugamos a %puntos% puntos
pause
cls

set /a dado1=(%RANDOM%*6/32768)+1
set /a dado2=(%RANDOM%*6/32768)+1

echo Batalla de Dados
echo --------------------------------------
echo Dados jugador 1 = %dado1%
echo Dados jugador 2 = %dado2%
echo --------------------------------------
pause


if %dado1%==%dado2% (
    echo Separacion = Nula.
    echo Resultado= Empate.
)

set /a Separacion1=%dado1%-%dado2%
set /a Separacion2=%dado2%-%dado1%

if %dado1% GTR %dado2% (

    
    if %Separacion1%==1 (
        echo Separacion = 1
        echo Resultado = No se ganan puntos.
    )
    if %Separacion1%==2 (
        echo Separacion = 2
        echo Resultado = Jugador 1 gana un punto.
        set /a puntosj1=%puntosj1%+1
    )
    if %Separacion1%==3 (
        echo Separacion = 3
        echo Resultado = Jugador 1 gana un punto.
        set /a puntosj1=%puntosj1%+1
    ) 
    if %Separacion1%==4 (
        echo Separacion = 4
        echo Resultado = Jugador 1 gana dos punto.
        set /a puntosj1=%puntosj1%+2
    )
    if %Separacion1%==5 (
        echo Separacion = 5
        echo Resultado = Jugador 1 gana dos punto.
        set /a puntosj1=%puntosj1%+2
    )
)

if %dado2% GTR %dado1% (

    
    if %Separacion2%==1 (
        echo Separacion = 1
        echo Resultado = No se ganan puntos.
    ) 
    if %Separacion2%==2 (
        echo Separacion = 2 
        echo Resultado = Jugador 2 gana un punto.
        set /a puntosj2=%puntosj2%+1
    ) 
    if %Separacion2%==3 (
        echo Separacion = 3
        echo Resultado = Jugador 2 gana un punto.
        set /a puntosj2=%puntosj2%+1
    ) 
    if %Separacion2%==4 (
        echo Separacion = 4
        echo Resultado = Jugador 2 gana dos punto.
        set /a puntosj2=%puntosj2%+2
    ) 
    if %Separacion2%==5 (
        echo Separacion = 5
        echo Resultado = Jugador 2 gana dos punto.
        set /a puntosj2=%puntosj2%+2
    )
)
pause
goto Juego
