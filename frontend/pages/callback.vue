<template>
  <div>hello user details</div>
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

    await this.$axios
      .post('http://localhost:8080/api/auth/sign_in', postData)
      .then((res) => console.log(res))
      .catch((err) => console.error(err))
  }
}
</script>
