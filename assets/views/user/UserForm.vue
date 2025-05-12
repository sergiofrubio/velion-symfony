<template>
    <div class="container-fluid py-5">
      <h2 class="mb-5 text-primary fw-semibold text-center">{{ editMode ? 'Editar Usuario' : 'Añadir Usuario' }}</h2>
  
      <form @submit.prevent="handleSubmit" class="row justify-content-center gx-4 gy-3">
        <div class="col-md-4">
          <label class="form-label fw-medium">DNI</label>
          <input type="text" class="form-control" v-model="usuario.dni" required />
        </div>
  
        <div class="col-md-4">
          <label class="form-label fw-medium">Nombre</label>
          <input type="text" class="form-control" v-model="usuario.nombre" required />
        </div>
  
        <div class="col-md-4">
          <label class="form-label fw-medium">Apellidos</label>
          <input type="text" class="form-control" v-model="usuario.apellidos" required />
        </div>
  
        <div class="col-md-4">
          <label class="form-label fw-medium">Fecha de nacimiento</label>
          <input type="date" class="form-control" v-model="usuario.fecha_nacimiento" required />
        </div>
  
        <div class="col-md-4">
          <label class="form-label fw-medium">Dirección</label>
          <input type="text" class="form-control" v-model="usuario.direccion" required />
        </div>
  
        <div class="col-md-4">
          <label class="form-label fw-medium">Ciudad</label>
          <input type="text" class="form-control" v-model="usuario.ciudad" required />
        </div>
  
        <div class="col-md-4">
          <label class="form-label fw-medium">Provincia</label>
          <input type="text" class="form-control" v-model="usuario.provincia" required />
        </div>
  
        <div class="col-md-4">
          <label class="form-label fw-medium">Código Postal</label>
          <input type="text" class="form-control" v-model="usuario.zip" required />
        </div>
  
        <div class="col-md-4">
          <label class="form-label fw-medium">Género</label>
          <select class="form-select" v-model="usuario.genero" required>
            <option disabled value="">Selecciona...</option>
            <option value="masculino">Masculino</option>
            <option value="femenino">Femenino</option>
          </select>
        </div>
  
        <div class="col-md-4">
          <label class="form-label fw-medium">Teléfono</label>
          <input type="tel" class="form-control" v-model="usuario.telefono" required />
        </div>
  
        <div class="col-md-4">
          <label class="form-label fw-medium">Correo electrónico</label>
          <input type="email" class="form-control" v-model="usuario.email" required />
        </div>
  
        <div class="col-md-4" v-if="!editMode">
          <label class="form-label fw-medium">Contraseña</label>
          <input type="password" class="form-control" v-model="usuario.password" required />
        </div>
  
        <div class="col-12 text-center mt-4">
        <button type="button" class="btn btn-secondary px-5 fw-medium me-3" @click="goBack">
          Volver
        </button>
        <button type="submit" class="btn btn-primary px-5 fw-medium">
          {{ editMode ? 'Actualizar' : 'Crear' }}
        </button>
      </div>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    name: 'UsuarioForm',
    props: {
      userId: String
    },
    data() {
      return {
        usuario: {
          dni: '',
          nombre: '',
          apellidos: '',
          fecha_nacimiento: '',
          direccion: '',
          ciudad: '',
          provincia: '',
          zip: '',
          genero: '',
          telefono: '',
          email: '',
          password: ''
        }
      }
    },
    computed: {
      editMode() {
        return !!this.userId;
      }
    },
    methods: {
      async handleSubmit() {
        const url = this.editMode
          ? `/api/usuarios/${this.userId}`
          : `/api/usuarios`;
  
        const method = this.editMode ? 'PUT' : 'POST';
  
        try {
          const response = await fetch(url, {
            method,
            headers: {
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(this.usuario)
          });
  
          if (!response.ok) {
            throw new Error('Error al guardar el usuario');
          }
  
          this.$router.push('/usuarios');
        } catch (error) {
          console.error(error);
          alert('Hubo un error al guardar el usuario.');
        }
      },
      async fetchUsuario() {
        try {
          const response = await fetch(`/api/usuarios/${this.userId}`);
          if (!response.ok) throw new Error('Error al cargar los datos');
          const data = await response.json();
          this.usuario = { ...data };
        } catch (error) {
          console.error(error);
          alert('No se pudo cargar el usuario.');
        }
      },
      goBack() {
        this.$router.push('/usuarios');
      }
    },
    mounted() {
      if (this.editMode) {
        this.fetchUsuario();
      }
    }
  };
  </script>
  