<template>
  <div>
    <h3 class="fw-bold text-primary mb-4">{{ isEdit ? "Editar Producto" : "Nuevo Producto" }}</h3>
    <form @submit.prevent="handleSubmit" class="row g-3">
      <div class="col-md-6">
        <label for="id" class="form-label">ID</label>
        <input v-model="form.id" id="id" type="text" class="form-control" required />
      </div>
      <div class="col-md-6">
        <label for="description" class="form-label">Descripción</label>
        <input v-model="form.description" id="description" type="text" class="form-control" required />
      </div>
      <div class="col-md-6">
        <label for="price" class="form-label">Precio</label>
        <input v-model="form.price" id="price" type="text" class="form-control" required />
      </div>
      <div class="col-12 d-flex justify-content-end gap-2 mt-3">
        <router-link to="/products" class="btn btn-outline-secondary">Cancelar</router-link>
        <button type="submit" class="btn btn-primary">{{ isEdit ? "Guardar cambios" : "Crear Producto" }}</button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  id: "ProductForm",
  data() {
    return {
      isEdit: false,
      specializations: [
        // Debes cargar esto de la API/backend en producción
        { id: 1, description: "Psicología" },
        { id: 2, description: "Fisioterapia" },
        { id: 3, description: "Logopedia" }
      ],
      form: {
        id: "",
        description: "",
        price: ""
      }
    };
  },
  created() {
    const productId = this.$route.params.id;
    if (productId) {
      this.isEdit = true;
      // Aquí deberías cargar los datos reales del terapeuta desde tu API/backend según el id
      // Ejemplo mock:
      this.form = {
        id: "Elena",
        description: "López",
        price: "1985-03-12"
      };
    }
    // En producción, aquí cargarías las especializaciones desde la API.
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
        alert('Terapeuta creado (mock)');
      }
      this.$router.push("/products");
    }
  }
};
</script>

<style scoped>
/* Personaliza si lo necesitas */
</style>