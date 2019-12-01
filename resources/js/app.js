require('./bootstrap');

import '@mdi/font/css/materialdesignicons.css'
window.Vue = require('vue');
import Vuetify from 'vuetify'
import VueRouter from 'vue-router'
import MultiFiltersPlugin from './plugins/MultiFilters'
import store from './store/index'
import { routes } from './routes';

import Swal from 'sweetalert2'

const Toast = Swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 4000
});

window.toast = Toast;

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

import AppComponent from './components/App'

import { initialize } from './initialize';

Vue.use(Vuetify)
Vue.use(VueRouter)
Vue.use(MultiFiltersPlugin)

const router = new VueRouter({ 
    mode: 'history', 
    routes 
})

initialize(store, router);

new Vue({
    el: '#app',
    vuetify: new Vuetify({
        icons: {
            iconfont: 'mdi',
        }
    }),
    router,
    store,
    components: {
        AppComponent
    }
});
