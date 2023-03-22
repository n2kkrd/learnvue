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
  },

addArticle(article) {
  let newArticle = {
    id: this.articles.length+1,
    ...article
  }
  this.articles.push(newArticle);
  console.log(article.title);
},
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