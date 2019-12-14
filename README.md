# Microservicio de Autenticación

Permite loguearse, registrarse y realizar consultas a usuarios por id y para verlos todos

## Iniciar sesión (Unico usuario para pruebas)

* endpoint: localhost:5003/auth/sign_in
* petición (POST):
Ldap
* endpoint: localhost:5003/ldap
* petición (POST):

{
  "email": "jufcardenasmo@unal.edu.co",  
  "password": "123456"
}
* respuesta: 200 OK

## Registro

* endpoint: localhost:5001/auth/
* petición (POST):

{
  "email": "ejemplo@email.com",  
  "name": "nombre_ej",  
  "nickname": "ej",  
  "password": "123456",  
  "password_confirmation": "123456"  
}
* respuesta: 200 OK

## Consulta por id del usuario
* endpoint: localhost:5003/users/id
* petición (GET):
* respuesta: 200 OK

## Consulta todos los usuarios
* endpoint: localhost:5003/users/
* petición (GET):
* respuesta: 200 OK

## Cerrar sesión
* endpoint: localhost:5003/auth/sign_out
* petición (DELETE):
En los Headers, pasar parametros de access-token, client y uid
* respuesta: 200 OK

Fuente: https://devise-token-auth.gitbook.io/devise-token-auth/usage
