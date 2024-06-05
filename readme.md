
# CLOUDUPLOADER
Clouduploader es un programa dedicado en subir archivos locales a azure. En concreto, a un contenedor dentro de una cuenta de almacenamiento.
Ambos datos hay que pasarselos en en el archivo CONF.

La mayor parte del programa esta escrito en bash, aunque también usa algunos comandos de Azure-CLI

Su funcionamiento interno es bastante simple:
- chequea si existente el contenedores y la cuenta de almacenamiento de azure. Si alguno no existiera se pararia la ejecución.
- chequea si existe el archivo en local que quieres subir. Si algún archivo no existe para el programa.
- chequea si este archivo ya existe en el contenedor . El programa no sobreescribe archivos



## Uso

para lanzar el programa hay que lanzar el script "clouduploader", teniendo como argumentos todos los ficheros locales que se quieran subir
```
./clouduploader.sh archivo1 archivo2 archivo3
```

Si le dices de cargar un fichero que ya esta cargado el programa ignorará la orden. Pero seguirá subiendo los archivos que no existan en azure.



