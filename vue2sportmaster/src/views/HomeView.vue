<template>
  <div>
    <h1>Articles</h1>
    <ul>
      <li v-for="(article, index) in articles" :key="index">
        <router-link :to="{ name: 'Article', params: { id: article.id } }">{{ article.title }}</router-link>
      </li>
    </ul>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: {
    ...mapState(['articles'])
  }
}
</script>