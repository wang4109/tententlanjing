import vue from 'vue';
import vuex from 'vuex';
import templet from './templet';
vue.use(vuex);

const store = new vuex.Store({
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    templet,
  },
});

export default store;
