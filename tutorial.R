# testeando el funcionamiento de byte encoding & character encoding

x <- "ANA LAURA"
paste(charToRaw(x),collapse=":")
#[1] "41:4e:41:20:4c:41:55:52:41"
charToRaw(x)
#[1] 41 4e 41 20 4c 41 55 52 41
str(charToRaw(x))

# ejemplos de libreria hexView
library(hexView)
readLines(hexViewFile("rawTest.txt"))

fileBlock <- readRaw(hexViewFile("rawTest.txt"), width=8)
blockValue(fileBlock)

fileBlock <- readRaw(hexViewFile("rawTest.int"), human="int")
blockValue(fileBlock)

# Crear mi propio ejemplo con hexView
readLines("justAFile.txt")
fileBlock <- readRaw("justAFile.txt", width=8)
blockValue(fileBlock)
# aqui guarda todo codificado en hexa. 
fileBlock$fileRaw



library(tidyverse)
# construir un arreglo de caracteres concatenando "0x" + numero hexa
hexas <- stringr::str_c("0x",fileBlock$fileRaw,sep="")
len <- length(hexas)

# concatenar "0x32", para ir armando el array en el struct
hex <- stringr::str_glue("{hexas},")
hex <- stringr::str_flatten(hex)
hex <- str_sub(hex, end=-2) # elimino la ultima coma en hex


# doble llave para que la muestre 
stringr::str_glue("unsigned char model[] = {{ {hex} }};
unsigned int model_len = {len};")

################################################33
file_tf <- "modeltf.tflite"

file_size <- file.info(file_tf)$size

a_vector <- vector(mode="raw",length = file_size)

zz <- file(file_tf,"rb")

a_vector <- readBin(con=zz,what=raw(), size = 1,signed = FALSE,n=file_size)

#for(i in 1:file_size){
#  a_vector[i] <- readBin(con=zz,what=raw(), size = 1,signed = FALSE)
#}

hexas <- stringr::str_c("0x",a_vector,sep="")
len <- length(hexas)

# concatenar "0x32", para ir armando el array en el struct
hex <- stringr::str_glue("{hexas},")
hex <- stringr::str_flatten(hex)
hex <- stringr::str_sub(hex, end=-2) # elimino la ultima coma en hex


# doble llave para que la muestre 
cadena_a_guardar <- stringr::str_glue("unsigned char model[] = {{ {hex} }};
unsigned int model_len = {len};")

# guardar el archivo en C para microcontroladores
write(cadena_a_guardar,file="archivo.c")