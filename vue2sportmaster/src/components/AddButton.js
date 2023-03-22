import { VBtn } from '../../node_modules/vuetify/lib'

export default {
  extends: VBtn,

  methods: {
    genContent() {
      return this.$createElement('div', {
        staticClass: 'v-btn__contents'
      }, [
        'Добавить ',
        this.$slots.default
      ])
    }
  }
}