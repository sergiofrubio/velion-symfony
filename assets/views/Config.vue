<template>
    <div>
      <h2 class="mb-4 text-primary fw-bold text-primary mb-0">Configuración de cuenta</h2>
  
      <!-- Sección de Datos Personales -->
      <section class="mb-5">
        <h5 class="mb-3 border-bottom pb-2">Datos personales</h5>
        <div class="row g-3">
          <div class="col-md-6">
            <label for="nombre" class="form-label fw-medium">Nombre</label>
            <input type="text" id="nombre" v-model="nombre" class="form-control" required />
          </div>
          <div class="col-md-6">
            <label for="apellidos" class="form-label fw-medium">Apellidos</label>
            <input type="text" id="apellidos" v-model="apellidos" class="form-control" required />
          </div>
        </div>
      </section>
  
      <!-- Sección de Cuenta -->
      <section class="mb-5">
        <h5 class="mb-3 border-bottom pb-2">Cuenta</h5>
        <div class="row g-3">
          <div class="col-md-6">
            <label for="email" class="form-label fw-medium">Correo electrónico</label>
            <input type="email" id="email" v-model="email" class="form-control" required />
          </div>
          <div class="col-md-6">
            <label for="password" class="form-label fw-medium">Nueva contraseña</label>
            <input
              type="password"
              id="password"
              v-model="password"
              class="form-control"
              placeholder="Dejar en blanco para no cambiar"
            />
          </div>
        </div>
      </section>
  
      <!-- Botón de Guardar -->
      <div >
        <button class="btn btn-primary px-4" @click="handleUpdate">Guardar cambios</button>
      </div>
  
      <!-- Mensaje de confirmación -->
      <div v-if="mensaje" class="alert alert-success mt-4 text-center">
        {{ mensaje }}
      </div>
    </div>
  </template>
  
  
  <script>
  export default {
    name: "Config",
    data() {
      return {
        nombre: "",
        apellidos: "",
        email: "",
        password: "",
        mensaje: ""
      };
    },
    mounted() {
      // Simulación de carga de datos del usuario desde localStorage
      this.nombre = localStorage.getItem('nombre') || "";
      this.apellidos = localStorage.getItem('apellidos') || "";
      this.email = localStorage.getItem('user') || "";
    },
    methods: {
      async handleUpdate() {
        const token = localStorage.getItem('token');
        if (!token) return alert('No autorizado');
  
        try {
          const response = await fetch('/api/user/update', {
            method: 'PUT',
            headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify({
              nombre: this.nombre,
              apellidos: this.apellidos,
              email: this.email,
              password: this.password
            })
          });
  
          const data = await response.json();
  
          if (!response.ok) throw new Error(data.message || 'Error al actualizar los datos');
  
          this.mensaje = 'Datos actualizados correctamente';
  
          // Actualizar localStorage
          localStorage.setItem('nombre', this.nombre);
          localStorage.setItem('apellidos', this.apellidos);
          localStorage.setItem('user', this.email);
          this.password = '';
        } catch (err) {
          alert(err.message);
        }
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
  