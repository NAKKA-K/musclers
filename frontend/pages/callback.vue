<template>
  <div>ログインしています......</div>
</template>

<script>
export default {
  async mounted() {
    const state = this.$auth.$state
    if (!state.user) {
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
      console.log('debug1')
      await this.$store.dispatch('auth/setCurrentUser', { user: res.data })
      console.log('debug2')
      if (!res.data.email) {
        console.log('debug3')
        this.$router.push('/register') // TODO: Email等の入力画面に遷移させる
      } else {
        this.$router.push('/users')
      }
    } catch (err) {
      console.error(err)
    }
  }
}
</script>
