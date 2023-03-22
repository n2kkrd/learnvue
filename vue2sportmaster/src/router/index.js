import Vue from 'vue'
import VueRouter from 'vue-router'


Vue.use(VueRouter)

 const routes = [
    {
      path: '/',
      name: 'articlelist',
      component: () => import('../components/ArticleList.vue')
    },
    {
      path: '/about',
      name: 'About',
      component: () => import('../components/AboutUs.vue')
    },
    {
      path: '/articleform',
      name: 'AddArticle',
      component: () => import('../components/ArticleForm.vue')
    },
  ]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router