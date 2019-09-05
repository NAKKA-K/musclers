<template>
  <h1>response data:{{ message }}</h1>
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
    }
  }
}
</script>
