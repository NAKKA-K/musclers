<template>
  <div>
    <h1>index page</h1>
    <nuxt-link to="/auth/login">ログイン</nuxt-link>
    <button type="button" @click="login">login</button>
    <button type="button" @click="logout">logout</button>
  </div>
</template>

<script>
export default {}
</script>
