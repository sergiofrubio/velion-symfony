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
import Config from '../views/settings/index.vue';
import Error from '../views/404.vue';


const routes = [
  { path: '/', redirect: '/login' },
  { path: '/login', component: Login, name: Login, meta: { title: 'Login' } },
  { path: '/register', component: Register,  name: Register, meta: { title: 'Registro' } },
  { path: '/start', component: Dashboard, children: [{ path: '', component: Start }], meta: { requiresAuth: false } },
  { path: '/patients', component: Dashboard, children: [{ path: '', component: Patient }], meta: { requiresAuth: false } },
  { path: '/patients/new', component: Dashboard, children: [{ path: '', component: PatientForm }], meta: { requiresAuth: false } },
  { path: '/patients/:id/edit', component: Dashboard, children: [{ path: '', component: PatientForm }], meta: { requiresAuth: false }, props: false },

  { path: '/therapists', component: Dashboard, children: [{ path: '', component: Therapist }], meta: { requiresAuth: false } },
  { path: '/therapists/new', component: Dashboard, children: [{ path: '', component: TherapistForm }], meta: { requiresAuth: false } },
  { path: '/therapists/:id/edit', component: Dashboard, children: [{ path: '', component: TherapistForm }], meta: { requiresAuth: false }, props: false },


  { path: '/appointments', component: Dashboard, children: [{ path: '', component: Appointment }], meta: { requiresAuth: false } },

  { path: '/invoices', component: Dashboard, children: [{ path: '', component: Invoice }], meta: { requiresAuth: false } },
  { path: '/invoices/new', component: Dashboard, children: [{ path: '', component: InvoiceForm }], meta: { requiresAuth: false } },

  { path: '/products', component: Dashboard, children: [{ path: '', component: Product }], meta: { requiresAuth: false } },
  { path: '/products/new', component: Dashboard, children: [{ path: '', component: ProductForm }], meta: { requiresAuth: false } },
  { path: '/products/:id/edit', component: Dashboard, children: [{ path: '', component: ProductForm }], meta: { requiresAuth: false } },

  { path: '/settings', component: Dashboard, children: [{ path: '', component: Config }], meta: { requiresAuth: false } },
  { path: '/:pathMatch(.*)*', name: 'NotFound', component: Error },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

// 👇 Este es el guard que protege las rutas
/* router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('token');

  if (to.matched.some(record => record.meta.requiresAuth)) {
    if (!token) {
      // Redirige a login si no está autenticado
      return next('/login');
    }
  }

  next();
}); */

router.afterEach((to) => {
  document.title = to.meta.title || 'Mi Panel';
});

export default router;
