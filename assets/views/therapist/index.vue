<template>
  <div>
    <div class="row align-items-center mb-3">
      <div class="col-12 col-md-auto mb-2 mb-md-0">
        <h3 class="fw-bold text-primary mb-0">Terapeutas</h3>
      </div>
      <div class="col-12 col-md d-flex justify-content-md-end gap-2">
        <input type="text" v-model="filter" placeholder="Filtrar terapeutas..." class="form-control"
          style="max-width: 220px" />
        <router-link to="/therapists/new" class="btn btn-primary flex-shrink-0">
          <i class="bi bi-plus-circle"></i> Nuevo Terapeuta
        </router-link>
      </div>
    </div>

    <div class="table-responsive">
      <table class="table table-hover align-middle">
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Especialidad</th>
            <th>Teléfono</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="therapist in filteredItems" :key="therapist.id">
            <td>{{ therapist.name }} {{ therapist.surname }}</td>
            <td>{{ therapist.email }}</td>
            <td>{{ therapist.specialty }}</td>
            <td>{{ therapist.phone }}</td>
            <td>
              <router-link :to="`/therapists/${therapist.id}/edit`" class="btn btn-sm btn-outline-primary me-2">
                <i class="bi bi-pencil"></i>
              </router-link>
              <button class="btn btn-sm btn-outline-danger" @click="deleteTherapist(therapist.id)">
                <i class="bi bi-trash"></i>
              </button>
            </td>
          </tr>
          <tr v-if="filteredItems.length === 0">
            <td colspan="5" class="text-center text-muted">No hay terapeutas registrados.</td>
          </tr>
        </tbody>
      </table>
    </div>

    <nav>
      <ul class="pagination justify-content-end">
        <li class="page-item" :class="{ disabled: currentPage === 1 }" @click="currentPage--">
          <a class="page-link" href="#">Anterior</a>
        </li>
        <li class="page-item" v-for="n in totalPages" :key="n" :class="{ active: currentPage === n }"
          @click="currentPage = n">
          <a class="page-link" href="#">{{ n }}</a>
        </li>
        <li class="page-item" :class="{ disabled: currentPage === totalPages }" @click="currentPage++">
          <a class="page-link" href="#">Siguiente</a>
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
export default {
  name: "Therapist",
  data() {
    return {
      filter: "",
      currentPage: 1,
      itemsPerPage: 5,
      therapists: [
        { id: 1, name: "Elena", surname: "López", email: "elena@example.com", specialty: "Psicología", phone: "600111222" },
        { id: 2, name: "Carlos", surname: "Ruiz", email: "carlos@example.com", specialty: "Fisioterapia", phone: "699999999" }
      ]
    };
  },
  computed: {
    filteredItems() {
      const f = this.filter.toLowerCase();
      return this.therapists.filter(t =>
        t.name.toLowerCase().includes(f) ||
        t.surname.toLowerCase().includes(f) ||
        t.email.toLowerCase().includes(f) ||
        t.specialty.toLowerCase().includes(f) ||
        t.phone.toLowerCase().includes(f)
      );
    },
    totalPages() {
      return Math.ceil(this.filteredItems.length / this.itemsPerPage);
    },
    paginatedItems() {
      const start = (this.currentPage - 1) * this.itemsPerPage;
      return this.filteredItems.slice(start, start + this.itemsPerPage);
    }

  },
  methods: {
    deleteTherapist(id) {
      this.therapists = this.therapists.filter(t => t.id !== id);
    }
  }
};
</script>

<style scoped>
.table thead th {
  background: #f0f4ff;
}
</style>