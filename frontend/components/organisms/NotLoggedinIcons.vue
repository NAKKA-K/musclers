<template>
  <!-- toプロパティで制御してしまうと、ログイン画面にいるときボタンの見た目が変わってしまうためclickで制御 -->
  <v-btn id="header-login-btn" text @click="login">
    ログイン
  </v-btn>
</template>

<script>
export default {
  methods: {
    login() {
      this.$router.push('/auth/login')
    }
  }
}
</script>

<style scoped>
#header-login-btn {
  padding: 0;
}
</style>
