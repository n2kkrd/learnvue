import Vue from 'vue'
import Router from 'vue-router'
import HomeView from '@/views/HomeView'
import AboutView from '@/views/AboutView'
import ArticleList from '@/components/ArticleListView'



Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Home',
      component: HomeView
    },
    {
      path: '/about',
      name: 'About',
      component: AboutView
    },
    {
      path: '/articles',
      name: 'ArticleList',
      component: ArticleList
    },
  ]
})
