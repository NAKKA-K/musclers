<template>
  <h1>response data:{{message}}</h1>
</template>

<script>
import axios from 'axios'

export default {
  components: {
  },
  data() {
    return {
      response: '',
      message: '',
    };
  },
  methods: {
    async sample() {
      await axios.get(
        '/api/hoge/show',
        {
        headers: { 
          'Content-Type': 'application/json',
        },
        timeout: 15000
        }
      )
      .then(res => {
        console.log(res.data);
        this.message = res.data.message;
      })
      .catch(err => console.log(err));
    }
  },
  mounted(){
    this.sample()
  }
}
</script>
