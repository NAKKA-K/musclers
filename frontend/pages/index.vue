<template>
  <div>
    <h1>index page</h1>
    <nuxt-link to="/auth/login">ログイン</nuxt-link>
    <button type="button" @click="login">login</button>
    <button type="button" @click="logout">logout</button>
    <p>{{ $auth.$state }}</p>
  </div>
</template>

<script>
export default {
  methods: {
    login() {
      this.$auth.loginWith('facebook')
    },
    logout() {
      this.$auth.logout()
    }
  }
}
</script>
