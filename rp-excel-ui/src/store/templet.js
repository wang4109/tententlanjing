import { getTempletList } from '../services/templet';
import * as types from './types';

const templet = {
  namespaced: true,
  state: {
    list: [],
    page: 1,
    total: 0,
    size:10,
  },
  actions: {
    async fetchTempletList({ commit}, opt) {
      let def = {
        page: 1,
        size: 10,
      };
      def = { ...def, ...opt };
      const { data, status } = await getTempletList(def);
      if (/20\d/.test(status)) {
        commit(types.GET_TEMPLET_LIST, {
          page: def.page,
          size: def.size,
          total: data.data.total,
          list: data.data.tp_list,
        });
      }
    },
  },
  mutations: {
    [types.GET_TEMPLET_LIST](state, data) {
      state.page = data.page;
      state.list = data.list;
      state.total = data.total;
      state.size = data.size;
    },
  },
};

export default templet;
