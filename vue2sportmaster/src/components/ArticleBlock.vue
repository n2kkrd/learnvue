<template>
<li class="article">
    {{ title }}
    {{ body }}
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
