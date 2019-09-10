<template>
  <div>hello user details</div>
</template>

<script>
import axios from 'axios'
export default {
  async asyncData({ req }) {
    await axios
      .get('http://localhost:8080/api/')
      .then((res) => console.log(res))
      .catch((err) => console.error(err))
  }
}
</script>
