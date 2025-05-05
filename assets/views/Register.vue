<template>
  <div class="container-fluid min-vh-100 d-flex align-items-center justify-content-center bg-light">
    <div class="card shadow-sm p-4 p-md-5 rounded-4" style="max-width: 600px; width: 100%;">
      <h2 class="mb-4 text-center text-primary fw-semibold">Crear cuenta</h2>

      <form @submit.prevent="handleRegister">
        <div class="row">
          <div class="mb-3 col-md-6">
            <label class="form-label fw-medium">DNI</label>
            <input type="text" class="form-control" v-model="dni" required />
          </div>

          <div class="mb-3 col-md-6">
            <label class="form-label fw-medium">Nombre</label>
            <input type="text" class="form-control" v-model="nombre" required />
          </div>

          <div class="mb-3 col-md-6">
            <label class="form-label fw-medium">Apellidos</label>
            <input type="text" class="form-control" v-model="apellidos" required />
          </div>

          <div class="mb-3 col-md-6">
            <label class="form-label fw-medium">Fecha de nacimiento</label>
            <input type="date" class="form-control" v-model="fecha_nacimiento" required />
          </div>

          <div class="mb-3 col-md-6">
            <label class="form-label fw-medium">Dirección</label>
            <input type="text" class="form-control" v-model="direccion" required />
          </div>

          <div class="mb-3 col-md-6">
            <label class="form-label fw-medium">Ciudad</label>
            <input type="text" class="form-control" v-model="ciudad" required />
          </div>

          <div class="mb-3 col-md-6">
            <label class="form-label fw-medium">Provincia</label>
            <input type="text" class="form-control" v-model="provincia" required />
          </div>

          <div class="mb-3 col-md-6">
            <label class="form-label fw-medium">Código Postal</label>
            <input type="text" class="form-control" v-model="zip" required />
          </div>

          <div class="mb-3 col-md-6">
            <label class="form-label fw-medium">Género</label>
            <select class="form-select" v-model="genero" required>
              <option disabled value="">Selecciona...</option>
              <option value="masculino">Masculino</option>
              <option value="femenino">Femenino</option>
            </select>
          </div>

          <div class="mb-3 col-md-6">
            <label class="form-label fw-medium">Teléfono</label>
            <input type="tel" class="form-control" v-model="telefono" required />
          </div>

          <div class="mb-3 col-md-6">
            <label class="form-label fw-medium">Correo electrónico</label>
            <input type="email" class="form-control" v-model="email" required />
          </div>

          <div class="mb-3 col-md-6">
            <label class="form-label fw-medium">Contraseña</label>
            <input type="password" class="form-control" v-model="password" required />
          </div>

          <!-- <div class="mb-4 col-md-6">
            <label class="form-label fw-medium">Confirmar contraseña</label>
            <input type="password" class="form-control" v-model="confirmar" required />
          </div> -->
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
      dni: "",
      nombre: "",
      apellidos: "",
      fecha_nacimiento: "",
      direccion: "",
      ciudad: "",
      provincia: "",
      zip: "",
      genero: "",
      telefono: "",
      email: "",
      password: "",
      confirmar: ""
    };
  },
  methods: {
    handleRegister() {
      // if (this.password !== this.confirmar) {
      //   alert("Las contraseñas no coinciden.");
      //   return;
      // }

      fetch("/api/register", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          dni: this.dni,
          nombre: this.nombre,
          apellidos: this.apellidos,
          fecha_nacimiento: this.fecha_nacimiento,
          direccion: this.direccion,
          ciudad: this.ciudad,
          provincia: this.provincia,
          zip: this.zip,
          genero: this.genero,
          telefono: this.telefono,
          email: this.email,
          password: this.password
        })
      })
        .then(async response => {
          const data = await response.json();
          if (!response.ok) {
            throw new Error(data.message || "Error al registrarse");
          }
          this.$router.push("/login");
        })
        .catch(err => {
          alert(err.message);
        });
    }
  }
};
</script>

<style scoped>
input:focus,
select:focus {
  border-color: #0d6efd;
  box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.25);
}
</style>
