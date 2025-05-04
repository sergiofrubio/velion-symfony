<template>
	<div>
	  <div class="d-flex justify-content-between align-items-center mb-3">
		<h3 class="fw-semibold">Gestión de Citas</h3>
		<input
		  type="text"
		  class="form-control w-25"
		  v-model="filtro"
		  placeholder="Buscar por paciente o fecha"
		/>
	  </div>
  
	  <div class="table-responsive">
		<table class="table table-hover align-middle">
		  <thead class="table-light">
			<tr>
			  <th>#</th>
			  <th>Paciente</th>
			  <th>Fecha</th>
			  <th>Hora</th>
			  <th>Estado</th>
			  <th class="text-end">Acciones</th>
			</tr>
		  </thead>
		  <tbody>
			<tr v-for="(cita, index) in citasPaginadas" :key="cita.id">
			  <td>{{ cita.id }}</td>
			  <td>{{ cita.paciente }}</td>
			  <td>{{ cita.fecha }}</td>
			  <td>{{ cita.hora }}</td>
			  <td>
				<span class="badge" :class="cita.estado === 'Confirmada' ? 'bg-success' : 'bg-warning'">
				  {{ cita.estado }}
				</span>
			  </td>
			  <td class="text-end">
				<button class="btn btn-sm btn-outline-primary me-2">Editar</button>
				<button class="btn btn-sm btn-outline-danger">Eliminar</button>
			  </td>
			</tr>
			<tr v-if="citasFiltradas.length === 0">
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
	name: "Citas",
	data() {
	  return {
		filtro: "",
		paginaActual: 1,
		citasPorPagina: 5,
		citas: [
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
	  citasFiltradas() {
		const f = this.filtro.toLowerCase();
		return this.citas.filter(c =>
		  c.paciente.toLowerCase().includes(f) || c.fecha.includes(f)
		);
	  },
	  totalPaginas() {
		return Math.ceil(this.citasFiltradas.length / this.citasPorPagina);
	  },
	  citasPaginadas() {
		const start = (this.paginaActual - 1) * this.citasPorPagina;
		return this.citasFiltradas.slice(start, start + this.citasPorPagina);
	  }
	},
	watch: {
	  filtro() {
		this.paginaActual = 1;
	  }
	}
  };
  </script>
  