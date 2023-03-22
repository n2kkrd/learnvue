<template>
  <div>
    <h2>Добавить статью</h2>
    <form style="width: 50%; margin: 10px auto;">
      <div><input type="text" placeholder="Title" v-model="article.title" /></div>
      <div><input input type="text" placeholder="Author" v-model="article.author" /></div>
      <div><textarea v-model="article.body" placeholder="Body"></textarea></div>
      <div><label><input type="checkbox" v-model="article.published">Published</label></div>
      <div><input type="submit" value="Add" v-on:click.prevent="addArticle(articles, article)" /></div>
    </form>
  </div>
</template>

<script>
import { addArticle } from '../addArticle.js'

export default {
  name: 'ArticleForm',
  data() {
    return {
      article: {
        title: '',
        body: '',
        author: '',
        published: false
      }
    }
  },
  props: {
    articles: Array
  },
  methods: {
    addArticle
  }
}
</script>

<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
.notPublished {
  color: red;
}
input,
textarea {
  font-size: 20px;
  margin: 5px;
}
</style>
