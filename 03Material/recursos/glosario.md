# Glosario — Fundamentos de Python y R

> Este glosario se construirá iterativamente durante el curso. Cuando aparezca un término técnico nuevo en una sesión, agregar aquí su definición breve y enlace al notebook donde se introdujo.

## A

**Argumento (de una función)**
> El valor que pasas a una función al llamarla. Ej: en `print("hola")`, `"hola"` es el argumento. Ver Sesión 02 (Funciones).

## D

**DataFrame**
> Estructura tabular bidimensional similar a una hoja de Excel: filas, columnas con nombre, tipos de datos por columna. En Python: `pandas.DataFrame`. En R: `data.frame` (base) o `tibble` (tidyverse).

## F

**Función**
> Bloque de código nombrado que recibe entradas (argumentos) y devuelve una salida. Reutilizable. Ver Sesión 02.

## I

**Indexado base-0 vs base-1**
> Python empieza a contar desde 0 (`lista[0]` es el primero). R empieza desde 1 (`vec[1]` es el primero). Ver `S0X_TRAPS.md`.

## K

**Kernel (Jupyter)**
> El "motor" que ejecuta el código de un notebook. Cada notebook tiene un kernel asociado (Python, R, Julia...). Cambiar de kernel cambia el lenguaje del notebook.

## L

**Lista (Python) / Vector (R)**
> Secuencia ordenada de valores. Una lista en Python puede tener tipos mezclados (`[1, "a", 3.14]`); un vector en R es homogéneo (todos del mismo tipo).

## P

**Pipeline (de datos)**
> Secuencia de pasos: cargar → limpiar → transformar → visualizar/modelar. Idealmente expresada como código encadenado, no copy-paste.

**Pipe operator**
> En R: `%>%` (magrittr) o `|>` (nativo R 4.1+). Permite encadenar operaciones: `df %>% filter(x > 5) %>% select(a, b)`. Python pandas usa methods chaining: `df.query('x > 5')[['a', 'b']]`.

## T

**Tibble**
> Versión moderna del `data.frame` en R, parte del tidyverse. Imprime mejor (no llena la pantalla con grandes datasets) y es más estricto en acceso de columnas.

**tidyverse**
> Conjunto de paquetes R (dplyr, ggplot2, tidyr, readr, purrr...) que comparten filosofía: datos en tibbles, código encadenado con `%>%`, sintaxis declarativa.

## V

**Variable**
> Nombre que apunta a un valor. En Python: `x = 5`. En R: `x <- 5` (preferido) o `x = 5` (también válido, menos idiomático).

> **Nota:** en Python `y = x` no copia el objeto si es mutable (lista, dict). En R, `y <- x` con copy-on-modify simula copia. Ver `S0X_TRAPS.md` Trampa #2.
