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
      console.log('debug1')
      const res = await this.$axios.$post('/api/auth/sign_in', postData)
      console.log('debug2')
      await this.$store.dispatch('auth/setCurrentUser', { user: res.data })
      console.log('debug3')
      if (res.data.email) {
        console.log('debug4')
        this.$router.push('/users')
      } else {
        console.log('debug5')
        this.$router.push('/register') // TODO: Email等の入力画面に遷移させる
      }
    } catch (err) {
      console.log('debug6')
      console.error(err)
    }
  }
}
</script>
