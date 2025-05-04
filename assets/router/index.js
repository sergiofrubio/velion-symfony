import { createRouter, createWebHistory } from 'vue-router';

import Login from '../views/Login.vue';
import Register from '../views/Register.vue';
import Dashboard from '../views/Dashboard.vue';
import Inicio from '../views/Inicio.vue';
import Usuarios from '../views/Usuarios.vue';
import Citas from '../views/Citas.vue';
import Facturas from '../views/Facturas.vue';
import Error from '../views/Error.vue';


const routes = [
  { path: '/', redirect: '/login' },
  { path: '/login', component: Login, name: Login, meta: { title: 'Login' } },
  { path: '/register', component: Register,  name: Register, meta: { title: 'Registro' } },
  { path: '/inicio', component: Dashboard },
  {
    path: '/dashboard',
    component: Dashboard,
    children: [
      {
        path: 'inicio',
        component: Inicio,
        name: 'Inicio',
        meta: { title: 'Inicio' }
      },
      {
        path: 'usuarios',
        component: Usuarios,
        name: 'Usuarios',
        meta: { title: 'Usuarios' }
      },
      {
        path: 'citas',
        component: Citas,
        name: 'Citas',
        meta: { title: 'Citas' }
      },
      {
        path: 'facturas',
        component: Facturas,
        name: 'Facturas',
        meta: { title: 'Facturas' }
      }
    ]
  },
  { path: '/:pathMatch(.*)*', name: 'NotFound', component: Error },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.afterEach((to) => {
  document.title = to.meta.title || 'Mi Panel';
});

export default router;
