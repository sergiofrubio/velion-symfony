<template>
	<div>
	  <div class="d-flex justify-content-between align-items-center mb-3">
		<h3 class="fw-semibold">Gestión de Facturas</h3>
		<input
		  type="text"
		  class="form-control w-25"
		  v-model="filtro"
		  placeholder="Buscar por cliente o estado"
		/>
	  </div>
  
	  <div class="table-responsive">
		<table class="table table-hover align-middle">
		  <thead class="table-light">
			<tr>
			  <th>#</th>
			  <th>Cliente</th>
			  <th>Fecha</th>
			  <th>Total</th>
			  <th>Estado</th>
			  <th class="text-end">Acciones</th>
			</tr>
		  </thead>
		  <tbody>
			<tr v-for="(factura, index) in facturasPaginadas" :key="factura.id">
			  <td>{{ factura.id }}</td>
			  <td>{{ factura.cliente }}</td>
			  <td>{{ factura.fecha }}</td>
			  <td>{{ factura.total }} €</td>
			  <td>
				<span class="badge" :class="factura.estado === 'Pagada' ? 'bg-success' : 'bg-danger'">
				  {{ factura.estado }}
				</span>
			  </td>
			  <td class="text-end">
				<button class="btn btn-sm btn-outline-primary me-2">Ver</button>
				<button class="btn btn-sm btn-outline-danger">Eliminar</button>
			  </td>
			</tr>
			<tr v-if="facturasFiltradas.length === 0">
			  <td colspan="6" class="text-center text-muted">Sin resultados</td>
			</tr>
		  </tbody>
		</table>
	  </div>
  
	  <nav>
		<ul class="pagination justify-content-end">
		  <li class="page-item" :class="{ disabled: paginaActual === 1 }" @click="paginaActual--">
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
	name: "Facturas",
	data() {
	  return {
		filtro: "",
		paginaActual: 1,
		facturasPorPagina: 5,
		facturas: [
		  { id: 1, cliente: "Empresa A", fecha: "2025-05-01", total: 120.50, estado: "Pagada" },
		  { id: 2, cliente: "Juan Pérez", fecha: "2025-05-02", total: 89.99, estado: "Pendiente" },
		  { id: 3, cliente: "Ana García", fecha: "2025-05-03", total: 150.00, estado: "Pagada" },
		  { id: 4, cliente: "Pedro Gómez", fecha: "2025-05-04", total: 200.00, estado: "Pendiente" },
		  { id: 5, cliente: "Lucía Sánchez", fecha: "2025-05-05", total: 99.00, estado: "Pagada" },
		  { id: 6, cliente: "Mario Díaz", fecha: "2025-05-06", total: 145.70, estado: "Pagada" }
		]
	  };
	},
	computed: {
	  facturasFiltradas() {
		const f = this.filtro.toLowerCase();
		return this.facturas.filter(factura =>
		  factura.cliente.toLowerCase().includes(f) || factura.estado.toLowerCase().includes(f)
		);
	  },
	  totalPaginas() {
		return Math.ceil(this.facturasFiltradas.length / this.facturasPorPagina);
	  },
	  facturasPaginadas() {
		const start = (this.paginaActual - 1) * this.facturasPorPagina;
		return this.facturasFiltradas.slice(start, start + this.facturasPorPagina);
	  }
	},
	watch: {
	  filtro() {
		this.paginaActual = 1;
	  }
	}
  };
  </script>
  