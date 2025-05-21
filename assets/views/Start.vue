<template>
  <div class="container-fluid py-4">
    <!-- Banner de Acceso Rápido -->
    <div class="row mb-4">
      <div class="col-12">
        <div class="alert alert-info shadow-sm d-flex align-items-center gap-3" role="alert">
          <i class="bi bi-speedometer2 fs-3"></i>
          <div>
            <h4 class="mb-1 fw-semibold">Acceso Rápido</h4>
            <span>Agrega nuevas citas, consulta pacientes, accede a informes y más.</span>
          </div>
          <div class="ms-auto">
            <router-link to="/appointments/new" class="btn btn-primary btn-sm me-2">
              Nueva Cita
            </router-link>
            <router-link to="/patients" class="btn btn-secondary btn-sm me-2">
              Pacientes
            </router-link>
            <router-link to="/reports" class="btn btn-info btn-sm">
              Informes
            </router-link>
          </div>
        </div>
      </div>
    </div>

    <!-- Sección Principal -->
    <div class="row">
      <!-- Tabla de Próximas Citas (sección central) -->
      <div class="col-12 col-lg-8 mb-4">
        <div class="card shadow-sm rounded-4">
          <div class="card-header bg-white border-bottom-0 d-flex align-items-center justify-content-between">
            <h5 class="mb-0 text-primary fw-semibold">Próximas Citas</h5>
            <router-link to="/appointments" class="btn btn-outline-primary btn-sm">
              Ver todas
            </router-link>
          </div>
          <div class="card-body p-0">
            <table class="table table-hover m-0 align-middle">
              <thead>
                <tr>
                  <th>Paciente</th>
                  <th>Terapeuta</th>
                  <th>Fecha</th>
                  <th>Hora</th>
                  <th>Estado</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="appt in upcomingAppointments" :key="appt.id">
                  <td>{{ appt.patient }}</td>
                  <td>{{ appt.therapist }}</td>
                  <td>{{ appt.date }}</td>
                  <td>{{ appt.time }}</td>
                  <td>
                    <span class="badge"
                          :class="{
                            'bg-success': appt.status === 'Confirmada',
                            'bg-warning text-dark': appt.status === 'Pendiente',
                            'bg-danger': appt.status === 'Cancelada'
                          }"
                    >{{ appt.status }}</span>
                  </td>
                </tr>
                <tr v-if="upcomingAppointments.length === 0">
                  <td colspan="5" class="text-center text-muted py-3">
                    No hay próximas citas.
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Estadísticas Adicionales en cuadrícula -->
      <div class="col-12 col-lg-4">
        <div class="stats-grid">
          <div class="card shadow-sm rounded-4">
            <div class="card-body text-center">
              <i class="bi bi-calendar-check fs-2 text-success mb-2"></i>
              <h6>Citas Pendientes</h6>
              <p class="display-6">{{ stats.pendingAppointments }}</p>
            </div>
          </div>
          <div class="card shadow-sm rounded-4">
            <div class="card-body text-center">
              <i class="bi bi-x-circle fs-2 text-danger mb-2"></i>
              <h6>Citas Canceladas</h6>
              <p class="display-6">{{ stats.canceledAppointments }}</p>
            </div>
          </div>
          <div class="card shadow-sm rounded-4">
            <div class="card-body text-center">
              <i class="bi bi-people fs-2 text-primary mb-2"></i>
              <h6>Pacientes Nuevos</h6>
              <p class="display-6">{{ stats.newPatients }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Start",
  data() {
    return {
      // Datos de próximas citas (en producción se obtendrían de la API)
      upcomingAppointments: [
        {
          id: 1,
          patient: "Ana García",
          therapist: "Elena López",
          date: "2025-05-21",
          time: "10:00",
          status: "Confirmada"
        },
        {
          id: 2,
          patient: "Luis Pérez",
          therapist: "Carlos Ruiz",
          date: "2025-05-21",
          time: "13:30",
          status: "Pendiente"
        }
      ],
      // Estadísticas de ejemplo ampliadas
      stats: {
        totalAppointments: 25,
        confirmedAppointments: 15,
        registeredPatients: 8,
        pendingAppointments: 5,
        canceledAppointments: 3,
        newPatients: 2
      }
    };
  }
};
</script>

<style scoped>
.card {
  margin-bottom: 1rem; /* reduce el espacio inferior */
}
.table thead th {
  background: #f0f4ff;
}
/* Contenedor de estadísticas en cuadrícula */
.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); /* Ajusta automáticamente las columnas */
  gap: 1rem; /* Espaciado entre tarjetas */
}
/* Ajusta el padding interno de las tarjetas de estadísticas */
.stats-grid .card-body {
  padding: 0.5rem 0.75rem;
}
/* Reducir el tamaño de fuente para que los números no sean tan grandes */
.display-6 {
  font-size: 1.5rem;
}
</style>