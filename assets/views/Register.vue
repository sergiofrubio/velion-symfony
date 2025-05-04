<template>
    <div class="container-fluid min-vh-100 d-flex align-items-center justify-content-center bg-light">
      <div class="card shadow-sm p-4 p-md-5 rounded-4" style="max-width: 400px; width: 100%;">
        <h2 class="mb-4 text-center text-primary fw-semibold">Crear cuenta</h2>
  
        <form @submit.prevent="handleRegister">
          <div class="mb-3">
            <label for="nombre" class="form-label fw-medium">Nombre completo</label>
            <input
              type="text"
              class="form-control"
              id="nombre"
              v-model="nombre"
              placeholder="Tu nombre"
              required
            />
          </div>
  
          <div class="mb-3">
            <label for="email" class="form-label fw-medium">Correo electrónico</label>
            <input
              type="email"
              class="form-control"
              id="email"
              v-model="email"
              placeholder="ejemplo@correo.com"
              required
            />
          </div>
  
          <div class="mb-3">
            <label for="password" class="form-label fw-medium">Contraseña</label>
            <input
              type="password"
              class="form-control"
              id="password"
              v-model="password"
              placeholder="********"
              required
            />
          </div>
  
          <div class="mb-4">
            <label for="confirmar" class="form-label fw-medium">Confirmar contraseña</label>
            <input
              type="password"
              class="form-control"
              id="confirmar"
              v-model="confirmar"
              placeholder="********"
              required
            />
          </div>
  
          <button type="submit" class="btn btn-primary w-100 fw-medium">Registrarse</button>
        </form>
  
        <div class="mt-3 text-center">
          <small>¿Ya tienes cuenta? <router-link to="/login">Inicia sesión</router-link></small>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: "Register",
    data() {
      return {
        nombre: "",
        email: "",
        password: "",
        confirmar: ""
      };
    },
    methods: {
      handleRegister() {
        if (this.password !== this.confirmar) {
          alert("Las contraseñas no coinciden.");
          return;
        }
  
        // Aquí iría la lógica de registro real (API, validaciones, etc.)
        console.log("Registro con:", this.nombre, this.email, this.password);
  
        // Simulación de redirección tras registro
        this.$router.push("/login");
      }
    }
  };
  </script>
  
  <style scoped>
  input:focus {
    border-color: #0d6efd;
    box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.25);
  }
  </style>
  