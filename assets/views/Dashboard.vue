<template>
  <div class="d-flex" id="layout">
    <!-- Sidebar -->
    <aside class="sidebar bg-white border-end shadow-sm">
      <div class="p-4">
        <h5 class="fw-bold text-primary mb-4">Mi Panel</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2" v-for="item in menu" :key="item.text">
            <router-link :to="item.route" class="nav-link text-dark d-flex align-items-center gap-2"
              active-class="active">
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

        <div class="d-flex align-items-center gap-3">
          <!-- Botón de notificaciones -->
          <div class="dropdown">
            <button class="btn btn-light position-relative" type="button" id="notificationDropdown"
              data-bs-toggle="dropdown" aria-expanded="false" @click="markNotificationsAsRead">
              <i class="bi bi-bell fs-5"></i>
              <span v-if="notifications.length"
                class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                {{ notifications.length }}
                <span class="visually-hidden">nuevas notificaciones</span>
              </span>
            </button>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="notificationDropdown">
              <li v-if="notifications.length === 0" class="dropdown-item text-muted">Sin notificaciones</li>
              <li v-for="(n, i) in notifications" :key="i">
                <span class="dropdown-item d-flex justify-content-between align-items-center">
                  <span :class="{ 'text-muted': n.read }">{{ n.text }}</span>
                  <i v-if="!n.read" class="bi bi-dot text-primary"></i>
                </span>
              </li>
              <li>
                <hr class="dropdown-divider" />
              </li>
              <li>
                <button class="dropdown-item text-danger" @click="clearNotifications">
                  <i class="bi bi-trash"></i> Vaciar notificaciones
                </button>
              </li>

            </ul>
          </div>

          <!-- Botón de logout -->
          <button @click="logout" class="btn btn-outline-danger bi bi-box-arrow-right"></button>
        </div>
      </div>

      <!-- Page content slot -->
      <div class="card p-4 shadow-sm rounded bg-white" style="height: 85vh;">
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
        { text: "Inicio", route: "/start", icon: "bi bi-house-door-fill" },
        { text: "Usuarios", route: "/users", icon: "bi bi-people-fill" },
        { text: "Citas", route: "/appointments", icon: "bi bi-calendar-check-fill" },
        { text: "Productos", route: "/products", icon: "bi bi-bag" },
        { text: "Facturas", route: "/invoices", icon: "bi bi-receipt-cutoff" },
        { text: "Configuración", route: "/settings", icon: "bi bi-gear" }
      ],
      notifications: [
        { text: "Tienes una cita nueva", read: false },
        { text: "Factura enviada", read: false },
        { text: "Actualización del sistema", read: false }
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
    },
    markNotificationsAsRead() {
      this.notifications = this.notifications.map(n => ({ ...n, read: true }));
    },
    clearNotifications() {
      this.notifications = [];
    }
  },
  computed: {
    currentUserName() {
      return 'Bienvenid@, ' + localStorage.getItem('userName');
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
  width: 14%;
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
  background-color: #e7f1ff;
  /* azul claro */
  color: #0d6efd;
  /* azul bootstrap */
  text-decoration: none;
}

.dropdown-menu {
  min-width: 250px;
  max-height: 300px;
  overflow-y: auto;
}

.dropdown-item {
  font-size: 0.95rem;
}

.dropdown-item .bi-dot {
  font-size: 1.2rem;
}
</style>