import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    articles: [],
  },
  mutations: {
    SET_ARTICLES(state, articles) {
      state.articles = articles;
    },
    addArticle(state, article) {
      state.articles.push(article);
    },
    TOGGLE_ARTICLE_PUBLISHED(state, articleId) {
      const article = state.articles.find(a => a.id === articleId);
      if (article) {
        article.published = !article.published;
      }
    },
  },
  actions: {
    async fetchArticles({ commit }) {
      try {
        const response = await fetch('/articles.json');
        const articles = await response.json();
        commit('SET_ARTICLES', articles);
      } catch (error) {
        console.error(error);
      }
    },
    addArticle({commit},article){
      commit('ADD_ARTICLE',article)
    }
  },
  getters: {
    publishedArticles(state) {
      return state.articles.filter(a => a.published);
    },
    unpublishedArticles(state) {
      return state.articles.filter(a => !a.published);
    },
  },
});
