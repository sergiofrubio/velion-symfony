<template>
    <div class="container-fluid min-vh-100 d-flex align-items-center justify-content-center bg-light">
      <div class="card shadow-sm p-4 p-md-5 rounded-4 text-center" style="max-width: 500px; width: 100%;">
        <h1 class="display-1 text-danger fw-bold mb-3">404</h1>
        <h2 class="mb-4 text-primary fw-bold text-primary mb-0">¡Oops! Página no encontrada</h2>
        <p class="lead mb-4">
          Lo sentimos, la página que estás buscando no existe o ha sido movida.
        </p>
        <router-link to="/" class="btn btn-primary btn-lg fw-medium rounded-pill">
          Volver al inicio
        </router-link>
        <div class="mt-3 text-center">
          <small>
            Si crees que esto es un error, por favor, contacta con el administrador.
          </small>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import { RouterLink } from 'vue-router';
  
  export default {
    name: "Error",
    components: {
      RouterLink
    }
  };
  </script>
  
  <style scoped>
  .display-1 {
    font-size: 6rem; /* Ajusta el tamaño del "404" */
  }
  
  .btn-primary {
    border-radius: 2rem; /* Hacer el botón más redondeado */
  }
  </style>