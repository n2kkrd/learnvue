<template>
  <div>
    <h2>{{ title }}</h2>
    <div v-if="loading" class="loading">
      Загрузка...
      <button @click="cancelFetch">Отмена</button>
    </div>
    <div v-else>
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
  data(){
    return{
      loading:false,
    }
  },
  computed: {
    ...mapState(['articles', 'loading']),
    ...mapGetters(['getArticleById']),
    articleCount() {
      return this.articles.length;
    },
  },
  methods: {
    ...mapActions(['fetchArticles', 'addArticle', 'togglePublished']),
    async cancelFetch() {
      if (this.$store.state.controller) {
        this.$store.state.controller.abort();
        this.$store.commit('SET_CONTROLLER', null);
        this.$store.commit('SET_LOADING', false);
      }
    },
  },
  created() {
    this.loading = true;
    this.fetchArticles()
      .then(() => {
        this.loading = false;
      })
      .catch((error) => {
        console.error(error);
        this.loading = false;
      });
  }
}
</script>

<style>
.unpublished {
  color: red;
}
</style>
