window.Vue = require('vue');

import Vuex from 'vuex'
import auth from './modules/auth'
import book from './modules/book'
import bookcategories from './modules/bookcategories'
import author from './modules/author'

Vue.use(Vuex);

export default new Vuex.Store({
    state: {},
    getters : {},
    mutations: {},
    actions:{},
    
    modules: {
        namespaced: true,
        auth,
        book,
        bookcategories,
        author,
    },
})