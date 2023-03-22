import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(VueRouter)
Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    articles: [
      {
        id: 1,
        title: 'Article 1',
        body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        author: 'John Doe',
        publish: true
      },
      {
        id: 2,
        title: 'Article 2',
        body: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        author: 'Jane Doe',
        publish: false
      }
    ]
    }
})