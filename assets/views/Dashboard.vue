<template>
  <div class="d-flex" id="dashboard-layout">
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
        <h2 class="fw-semibold text-dark">{{ currentTitle }}</h2>
        <button class="btn btn-outline-primary">Cerrar sesión</button>
      </div>

      <!-- Page content slot -->
      <div class="card p-4 shadow-sm rounded bg-white">
        <router-view />
      </div>
    </main>
  </div>
</template>

  
  <script>
  export default {
    name: "DashboardLayout",
    data() {
      return {
        menu: [
        { text: "Inicio", route: "/dashboard/inicio", icon: "bi bi-house-door-fill" },
        { text: "Usuarios", route: "/dashboard/usuarios", icon: "bi bi-people-fill" },
        { text: "Citas", route: "/dashboard/citas", icon: "bi bi-calendar-check-fill" },
        { text: "Facturas", route: "/dashboard/facturas", icon: "bi bi-receipt-cutoff" }
        ]
      };
    },
    computed: {
    currentTitle() {
      return this.$route.meta.title || '';
    }
  }
  };
  </script>
  
  <style scoped>
  #dashboard-layout {
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
  