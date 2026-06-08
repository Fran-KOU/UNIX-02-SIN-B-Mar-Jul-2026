#!/usr/bin/env bash

# 1. Aceptar los dos argumentos de la línea de comandos y asignarlos a variables
PRIMER_NOMBRE=$1
APELLIDO=$2

# 2. Crear el archivo output.txt y 
# 3. Escribir la fecha actual en formato DD-MM-YYYY (Punto Extra)
# Usamos '>' para crear el archivo (o sobrescribirlo si ya existe)
date +"%d-%m-%Y" > output.txt

# 4. Escribir el nombre completo en output.txt
# Usamos '>>' para añadir texto al final del archivo sin borrar la fecha
echo "$PRIMER_NOMBRE $APELLIDO" >> output.txt

# 5. Hacer una copia de respaldo llamada backup.txt
cp output.txt backup.txt

# 6. Imprimir el contenido de output.txt en la pantalla
cat output.txt