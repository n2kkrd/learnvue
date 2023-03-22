<template>
    <div>
      <h2>{{ title }}</h2>
      <div class="article-list">
        <article-block
            v-for="article in articles"
            :key="article.id"
            :title="article.title"
            :content="article.content"
            :author="article.author"
            :date="article.date"
            :published.sync="article.published"
            v-bind:class="{ 'unpublished': !article.published }"
        ></article-block>

      </div>
      <ArticleForm @add-article="addArticle" />
    </div>
  </template>
  
  <script>
  import ArticleForm from './ArticleForm.vue'
  import ArticleBlock from './ArticleBlock.vue'
  
  export default {
  name: 'ArticleList',
  components: {
    ArticleBlock,
    ArticleForm
  },
  data() {
    return {
      articles: []
    };
  },
  methods: {
    async loadArticles() {
      try {
        const response = await fetch('/articles.json');
        this.articles = await response.json();
      } catch (error) {
        console.error(error);
      }
    }
  },
  
  addArticle(article) {
    article.id = this.articles.length + 1;
    this.articles.push(article);
  },
  togglePublished(article) {
      article.published = !article.published;
  },
  beforeMount() {
    this.loadArticles();
  }
}
  </script>
  
  <style>
  .unpublished {
    color: red;
  }
  </style>
  