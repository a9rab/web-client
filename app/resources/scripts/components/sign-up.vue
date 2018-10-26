<template>
    <div class="panel">
        <div class="panel-block">
            <h1>Sign up</h1>
            <input type="text" v-model="email">
            <input type="password" v-model="password">
            <button @click="submit">sign up</button>
        </div>
    </div>

</template>

<script>
export default {
    name: 'signUp',
    data () {
        return {
            email: '',
            password: ''
        };
    },

    methods: {
        submit () {
            this.$root.firebase.auth().createUserWithEmailAndPassword(this.email, this.password).then(
                (user) => alert('User was created!'),
                (err) => alert('error: ' + err.message)
            )
        }
    }
}
</script>
