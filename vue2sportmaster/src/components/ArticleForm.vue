<template>
  <div>
    <h2>Добавить статью</h2>
    <form style="width: 50%; margin: 10px auto;" @submit.prevent="addArticle">
      <div><input type="text" placeholder="Title" v-model="article.title" /></div>
      <div><input input type="text" placeholder="Author" v-model="article.author" /></div>
      <div><textarea v-model="article.content" placeholder="Body"></textarea></div>
      <div><label><input type="checkbox" v-model="article.published">Published</label></div>
      <div><input type="submit" value="Add" /></div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'ArticleForm',
  data() {
    return {
      article: {
        title: '',
        content: '',
        author: '',
        published: false
      }
    }
  },
  methods: {
    addArticle() {
      this.$store.commit('addArticle', this.article)
      this.article = {
        title: '',
        content: '',
        author: '',
        published: false
      }
    }
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