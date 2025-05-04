<template>
	<div class="container-fluid min-vh-100 d-flex align-items-center justify-content-center bg-light">
	  <div class="card shadow-sm p-4 p-md-5 rounded-4" style="max-width: 400px; width: 100%;">
		<h2 class="mb-4 text-center text-primary fw-semibold">Iniciar sesión</h2>
  
		<form @submit.prevent="handleLogin">
		  <div class="mb-3">
			<label for="email" class="form-label fw-medium">Correo electrónico</label>
			<input
			  type="email"
			  class="form-control"
			  id="email"
			  v-model="email"
			  placeholder="ejemplo@correo.com"
			  required
			/>
		  </div>
  
		  <div class="mb-4">
			<label for="password" class="form-label fw-medium">Contraseña</label>
			<input
			  type="password"
			  class="form-control"
			  id="password"
			  v-model="password"
			  placeholder="********"
			  required
			/>
		  </div>
  
		  <button type="submit" class="btn btn-primary w-100 fw-medium">Entrar</button>
		</form>
  
		<div class="mt-3 text-center">
		  <small>¿No tienes cuenta? <router-link to="/register">Regístrate</router-link></small>
		</div>
	  </div>
	</div>
  </template>
  
  <script>
  export default {
	name: "Facturas",
	data() {
	  return {
		email: "",
		password: ""
	  };
	},
	methods: {
	  handleLogin() {
		/* // Aquí iría la lógica de login (API, token, redirección...)
		console.log("Login con:", this.email, this.password);
  
		// Simulación de login exitoso
		this.$router.push("/"); */
	  }
	}
  };
  </script>
  
  <style scoped>
  input:focus {
	border-color: #0d6efd;
	box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.25);
  }
  </style>
  