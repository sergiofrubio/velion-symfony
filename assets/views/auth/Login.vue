<template>
	<div class="container-fluid min-vh-100 d-flex align-items-center justify-content-center bg-light">
		<div class="card shadow-sm p-4 p-md-5 rounded-4" style="max-width: 400px; width: 100%;">
			<h2 class="mb-4 text-center text-primary fw-semibold">Iniciar sesión</h2>

			<form @submit.prevent="handleLogin">
				<div class="mb-3">
					<label for="email" class="form-label fw-medium">Correo electrónico</label>
					<input type="email" class="form-control" id="email" v-model="email" placeholder="ejemplo@correo.com"
						required />
				</div>

				<div class="mb-4">
					<label for="password" class="form-label fw-medium">Contraseña</label>
					<input type="password" class="form-control" id="password" v-model="password" placeholder="********"
						required />
				</div>

				<button type="submit" class="btn btn-primary w-100 fw-medium">Entrar</button>
			</form>

			<div class="mt-3 text-center">
				<small>
					<a href="#" data-bs-toggle="modal" data-bs-target="#modalRecuperar">¿Olvidaste tu contraseña?</a>
				</small>
			</div>

			<div class="mt-3 text-center">
				<small>¿No tienes cuenta? <router-link to="/register">Regístrate</router-link></small>
			</div>
		</div>

		<!-- Modal Recuperar Contraseña -->
		<div class="modal fade" id="modalRecuperar" tabindex="-1" aria-labelledby="recuperarLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content rounded-4 shadow-sm">
					<div class="modal-header">
						<h5 class="modal-title text-primary fw-semibold" id="recuperarLabel">Recuperar contraseña</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
					</div>
					<div class="modal-body">
						<p class="mb-3">Introduce tu correo electrónico y te enviaremos instrucciones para recuperar tu
							contraseña.</p>
						<input type="email" class="form-control" v-model="emailRecuperar"
							placeholder="ejemplo@correo.com" required />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
						<button type="button" class="btn btn-primary" @click="enviarRecuperacion">Enviar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
export default {
	name: "Login",
	data() {
		return {
			email: "",
			password: "",
			emailRecuperar: ""
		};
	},
	methods: {
		handleLogin() {
			fetch('/api/login', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({
					email: this.email,
					password: this.password
				})
			})
				.then(async response => {
					const data = await response.json();

					if (!response.ok) {
						throw new Error(data.message || 'Error al iniciar sesión');
					}

					// Guardar token en localStorage o sessionStorage
					localStorage.setItem('token', data.token);
					localStorage.setItem('userName', data.userName);
					localStorage.setItem('userId', data.userId);

					// Redirigir al dashboard
					this.$router.push('/start');
				})
				.catch(err => {
					alert(err.message);
				});
		},

		/* Para hacer futuras peticiones a la api, se deberá incluir el token en el header Autorization:
		const token = localStorage.getItem('token');

			fetch('/api/usuarios', {
			headers: {
				'Authorization': `Bearer ${token}`
			}
			}) */

		enviarRecuperacion() {
			if (!this.emailRecuperar) {
				alert("Introduce un correo válido.");
				return;
			}

			// Aquí iría la lógica para enviar correo de recuperación
			console.log("Recuperar contraseña para:", this.emailRecuperar);
			alert("Si el correo existe, recibirás instrucciones.");

			// Cerrar modal manualmente
			const modal = bootstrap.Modal.getInstance(document.getElementById('modalRecuperar'));
			modal.hide();
			document.body.classList.remove('modal-open');
			document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());

			this.emailRecuperar = "";
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