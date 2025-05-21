<template>
  <div>
    <div class="row align-items-center mb-3">
      <div class="col-12 col-md-auto mb-2 mb-md-0">
        <h3 class="fw-bold text-primary mb-0">Productos</h3>
      </div>
      <div class="col-12 col-md d-flex justify-content-md-end gap-2">
        <input type="text" v-model="filter" placeholder="Filtrar productos..." class="form-control"
          style="max-width: 220px" />
        <router-link to="/therapists/new" class="btn btn-primary flex-shrink-0">
          <i class="bi bi-plus-circle"></i> Nuevo Producto
        </router-link>
      </div>
    </div>

    <div class="table-responsive">
      <table class="table table-hover align-middle">
        <thead>
          <tr>
            <th>#</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>Rol</th>
            <th>Estado</th>
            <th >Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(usuario, index) in paginatedItems" :key="usuario.id">
            <td>{{ usuario.id }}</td>
            <td>{{ usuario.nombre }}</td>
            <td>{{ usuario.email }}</td>
            <td>{{ usuario.rol }}</td>
            <td>
              <span class="badge" :class="usuario.activo ? 'bg-success' : 'bg-secondary'">
                {{ usuario.activo ? 'Activo' : 'Inactivo' }}
              </span>
            </td>
            <td >
              <button class="btn btn-sm btn-outline-primary me-2 bi bi-pencil-square">
              </button>
              <button class="btn btn-sm btn-outline-danger bi bi-trash">
              </button>
            </td>
          </tr>
          <tr v-if="filteredItems.length === 0">
            <td colspan="6" class="text-center text-muted">Sin resultados</td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Paginación -->
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
  name: "Producto",
  data() {
    return {
      filter: "",
      currentPage: 1,
      itemsPerPage: 5,
      items: [
        { id: 1, nombre: "Juan Pérez", email: "juan@example.com", rol: "Admin", activo: true },
        { id: 2, nombre: "Ana García", email: "ana@example.com", rol: "Editor", activo: false },
        { id: 3, nombre: "Carlos Ruiz", email: "carlos@example.com", rol: "Viewer", activo: true },
        { id: 4, nombre: "Laura López", email: "laura@example.com", rol: "Admin", activo: true },
        { id: 5, nombre: "Pedro Gómez", email: "pedro@example.com", rol: "Editor", activo: false },
        { id: 6, nombre: "Lucía Sánchez", email: "lucia@example.com", rol: "Viewer", activo: true },
        { id: 7, nombre: "Mario Díaz", email: "mario@example.com", rol: "Editor", activo: true },
        { id: 8, nombre: "Sofía Torres", email: "sofia@example.com", rol: "Viewer", activo: false }
      ]
    };
  },
  computed: {
    filteredItems() {
      if (!this.filter) return this.items;

      const f = this.filter.toLowerCase();
      return this.items.filter(
        u =>
          u.nombre.toLowerCase().includes(f) ||
          u.rol.toLowerCase().includes(f)
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
  watch: {
    filter() {
      this.currentPage = 1; // reiniciar a página 1 cuando filtras
    }
  }
};
</script>

<style scoped>
.table th,
.table td {
  vertical-align: middle;
}

.table thead th {
  background: #f0f4ff;
}
</style>