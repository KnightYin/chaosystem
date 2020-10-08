import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/view/Login.vue'
import Register from '@/view/Register.vue'
import Chating from '@/view/Chating.vue'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path:'/login',
      component:Login,
    },
    {
      path:'/register',
      component:Register
    },
    {
      path:'/chating',
      component:Chating
    },
  ]
})
