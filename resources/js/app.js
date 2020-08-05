require('./bootstrap');

import Vue from 'vue'
import Vuetify from 'vuetify'
import router from './router'
import 'vuetify/dist/vuetify.min.css'
import Permissions from './mixins/Permissions';
import VueSession from 'vue-session';

Vue.use(VueSession);
Vue.mixin(Permissions);


Vue.use(Vuetify, {
  theme: {
     themes: {
       light: {
         primary: '#3f51b5',
         secondary: '#b0bec5',
         anchor: '#8c9eff',
       },
     },
   },
})
Vue.use(require('vue-moment'));

Vue.component('home-component', require('./components/HomeComponent.vue').default);

window.eventBus = new Vue();



const app = new Vue({
    el: '#app',
    router
});
