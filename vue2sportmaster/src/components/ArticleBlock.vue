<template>
<li class="article">
    {{ title }}
</li>
</template>

<script>
export default {
    name: 'ArticleBlock',
    props: {
        title:String, 
        body:String 
    },
    components:{
        
    }

}
</script>

<style>

</style>
