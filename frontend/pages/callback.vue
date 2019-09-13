<template>
  <div>ログインしています......</div>
</template>

<script>
export default {
  async mounted() {
    const state = this.$auth.$state
    const postData = {
      uid: state.user.id,
      provider: state.strategy,
      email: state.user.email
    }

    try {
      const res = await this.$axios.post('/api/auth/sign_in', postData)

      await this.$store.dispatch('auth/setCurrentUser', { user: res.data.data })
    } catch (err) {
      console.error(err)
    }
  }
}
</script>
