# Flutter - redux 
Se necesita un live server para poner el json que se necesita para el uso del middleware

Para eso se debe utilizar nodejs

```shell
npm install live-server -g
```

Después se debe ubicar en la carpeta /lib/api/ y ejecutar desde consola el comando
```shell
live-server
```

En un navegador se podrá acceder al archivo json

http://localhost:8080/people.json

```json
[
  {
    "id": "1",
    "name": "Foo",
    "age": 20,
    "image_url": "https://images.unsplash.com/photo-1489980557514-251d61e3eeb6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80"
  },
  {
    "id": "2",
    "name": "Bar",
    "age": 30,
    "image_url": "https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80"
  },
  {
    "id": "3",
    "name": "Baz",
    "age": 40,
    "image_url": "https://images.unsplash.com/photo-1485893086445-ed75865251e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1760&q=80"
  }
]
```