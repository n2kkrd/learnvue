import Vue from 'vue';
import axios from 'axios';
import Vuex from 'vuex';

Vue.use(Vuex);

const api = axios.create({
  baseURL: 'http://localhost:10000',
});

export default new Vuex.Store({
  state: {
    articles: [],
    loading: false,
    controller: null,
  },
  mutations: {
    SET_ARTICLES(state, articles) {
      state.articles = articles;
    },
    ADD_ARTICLE(state, article) {
      state.articles.push(article);
    },
    TOGGLE_ARTICLE_PUBLISHED(state, articleId) {
      const article = state.articles.find(a => a.id === articleId);
      if (article) {
        article.published = !article.published;
      }
    },
    SET_LOADING(state, loading) {
      state.loading = loading;
    },
    SET_CONTROLLER(state, controller) {
      state.controller = controller;
    },
  },
  actions: {
    async fetchArticles({ commit, state }) {
      try {
        if (state.controller) {
          state.controller.abort();
        }

        const controller = new AbortController();
        const signal = controller.signal;
        commit('SET_CONTROLLER', controller);
        commit('SET_LOADING', true);

        const response = await api.get('/articles', { signal });
        const articles = response.data;

        commit('SET_ARTICLES', articles);
        commit('SET_LOADING', false);
      } catch (error) {
        console.error(error);
        commit('SET_LOADING', false);
      }
    },

    async addArticle({ commit }, article) {
      try {
        commit('SET_LOADING', true);

        const response = await api.post('/articles', article);
        const newArticle = response.data;

        commit('ADD_ARTICLE', newArticle);
        commit('SET_LOADING', false);
      } catch (error) {
        console.error(error);
        commit('SET_LOADING', false);
      }
    },
  },
  getters: {
    publishedArticles(state) {
      return state.articles.filter(a => a.published);
    },
    unpublishedArticles(state) {
      return state.articles.filter(a => !a.published);
    },
    isLoading(state) {
      return state.loading;
    },
  },
});
