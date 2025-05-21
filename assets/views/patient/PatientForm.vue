<template>
  <div>
    <h3 class="fw-bold text-primary mb-4">{{ isEdit ? "Editar Paciente" : "Nuevo Paciente" }}</h3>
    <form @submit.prevent="handleSubmit" class="row g-3">
      <div class="col-md-6">
        <label for="name" class="form-label">Nombre</label>
        <input v-model="form.name" id="name" type="text" class="form-control" required />
      </div>
      <div class="col-md-6">
        <label for="name" class="form-label">Apellidos</label>
        <input v-model="form.surname" id="name" type="text" class="form-control" required />
      </div>
      <div class="col-md-6">
        <label for="id" class="form-label">DNI</label>
        <input v-model="form.id" id="id" type="text" class="form-control" required />
      </div>
      <div class="col-md-6">
        <label for="birth_date" class="form-label">Fecha de nacimiento</label>
        <input v-model="form.birth_date" id="birth_date" type="date" class="form-control" />
      </div>
      <div class="col-md-6">
        <label for="genre" class="form-label">Género</label>
        <select v-model="form.genre" id="genre" class="form-select">
          <option value="">Selecciona</option>
          <option value="Masculino">Masculino</option>
          <option value="Femenino">Femenino</option>
          <option value="Otro">Otro</option>
        </select>
      </div>
      <div class="col-md-6">
        <label for="name" class="form-label">Alergias</label>
        <input v-model="form.name" id="name" type="text" class="form-control" required />
      </div>
      <div class="col-md-6">
        <label for="email" class="form-label">Correo electrónico</label>
        <input v-model="form.email" id="email" type="email" class="form-control" required />
      </div>
      <div class="col-md-6">
        <label for="phone" class="form-label">Teléfono</label>
        <input v-model="form.phone" id="phone" type="tel" class="form-control" />
      </div>
      <!-- <div class="col-md-6">
        <label for="address" class="form-label">Dirección</label>
        <input v-model="form.address" id="address" type="text" class="form-control" />
      </div>
      <div class="col-md-6">
        <label for="city" class="form-label">Ciudad</label>
        <input v-model="form.city" id="city" type="text" class="form-control" />
      </div>
      <div class="col-md-6">
        <label for="province" class="form-label">Provincia</label>
        <input v-model="form.province" id="province" type="text" class="form-control" />
      </div>
      <div class="col-md-3">
        <label for="zip" class="form-label">Código Postal</label>
        <input v-model="form.zip" id="zip" type="number" class="form-control" />
      </div> -->
      <!-- <div class="col-md-6" v-if="!isEdit">
        <label for="password" class="form-label">Contraseña</label>
        <input v-model="form.password" id="password" type="password" class="form-control" :required="!isEdit" />
      </div>
      <div class="col-md-6" v-if="!isEdit">
        <label for="password2" class="form-label">Repite Contraseña</label>
        <input v-model="form.password2" id="password2" type="password" class="form-control" :required="!isEdit" />
      </div> -->
      <div class="col-12 d-flex justify-content-end gap-2 mt-3">
        <router-link to="/patients" class="btn btn-outline-secondary">Cancelar</router-link>
        <button type="submit" class="btn btn-primary">{{ isEdit ? "Guardar cambios" : "Crear Paciente" }}</button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: "PatientForm",
  data() {
    return {
      isEdit: false,
      form: {
        name: "",
        id: "",
        birth_date: "",
        genre: "",
        email: "",
        phone: "",
        address: "",
        city: "",
        province: "",
        zip: "",
        password: "",
        password2: "",
        roles: ["ROLE_PATIENT"]
      }
    };
  },
  created() {
    // Si la ruta tiene id, estamos editando
    const patientId = this.$route.params.id;
    if (patientId) {
      this.isEdit = true;
      // Aquí deberías cargar los datos reales del paciente desde tu API/backend según el id
      // Ejemplo mock:
      this.form = {
        name: "Ana",
        id: "García",
        birth_date: "1990-01-01",
        genre: "Femenino",
        email: "ana@example.com",
        phone: "612345678",
        address: "Calle Ejemplo 12",
        city: "Madrid",
        province: "Madrid",
        zip: "28001",
        password: "",
        password2: "",
        roles: ["ROLE_PATIENT"]
      };
    }
  },
  methods: {
    handleSubmit() {
      if (!this.isEdit && this.form.password !== this.form.password2) {
        alert("Las contraseñas no coinciden");
        return;
      }
      // Aquí envía los datos a tu API o backend.
      if (this.isEdit) {
        alert('Cambios guardados (mock)');
      } else {
        alert('Paciente creado (mock)');
      }
      this.$router.push("/patients");
    }
  }
};
</script>

<style scoped>
/* Personaliza si lo necesitas */
</style>