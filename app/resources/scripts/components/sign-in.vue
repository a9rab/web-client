<template>
    <div class="card">
        <div class="card-content">
            <div class="field">
                <p class="control has-icons-left has-icons-right">
                    <input class="input" type="email" placeholder="Email" v-model="email">
                    <span class="icon is-small is-left">
                    <i class="fas fa-envelope"></i>
                    </span>
                    <span class="icon is-small is-right">
                    <i class="fas fa-check"></i>
                    </span>
                </p>
                </div>
                <div class="field">
                <p class="control has-icons-left">
                    <input class="input" type="password" placeholder="Password" v-model="password">
                    <span class="icon is-small is-left">
                    <i class="fas fa-lock"></i>
                    </span>
                </p>
                </div>
                <div class="field">
                <p class="control">
                    <button class="button is-success is-medium is-fullwidth sign-in-button" @click="submit">
                    Sign in
                    </button>
                </p>
                </div>
        </div>
    </div>

</template>

<script>
export default {
    name: 'signIn',
    data () {
        return {
            email: '',
            password: ''
        };
    },

    methods: {
        submit () {
            this.$root.firebase.auth().signInWithEmailAndPassword(this.email, this.password).then(
                ({user}) => {
                    let payload = {email: user.email, uid: user.uid, name: user.displayName}
                    this.$http.post('/session/create', payload).then(res => window.location.replace('/  '))
                },
                (err) => alert('error: ' + err.message)
            )
        }
    }
}
</script>
