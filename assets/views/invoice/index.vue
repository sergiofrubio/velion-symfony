<template>
	<div>
		<div class="row align-invoices-center mb-3">
			<div class="col-12 col-md-auto mb-2 mb-md-0">
				<h3 class="fw-bold text-primary mb-0">Facturas</h3>
			</div>
			<div class="col-12 col-md d-flex justify-content-md-end gap-2">
				<input type="text" v-model="filter" placeholder="Filtrar facturas..." class="form-control"
					style="max-width: 220px" />
				<router-link to="/invoices/new" class="btn btn-primary flex-shrink-0">
					<i class="bi bi-plus-circle"></i> Nueva Factura
				</router-link>
			</div>
		</div>

		<div class="table-responsive">
			<table class="table table-hover align-middle">
				<thead>
					<tr>
						<th>#</th>
						<th>Cliente</th>
						<th>Fecha</th>
						<th>Total</th>
						<th>Estado</th>
						<th >Acciones</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(invoice, index) in paginatedInvoices" :key="invoice.id">
						<td>{{ invoice.id }}</td>
						<td>{{ invoice.patient }}</td>
						<td>{{ invoice.date }}</td>
						<td>{{ invoice.total }} €</td>
						<td>
							<span class="badge" :class="invoice.status === 'Pagada' ? 'bg-success' : 'bg-danger'">
								{{ invoice.status }}
							</span>
						</td>
						<td >
							<button class="btn btn-sm btn-outline-primary me-2 bi bi-download">
							</button>
							<button class="btn btn-sm btn-outline-danger bi bi-trash">
							</button>
						</td>
					</tr>
					<tr v-if="filteredInvoices.length === 0">
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
	name: "invoices",
	data() {
		return {
			filter: "",
			currentPage: 1,
			invoicesPerPage: 5,
			invoices: [
				{ id: 1, patient: "Empresa A", date: "2025-05-01", total: 120.50, status: "Pagada" },
				{ id: 2, patient: "Juan Pérez", date: "2025-05-02", total: 89.99, status: "Pendiente" },
				{ id: 3, patient: "Ana García", date: "2025-05-03", total: 150.00, status: "Pagada" },
				{ id: 4, patient: "Pedro Gómez", date: "2025-05-04", total: 200.00, status: "Pendiente" },
				{ id: 5, patient: "Lucía Sánchez", date: "2025-05-05", total: 99.00, status: "Pagada" },
				{ id: 6, patient: "Mario Díaz", date: "2025-05-06", total: 145.70, status: "Pagada" }
			]
		};
	},
	computed: {
		filteredInvoices() {
			const f = this.filter.toLowerCase();
			return this.invoices.filter(invoice =>
				invoice.patient.toLowerCase().includes(f) || invoice.status.toLowerCase().includes(f)
			);
		},
		totalPages() {
			return Math.ceil(this.filteredInvoices.length / this.invoicesPerPage);
		},
		paginatedInvoices() {
			const start = (this.currentPage - 1) * this.invoicesPerPage;
			return this.filteredInvoices.slice(start, start + this.invoicesPerPage);
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