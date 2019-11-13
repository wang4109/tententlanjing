
import vue from 'vue';
import Router from 'vue-router';

const Home = () => import('../views/home');
const TempletWrite = () => import('../views/templet/write');
const TempletList = () => import('../views/templet/templetList');
vue.use(Router);

const routes = [
      {
        path: '/',
        name:'home',
        component: Home,
      },
      {
        path: '/templet/write',
        name:'templetWrite',
        component: TempletWrite,
      },
      {
        path: '/templet/manage',
        name: 'templetList',
        component: TempletList,
      },
];

const router = new Router({
  mode: '',
  routes,
});

export default router;
