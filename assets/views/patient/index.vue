<template>
  <div>
    <div class="row align-patients-center mb-3">
      <div class="col-12 col-md-auto mb-2 mb-md-0">
        <h3 class="fw-bold text-primary mb-0">Pacientes</h3>
      </div>
      <div class="col-12 col-md d-flex justify-content-md-end gap-2">
        <input type="text" v-model="filter" placeholder="Filtrar pacientes..." class="form-control"
          style="max-width: 220px" />
        <router-link to="/patients/new" class="btn btn-primary flex-shrink-0">
          <i class="bi bi-plus-circle"></i> Nuevo Paciente
        </router-link>
      </div>
    </div>

    <div class="table-responsive">
      <table class="table table-hover align-middle">
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Teléfono</th>
            <th>Seguro</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="patient in filteredPatients" :key="patient.id">
            <td>{{ patient.name }} {{ patient.surname }}</td>
            <td>{{ patient.email }}</td>
            <td>{{ patient.phone }}</td>
            <td>{{ patient.insurance }}</td>
            <td>
              <router-link :to="`/patients/${patient.id}/edit`" class="btn btn-sm btn-outline-primary me-2">
                <i class="bi bi-pencil"></i>
              </router-link>
              <button class="btn btn-sm btn-outline-danger" @click="deletePatient(patient.id)">
                <i class="bi bi-trash"></i>
              </button>
            </td>
          </tr>
          <tr v-if="filteredPatients.length === 0">
            <td colspan="5" class="text-center text-muted">No hay pacientes registrados.</td>
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
  name: "Patient",
  data() {
    return {
      filter: "",
      currentPage: 1,
      patientsPerPage: 5,
      patients: [
        { id: 1, name: "Ana", surname: "García", email: "ana@example.com", phone: "612345678", insurance: "Sanitas" },
        { id: 2, name: "Luis", surname: "Pérez", email: "luis@example.com", phone: "698765432", insurance: "Adeslas" }
      ]
    };
  },
  computed: {
    filteredPatients() {
      const f = this.filter.toLowerCase();
      return this.patients.filter(p =>
        p.name.toLowerCase().includes(f) ||
        p.surname.toLowerCase().includes(f) ||
        p.email.toLowerCase().includes(f) ||
        p.phone.toLowerCase().includes(f) ||
        p.insurance.toLowerCase().includes(f)
      );
    },
    totalPages() {
      return Math.ceil(this.filteredPatients.length / this.patientsPerPage);
    },
    paginatedPatients() {
      const start = (this.currentPage - 1) * this.patientsPerPage;
      return this.filteredPatients.slice(start, start + this.patientsPerPage);
    }
  },
  methods: {
    deletePatient(id) {
      this.patients = this.patients.filter(p => p.id !== id);
    }
  }
};
</script>

<style scoped>
.table thead th {
  background: #f0f4ff;
}
</style>