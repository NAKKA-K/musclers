<template>
  <div>
    <h1>login page</h1>
    <button type="button" @click="login">login</button>
  </div>
</template>

<script>
export default {
  methods: {
    login() {
      this.$auth.loginWith('facebook')
    }
  }
}
</script>
