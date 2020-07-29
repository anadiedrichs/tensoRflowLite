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

