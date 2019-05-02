/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

console.log('Hello World from Webpacker')



import TurbolinksAdapter from 'vue-turbolinks'
import App from '../app.vue'
import Vue from 'vue/dist/vue.esm'
import axios from 'axios'

import VueAxios from 'vue-axios'
import BootstrapVue from 'bootstrap-vue'
import VueRouter from 'vue-router'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

import miniList from '../pages/viewMinis'
import singleMiniView from '../pages/singleMiniView'



Vue.use(BootstrapVue)
Vue.use(VueAxios, axios)
Vue.use(TurbolinksAdapter);
Vue.use(VueRouter)


const routes = [
  { path: '/mini/:id', component: singleMiniView },
  { path: '/minis', component: miniList },
  { path: '/', component: miniList }
]


const router = new VueRouter({
  routes // short for `routes: routes`
})



document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#vueapp',
    router,
    data: () => {
      return {
        message: "Can you say hello?"
      }
    },
    render: h => h(App)
  })
})