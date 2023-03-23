<template>
  <div>
    <h2>{{ title }}</h2>
    <router-link v-for="article in articles" :key="article.id" :to="'/article/' + article.id" tag="div">
      <article-block
        :title="article.title"
        :content="article.content"
        :author="article.author"
        :date="article.date"
        :published.sync="article.published"
        v-bind:class="{ 'unpublished': !article.published }"
      ></article-block>
    </router-link>
    <ArticleForm @add-article="addArticle" />
  </div>
</template>

<script>
import ArticleForm from './ArticleForm.vue'
import ArticleBlock from './ArticleBlock.vue'
import { mapActions, mapGetters, mapState } from 'vuex'

export default {
  name: 'ArticleList',
  components: {
    ArticleBlock,
    ArticleForm
  },
  computed: {
    ...mapState(['articles']),
    ...mapGetters(['getArticleById']),
    articleCount() {
      return this.articles.length;
    },
  },
  methods: {
    ...mapActions(['loadArticles', 'addArticle', 'togglePublished'])
  },
  beforeCreate() {
    this.$store.dispatch('fetchArticles');
  }
}
</script>

<style>
.unpublished {
  color: red;
}
</style>
