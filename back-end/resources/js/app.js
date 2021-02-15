/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require("./bootstrap");

window.Vue = require("vue");
window.axios = require("axios");

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

const files = require.context("./", true, /\.vue$/i);
files.keys().map(key =>
    Vue.component(
        key
            .split("/")
            .pop()
            .split(".")[0],
        files(key).default
    )
);

Vue.component(
    "example-component",
    require("./components/ExampleComponent.vue").default
);
Vue.component("vue-bootstrap-typeahead", VueBootstrapTypeahead);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

import VueSimpleAlert from "vue-simple-alert";
import VueBootstrapTypeahead from "vue-bootstrap-typeahead";
import StarRating from "vue-star-rating";
import "bootstrap/scss/bootstrap.scss";
import VueToastr2 from "vue-toastr-2";
import "vue-toastr-2/dist/vue-toastr-2.min.css";

window.toastr = require("toastr");

Vue.use(VueToastr2);
Vue.use(VueSimpleAlert);
Vue.use(VueBootstrapTypeahead);
Vue.component("star-rating", StarRating);

const app = new Vue({
    el: "#app1"
});
