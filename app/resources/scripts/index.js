import Vue from 'vue'
import firebase from 'firebase'
import axios from 'axios'
import signUp from './components/sign-up.vue'
import signIn from './components/sign-in.vue'
import googleMaps from './components/google-maps.vue'

// Set the X-CSRF header for all the requests
axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name=csrf-token]').getAttribute('content')
window.a = axios
// Use axios using the old this.$http used in vue-resource
Vue.prototype.$http = axios


// Initialize Firebase
// TODO: Replace with your project's customized code snippet
var config = {
    apiKey: "AIzaSyB2hDwl6bDSe2FQuQnREEyVEr8UD-QKTuk",
    authDomain: "dwaya-80c37.firebaseapp.com",
    databaseURL: "https://dwaya-80c37.firebaseio.com",
    storageBucket: "dwaya-80c37.appspot.com",
};
firebase.initializeApp(config);

new Vue({
    el: '#app',
    components: {signUp, signIn, googleMaps},
    data () {
        return {
            firebase
        }
    }
})
