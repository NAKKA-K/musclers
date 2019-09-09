<template>
  <div>
    <h1>response data:{{ message }}</h1>
    <button type="button" @click="onClick">normal</button>
    <button type="button" @click="onClick2">debug</button>
    <button type="button" @click="onClick3">facebook</button>
    <button type="button" @click="onClick4">window</button>
    <a
      href="https://www.facebook.com/v2.10/dialog/oauth?client_id=501914390641876&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fomniauth%2Ffacebook%2Fcallback&response_type=code&scope=email&state=894a95f6381c156ae112e07e978cebe089bd17a934f7b5d5"
      >link</a
    >
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
    async onClick() {
      await axios
        .get('http://localhost:8080/api/auth/facebook')
        .then((res) => {
          console.log(res)
        })
        .catch((err) => console.error(err))
    },
    async onClick2() {
      await axios
        .get('http://localhost:8080/omniauth/facebook')
        .then((res) => {
          console.log(res)
        })
        .catch((err) => console.error(err))
    },
    async onClick3() {
      await axios
        .get(
          'https://www.facebook.com/v2.10/dialog/oauth?client_id=501914390641876&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fuser_details&response_type=code&scope=email&state=894a95f6381c156ae112e07e978cebe089bd17a934f7b5d5'
        )
        .then((res) => {
          console.log(res)
        })
        .catch((err) => console.error(err))
    },
    onClick4() {
      window.open(
        'https://www.facebook.com/v2.10/dialog/oauth?client_id=501914390641876&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fcallback&response_type=code&scope=email&state=141fee99b845c99a856cd39115c72a54d14bf86b9c8b33d5'
      )
    }
  }
}
</script>
