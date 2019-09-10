<template>
  <div>
    <h1>response data:{{ message }}</h1>
    <button type="button" @click="login">login</button>
    <button type="button" @click="logout">logout</button>
    <p>{{ $auth.$state }}</p>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  components: {},
  data() {
    return {
      response: '',
      message: ''
    }
  },
  mounted() {
    this.sample()
    console.log(JSON.stringify(this.$auth.$state))
  },
  methods: {
    async sample() {
      const HOGE_API_URL = 'http://localhost:8080/hoge/show'
      await axios
        .get(HOGE_API_URL, {
          headers: {
            'Content-Type': 'application/json'
          },
          timeout: 15000
        })
        .then((res) => {
          console.log(res.data)
          this.message = res.data.message
        })
        .catch((err) => console.log(err))
    },

    login() {
      this.$auth.loginWith('facebook')
    },
    logout() {
      this.$auth.logout()
    }
  }
}
</script>
