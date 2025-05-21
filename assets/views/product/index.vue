<template>
  <div>
    <div class="row align-items-center mb-3">
      <div class="col-12 col-md-auto mb-2 mb-md-0">
        <h3 class="fw-bold text-primary mb-0">Products</h3>
      </div>
      <div class="col-12 col-md d-flex justify-content-md-end gap-2">
        <input type="text" v-model="filter" placeholder="Filtrar products..." class="form-control"
          style="max-width: 220px" />
        <router-link to="/products/new" class="btn btn-primary flex-shrink-0">
          <i class="bi bi-plus-circle"></i> Nuevo Product
        </router-link>
      </div>
    </div>

    <div class="table-responsive">
      <table class="table table-hover align-middle">
        <thead>
          <tr>
            <th>#</th>
            <th>Descripción</th>
            <th>Precio</th>
            <th >Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(product, index) in paginatedItems" :key="product.id">
            <td>{{ product.id }}</td>
            <td>{{ product.descripcion }}</td>
            <td>{{ product.precio }}</td>
            <td>
              <router-link :to="`/produts/${product.id}/edit`" class="btn btn-sm btn-outline-primary me-2">
                <i class="bi bi-pencil"></i>
              </router-link>
              <button class="btn btn-sm btn-outline-danger" @click="deleteProduct(product.id)">
                <i class="bi bi-trash"></i>
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
  name: "Product",
  data() {
    return {
      filter: "",
      currentPage: 1,
      itemsPerPage: 5,
      items: [
        { id: 1, descripcion: "Juan Pérez", precio: 5},
        { id: 2, descripcion: "Ana García", precio: 13},
      ]
    };
  },
  computed: {
    filteredItems() {
      if (!this.filter) return this.items;

      const f = this.filter.toLowerCase();
      return this.items.filter(
        u =>
          u.descripcion.toLowerCase().includes(f) ||
          u.precio.toString().toLowerCase().includes(f)
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
    deletePatient(id) {
      this.patients = this.patients.filter(p => p.id !== id);
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