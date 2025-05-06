import { createRouter, createWebHistory } from 'vue-router';

import Login from '../views/Login.vue';
import Register from '../views/Register.vue';
import Dashboard from '../views/Dashboard.vue';
import Inicio from '../views/Inicio.vue';
import Usuarios from '../views/usuarios/Usuarios.vue';
import UserForm from '../views/usuarios/UserForm.vue';
import Citas from '../views/citas/Citas.vue';
import Facturas from '../views/Facturas.vue';
import Config from '../views/Config.vue';
import Error from '../views/Error.vue';


const routes = [
  { path: '/', redirect: '/login' },
  { path: '/login', component: Login, name: Login, meta: { title: 'Login' } },
  { path: '/register', component: Register,  name: Register, meta: { title: 'Registro' } },
  { path: '/inicio', component: Dashboard, children: [{ path: '', component: Inicio }], meta: { requiresAuth: true } },
  { path: '/usuarios', component: Dashboard, children: [{ path: '', component: Usuarios }], meta: { requiresAuth: true } },
  { path: '/usuarios/nuevo', component: Dashboard, children: [{ path: '', component: UserForm }], meta: { requiresAuth: true } },
  { path: '/usuarios/:id/editar', component: Dashboard, children: [{ path: '', component: UserForm }], meta: { requiresAuth: true }, props: true },
  { path: '/citas', component: Dashboard, children: [{ path: '', component: Citas }], meta: { requiresAuth: true } },
  { path: '/facturas', component: Dashboard, children: [{ path: '', component: Facturas }], meta: { requiresAuth: true } },
  { path: '/configuracion', component: Dashboard, children: [{ path: '', component: Config }], meta: { requiresAuth: true } },
  { path: '/:pathMatch(.*)*', name: 'NotFound', component: Error },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

// 👇 Este es el guard que protege las rutas
router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('token');

  if (to.matched.some(record => record.meta.requiresAuth)) {
    if (!token) {
      // Redirige a login si no está autenticado
      return next('/login');
    }
  }

  next();
});

router.afterEach((to) => {
  document.title = to.meta.title || 'Mi Panel';
});

export default router;
