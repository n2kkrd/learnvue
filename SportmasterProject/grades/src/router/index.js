import Vue from 'vue'
import VueRouter from 'vue-router'
import Grades from '@/views/Grades.vue'
import SecondView from '@/views/SecondView.vue'

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'Grades',
        component: Grades
    },
    {
        path: '/second',
        name: 'SecondView',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: SecondView
    }
]

const router = new VueRouter({
    routes
})

export default router

