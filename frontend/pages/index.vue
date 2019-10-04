<template>
  <div>
    <h1>index page</h1>
    <nuxt-link to="/register">登録</nuxt-link>
    <p>{{ $auth.$state }}</p>
  </div>
</template>

<script>
export default {}
</script>
