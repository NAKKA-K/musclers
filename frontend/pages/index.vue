<template>
  <div>
    <h1>index page</h1>
    <nuxt-link to="/auth/login">ログイン</nuxt-link>
    <nuxt-link to="/register">登録</nuxt-link>
    <p>{{ $auth.$state }}</p>
    {{ this.$store.state.auth.user }}
    {{ this.$store.state.auth.currentUser }}
  </div>
</template>

<script>
export default {}
</script>
