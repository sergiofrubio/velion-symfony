<template>
	<div>
		<div class="row align-appointments-center mb-3">
			<div class="col-12 col-md-auto mb-2 mb-md-0">
				<h3 class="fw-bold text-primary mb-0">Citas</h3>
			</div>
			<div class="col-12 col-md d-flex justify-content-md-end gap-2">
				<input type="text" v-model="filter" placeholder="Filtrar citas..." class="form-control"
					style="max-width: 220px" />
				<router-link to="/therapists/new" class="btn btn-primary flex-shrink-0">
					<i class="bi bi-plus-circle"></i> Nueva cita
				</router-link>
			</div>
		</div>

		<div class="table-responsive">
			<table class="table table-hover align-middle">
				<thead>
					<tr>
						<th>#</th>
						<th>Paciente</th>
						<th>Fecha</th>
						<th>Hora</th>
						<th>Estado</th>
						<th >Acciones</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(appointment, index) in paginatedAppointments" :key="appointment.id">
						<td>{{ appointment.id }}</td>
						<td>{{ appointment.patient }}</td>
						<td>{{ appointment.date }}</td>
						<td>{{ appointment.time }}</td>
						<td>
							<span class="badge" :class="appointment.status === 'Confirmada' ? 'bg-success' : 'bg-warning'">
								{{ appointment.status }}
							</span>
						</td>
						<td >
							<button class="btn btn-sm btn-outline-primary me-2 bi bi-pencil-square">
							</button>
							<button class="btn btn-sm btn-outline-danger bi bi-trash">
							</button>
						</td>
					</tr>
					<tr v-if="filteredAppointments.length === 0">
						<td colspan="6" class="text-center text-muted">Sin resultados</td>
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
	name: "Appointment",
	data() {
		return {
			filter: "",
			currentPage: 1,
			appointmentsPerPage: 5,
			appointments: [
				{ id: 1, patient: "Juan Pérez", date: "2025-05-10", time: "10:00", status: "Confirmada" },
				{ id: 2, patient: "Ana García", date: "2025-05-11", time: "11:30", status: "Pendiente" },
				{ id: 3, patient: "Carlos Ruiz", date: "2025-05-12", time: "09:15", status: "Confirmada" },
				{ id: 4, patient: "Laura López", date: "2025-05-13", time: "14:00", status: "Pendiente" },
				{ id: 5, patient: "Pedro Gómez", date: "2025-05-14", time: "13:30", status: "Confirmada" },
				{ id: 6, patient: "Sofía Torres", date: "2025-05-15", time: "16:00", status: "Confirmada" }
			]
		};
	},
	computed: {
		filteredAppointments() {
			const f = this.filter.toLowerCase();
			return this.appointments.filter(c =>
				c.patient.toLowerCase().includes(f) || c.date.includes(f)
			);
		},
		totalPages() {
			return Math.ceil(this.filteredAppointments.length / this.appointmentsPerPage);
		},
		paginatedAppointments() {
			const start = (this.currentPage - 1) * this.appointmentsPerPage;
			return this.filteredAppointments.slice(start, start + this.appointmentsPerPage);
		}
	},
	watch: {
		filter() {
			this.currentPage = 1;
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

.filter-input {
	width: 200px;
	/* Puedes ajustar este valor según prefieras */
	/* O usando flexbox para un control más fino: */
	/* flex-basis: 200px; */
	/* flex-grow: 0; */
	/* flex-shrink: 0; */
}

/* Opcional: hacer el input más ancho en pantallas grandes */
@media (min-width: 768px) {

	/* En pantallas medianas o más grandes */
	.filter-input {
		width: 250px;
		/* O un valor mayor */
	}
}
</style>