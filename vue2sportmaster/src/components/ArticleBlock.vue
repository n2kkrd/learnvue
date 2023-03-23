<template>
    <div class="article-block" :class="{ 'article-block--unpublished': !isPublished }">
      <div>{{ title }}</div>
      <div class="article-content">
        <p v-if="content">{{ content }}</p>
        <p v-if="author">{{ author | capitalize }}</p>
        <p v-if="date">{{ date }}</p>
      </div>
      <button @click.prevent="togglePublished">{{ isPublished ? 'Unpublish' : 'Publish' }}</button>
    </div>
  </template>
  
  <script>
  export default {
    name: 'ArticleBlock',
    props: {
      title: String,
      content: String,
      author: String,
      date: String,
      published: {
        type: Boolean,
        default: false
      }
    },
    filters: {
      capitalize(value) {
        if (!value) return ''
        return value.toUpperCase()
      }
    },
    computed: {
      isPublished() {
        return this.published
      }
    },
    methods: {
      togglePublished() {
        this.$emit('update:published', !this.isPublished)
      }
    }
  }
  </script>
  
  <style>
  .article-block {
    font-size: 16px;
    font-family: sans-serif;
    padding: 20px;
    border: 1px solid #ccc;
    background-color: #fff;
  }
  
  .article-block--unpublished {
    color: red;
  }
  
  .article-block h3 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
  }
  
  button {
    margin-top: 10px;
    background-color: #42b983;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
  }
  </style>
  