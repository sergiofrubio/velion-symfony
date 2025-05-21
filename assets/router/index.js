import { createRouter, createWebHistory } from 'vue-router';

import Login from '../views/auth/Login.vue';
import Register from '../views/auth/Register.vue';
import Dashboard from '../views/Dashboard.vue';
import Start from '../views/Start.vue';
import Patient from '../views/patient/index.vue';
import PatientForm from '../views/patient/PatientForm.vue';
import Therapist from '../views/therapist/index.vue';
import TherapistForm from '../views/therapist/TherapistForm.vue';
import Appointment from '../views/appointment/index.vue';
import Invoice from '../views/invoice/index.vue';
import InvoiceForm from '../views/invoice/InvoiceForm.vue';
import Product from '../views/product/index.vue';
import ProductForm from '../views/product/ProductForm.vue';
import Config from '../views/Config.vue';
import Error from '../views/404.vue';


const routes = [
  { path: '/', redirect: '/login' },
  { path: '/login', component: Login, name: Login, meta: { title: 'Login' } },
  { path: '/register', component: Register,  name: Register, meta: { title: 'Registro' } },
  { path: '/start', component: Dashboard, children: [{ path: '', component: Start }], meta: { requiresAuth: true } },
  { path: '/patients', component: Dashboard, children: [{ path: '', component: Patient }], meta: { requiresAuth: true } },
  { path: '/patients/new', component: Dashboard, children: [{ path: '', component: PatientForm }], meta: { requiresAuth: true } },
  { path: '/patients/:id/edit', component: Dashboard, children: [{ path: '', component: PatientForm }], meta: { requiresAuth: true }, props: true },

  { path: '/therapists', component: Dashboard, children: [{ path: '', component: Therapist }], meta: { requiresAuth: true } },
  { path: '/therapists/new', component: Dashboard, children: [{ path: '', component: TherapistForm }], meta: { requiresAuth: true } },
  { path: '/therapists/:id/edit', component: Dashboard, children: [{ path: '', component: TherapistForm }], meta: { requiresAuth: true }, props: true },


  { path: '/appointments', component: Dashboard, children: [{ path: '', component: Appointment }], meta: { requiresAuth: true } },

  { path: '/invoices', component: Dashboard, children: [{ path: '', component: Invoice }], meta: { requiresAuth: true } },
  { path: '/invoices/new', component: Dashboard, children: [{ path: '', component: InvoiceForm }], meta: { requiresAuth: true } },

  { path: '/products', component: Dashboard, children: [{ path: '', component: Product }], meta: { requiresAuth: true } },

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
