<template>
  <div class="d-flex" id="layout">
    <!-- Sidebar -->
    <aside class="sidebar bg-white border-end shadow-sm">
      <div class="p-4">
        <h5 class="fw-bold text-primary mb-4">Mi Panel</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2" v-for="item in menu" :key="item.text">
            <router-link
              :to="item.route"
              class="nav-link text-dark d-flex align-items-center gap-2"
              active-class="active"
            >
              <i :class="item.icon"></i>
              <span>{{ item.text }}</span>
            </router-link>
          </li>
        </ul>
      </div>
    </aside>

    <!-- Main content -->
    <main class="flex-grow-1 p-4 bg-light min-vh-100">
      <!-- Header -->
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-semibold text-dark">{{ currentUserName }}</h2>
        <button  @click="logout" class="btn btn-outline-primary">Cerrar sesión</button>
      </div>

      <!-- Page content slot -->
      <div class="card p-4 shadow-sm rounded bg-white" style="height: 90vh;">
        <router-view />
      </div>
    </main>
  </div>
</template>

  
  <script>
  export default {
    name: "Dashboard",
    data() {
      return {
        menu: [
        { text: "Inicio", route: "/inicio", icon: "bi bi-house-door-fill" },
        { text: "Usuarios", route: "/usuarios", icon: "bi bi-people-fill" },
        { text: "Citas", route: "/citas", icon: "bi bi-calendar-check-fill" },
        { text: "Facturas", route: "/facturas", icon: "bi bi-receipt-cutoff" },
        { text: "Configuración", route: "/configuracion", icon: "bi bi-gear" }
        ]
      };
    },
    methods: {
      logout() {
        // Borrar el token y el usuario del almacenamiento
        localStorage.removeItem('token');
        localStorage.removeItem('user');

        // Redirigir al login
        this.$router.push('/login');
      }
    },
    computed: {
    currentUserName() {
      return 'Bienvenid@, '+localStorage.getItem('userName');
    }
  }
  };
  </script>
  
  <style scoped>
  #layout {
    height: 100vh;
    overflow: hidden;
  }
  
  .sidebar {
    width: 240px;
    position: sticky;
    top: 0;
    height: 100vh;
  }
  
  .nav-link.active {
    background-color: #f0f4ff;
    border-radius: 8px;
    font-weight: 500;
  }

  .nav-link {
  transition: background-color 0.2s ease, color 0.2s ease;
  border-radius: 8px;
  padding: 0.5rem 0.75rem;
}

.nav-link:hover {
  background-color: #e7f1ff; /* azul claro */
  color: #0d6efd; /* azul bootstrap */
  text-decoration: none;
}

</style>
  