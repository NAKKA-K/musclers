<template>
  <div>ログインしています......</div>
</template>

<script>
export default {
  async mounted() {
    const state = this.$auth.$state
    if (!state.loggedIn) {
      console.error('認証できませんでした')
      return this.$router.push('/auth/login')
    }

    const postData = {
      uid: state.user.id,
      provider: state.strategy,
      email: state.user.email
    }

    try {
      const res = await this.$axios.$post('/api/auth/sign_in', postData)
      this.$store.dispatch('auth/setCurrentUser', { user: res.data })
      if (
        res.data.email === '' ||
        res.data.email === null ||
        typeof res.data.email === 'undefined'
      ) {
        this.$router.push('/register')
      } else {
        this.$router.push('/home')
      }
    } catch (err) {
      console.error(err)
      this.$router.push('/auth/login')
    }
  }
}
</script>
