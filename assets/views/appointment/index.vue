<template>
	<div>
		<div class="row align-items-center mb-3">
			<div class="col-12 col-md-auto mb-2 mb-md-0">
				<h3 class="fw-bold text-primary mb-0">Citas</h3>
			</div>
			<div class="col-12 col-md d-flex justify-content-md-end gap-2">
				<input type="text" v-model="filter" placeholder="Filtrar Citas..." class="form-control"
					style="max-width: 220px" />
				<router-link to="/therapists/new" class="btn btn-primary flex-shrink-0">
					<i class="bi bi-plus-circle"></i> Nueva Cita
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
					<tr v-for="(cita, index) in paginatedItems" :key="cita.id">
						<td>{{ cita.id }}</td>
						<td>{{ cita.paciente }}</td>
						<td>{{ cita.fecha }}</td>
						<td>{{ cita.hora }}</td>
						<td>
							<span class="badge" :class="cita.estado === 'Confirmada' ? 'bg-success' : 'bg-warning'">
								{{ cita.estado }}
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
			itemsPerPage: 5,
			items: [
				{ id: 1, paciente: "Juan Pérez", fecha: "2025-05-10", hora: "10:00", estado: "Confirmada" },
				{ id: 2, paciente: "Ana García", fecha: "2025-05-11", hora: "11:30", estado: "Pendiente" },
				{ id: 3, paciente: "Carlos Ruiz", fecha: "2025-05-12", hora: "09:15", estado: "Confirmada" },
				{ id: 4, paciente: "Laura López", fecha: "2025-05-13", hora: "14:00", estado: "Pendiente" },
				{ id: 5, paciente: "Pedro Gómez", fecha: "2025-05-14", hora: "13:30", estado: "Confirmada" },
				{ id: 6, paciente: "Sofía Torres", fecha: "2025-05-15", hora: "16:00", estado: "Confirmada" }
			]
		};
	},
	computed: {
		filteredItems() {
			const f = this.filter.toLowerCase();
			return this.items.filter(c =>
				c.paciente.toLowerCase().includes(f) || c.fecha.includes(f)
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