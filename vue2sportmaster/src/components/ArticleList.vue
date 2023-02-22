<template>
<div class="articlelist">
    <h1>{{ msg }}</h1>
    <ul v-if="articles.length">
        <ArticleBlock 
        v-for="article in articles" 
        :key="article.id"
        :title="article.title"
        :body="article.body"
        />
    </ul>
    <p v-else>
        No articles in the list.
    </p>
</div>
</template>
  
<script>
  import ArticleBlock  from './ArticleBlock.vue'

  export default {
    name: 'ArticleList',
    props: {
      msg:String
    },
    components: {
      ArticleBlock
    },
    data() {
      return {
        articles: [
          {
            id:1,
            title: 'Title 1',
            body: 'Learn Vue'
            
          },
          {
            id:2,
            title: 'Title 2',
            body: 'Learn about single-file components'
          },
          {
            id:1,
            title: 'Title 3',
            body: 'Fall in love'
          },
        ]
      }
    }
  }
</script>
  
<style scoped>
 h3{
  margin: 40px 0 0;
 }
 ul {
  list-style-type: none;
  padding: 0;
 }
 li{
  display: inline-block;
  margin: 0 10px;
 }
 a{
  color: green;
 }
</style>
  