import { createRouter, createWebHistory } from 'vue-router';

import Login from '../views/auth/Login.vue';
import Register from '../views/auth/Register.vue';
import Dashboard from '../views/Dashboard.vue';
import Start from '../views/Start.vue';
import Users from '../views/user/User.vue';
import UserForm from '../views/user/UserForm.vue';
import Appointment from '../views/appointment/Appointment.vue';
import Invoice from '../views/invoice/Invoice.vue';
import InvoiceForm from '../views/invoice/InvoiceForm.vue';
import Config from '../views/Config.vue';
import Error from '../views/404.vue';


const routes = [
  { path: '/', redirect: '/login' },
  { path: '/login', component: Login, name: Login, meta: { title: 'Login' } },
  // { path: '/register', component: Register,  name: Register, meta: { title: 'Registro' } },
  { path: '/start', component: Dashboard, children: [{ path: '', component: Start }], meta: { requiresAuth: true } },
  { path: '/users', component: Dashboard, children: [{ path: '', component: Users }], meta: { requiresAuth: true } },
  { path: '/users/new', component: Dashboard, children: [{ path: '', component: UserForm }], meta: { requiresAuth: true } },
  { path: '/users/:id/edit', component: Dashboard, children: [{ path: '', component: UserForm }], meta: { requiresAuth: true }, props: true },
  { path: '/appointments', component: Dashboard, children: [{ path: '', component: Appointment }], meta: { requiresAuth: true } },
  { path: '/invoices', component: Dashboard, children: [{ path: '', component: Invoice }], meta: { requiresAuth: true } },
  { path: '/invoices/new', component: Dashboard, children: [{ path: '', component: InvoiceForm }], meta: { requiresAuth: true } },
  { path: '/settings', component: Dashboard, children: [{ path: '', component: Config }], meta: { requiresAuth: true } },
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
