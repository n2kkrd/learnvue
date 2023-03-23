<template>
    <ArticleForm title="New title" body="" author="" isPublished=""
    v-on:add-article="addArticle"/>
</template>

<script>
    import ArticleForm from '@/components/ArticleForm.vue'
    import store from '../store'

    export default{
        components:{
            ArticleForm
        },
        methods:{
            addArticle: function(article) {
                let newArticle = {
                    id: store.state.articles.lenght + 1,
                    ...article
                }
                store.commit('addArticle', newArticle);
                console.log(article.title);
                // go to front page
                this.$router.push('/')
            }
        }
    }
</script>