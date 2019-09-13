<template>
  <div>ログインしています......</div>
</template>

<script>
export default {
  mounted() {
    const state = this.$auth.$state
    const postData = {
      uid: state.user.id,
      provider: state.strategy,
      email: state.user.email
    }

    this.$axios
      .post('/api/auth/sign_in', postData)
      .then((res) => console.log(res))
      .catch((err) => console.error(err))
  }
}
</script>
