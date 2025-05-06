<template>
    <div>
      <div class="d-flex justify-content-between align-items-center mb-3">
        <h3 class="fw-semibold">Gestión de Productos</h3>
        <input
          type="text"
          class="form-control w-25"
          v-model="filtro"
          placeholder="Buscar por nombre o rol"
        />
      </div>
  
      <div class="table-responsive">
        <table class="table table-hover align-middle">
          <thead class="table-light">
            <tr>
              <th>#</th>
              <th>Nombre</th>
              <th>Email</th>
              <th>Rol</th>
              <th>Estado</th>
              <th class="text-end">Acciones</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(usuario, index) in usuariosPaginados"
              :key="usuario.id"
            >
              <td>{{ usuario.id }}</td>
              <td>{{ usuario.nombre }}</td>
              <td>{{ usuario.email }}</td>
              <td>{{ usuario.rol }}</td>
              <td>
                <span
                  class="badge"
                  :class="usuario.activo ? 'bg-success' : 'bg-secondary'"
                >
                  {{ usuario.activo ? 'Activo' : 'Inactivo' }}
                </span>
              </td>
              <td class="text-end">
                <button class="btn btn-sm btn-outline-primary me-2 bi bi-pencil-square">
                </button>
                <button class="btn btn-sm btn-outline-danger bi bi-trash">
                </button>
              </td>
            </tr>
            <tr v-if="usuariosFiltrados.length === 0">
              <td colspan="6" class="text-center text-muted">Sin resultados</td>
            </tr>
          </tbody>
        </table>
      </div>
  
      <!-- Paginación -->
      <nav>
        <ul class="pagination justify-content-end">
          <li
            class="page-item"
            :class="{ disabled: paginaActual === 1 }"
            @click="paginaActual--"
          >
            <a class="page-link" href="#">Anterior</a>
          </li>
          <li
            class="page-item"
            v-for="n in totalPaginas"
            :key="n"
            :class="{ active: paginaActual === n }"
            @click="paginaActual = n"
          >
            <a class="page-link" href="#">{{ n }}</a>
          </li>
          <li
            class="page-item"
            :class="{ disabled: paginaActual === totalPaginas }"
            @click="paginaActual++"
          >
            <a class="page-link" href="#">Siguiente</a>
          </li>
        </ul>
      </nav>
    </div>
  </template>
  
  <script>
  export default {
    name: "Usuarios",
    data() {
      return {
        filtro: "",
        paginaActual: 1,
        usuariosPorPagina: 5,
        usuarios: [
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
      usuariosFiltrados() {
        if (!this.filtro) return this.usuarios;
  
        const f = this.filtro.toLowerCase();
        return this.usuarios.filter(
          u =>
            u.nombre.toLowerCase().includes(f) ||
            u.rol.toLowerCase().includes(f)
        );
      },
      totalPaginas() {
        return Math.ceil(this.usuariosFiltrados.length / this.usuariosPorPagina);
      },
      usuariosPaginados() {
        const start = (this.paginaActual - 1) * this.usuariosPorPagina;
        return this.usuariosFiltrados.slice(start, start + this.usuariosPorPagina);
      }
    },
    watch: {
      filtro() {
        this.paginaActual = 1; // reiniciar a página 1 cuando filtras
        console.log(localStorage.getItem('user'));
      }
    }
  };
  </script>
  
  <style scoped>
  .table th,
  .table td {
    vertical-align: middle;
  }
  </style>
  