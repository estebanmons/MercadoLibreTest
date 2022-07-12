# Mercado Libre Test
Challenge Mercado Libre

Se realiza implementación basado en los servicios indicados de Mercado libre:

https://developers.mercadolibre.com.ar/es_ar/items-y-busquedas

# VIPER

Se escoge la arquitectura VIPER, que nos ayuda a una correcta segementación de los modulos en la aplicación, respetando los principios SOLID.
Basándonos especialmente en la implementación de infinum:
https://github.com/infinum/iOS-VIPER-Xcode-Templates

# Dependencias

## Alamofire
Se utiliza para realizar las peticiones hacia los servicios.
https://github.com/Alamofire/Alamofire

## Kingfisher
Se utiliza para descargar imágenes y realizar un correcto manjeo del caching de estás.
https://github.com/onevcat/Kingfisher

# Módulos

Se crean 3 módulos específicos, los cuáles son **Search**, **ProductList** y **ProductDetail**

## Search

En este módulo se tiene la vista del buscador, la cuál es la primera de cara a el usuario.
El usuario puede ingresar una consulta, y le retornará las coincidencias en un limite de máximo 8 resultados.

## ProductList

Continuamos con el módulo que nos lista los resultados de la búsqueda, ya sea básado en la categoria si selccionó un producto anteriormente o sin ella.

## ProductDetail

Para finalizar, se crea el módulo que muestra el detalle del producto. Con un slides de imágenes, título, si el producto es nuevo o usado y la ubicación del vendedor.

# Juan Esteban Monsalve
## iOS Developer
