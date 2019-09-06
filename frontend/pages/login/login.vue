<template>
  <h1>response data:{{ message }}</h1>
</template>

<script>
import axios from 'axios'
import { mapMutations } from 'vuex'

const LOGIN_URL = process.env.API_URL + 'api/auth/login';

export default {
  components: {},
  data() {
    return {
      response: '',
      message: ''
    }
  },
  methods: {
    async userLogin() {
      await axios.post(
        LOGIN_URL,
        {
          'user': {
            'email': this.user_email,
            'password': this.user_pass
          }
        })
        .then(res => {
          this.response = res.data;
          console.log(this.response);
          if( this.response.message === 'succesful login' ) {
            this.$store.commit('login', {
              user_name: this.response.user_name, 
              user_token: this.response.user_token,
              user_id: this.response.user_id,
              user_image_url: this.response.user_image_url
            });
          }
        })
        .catch(err => console.log(err));
    }
  }
}
</script>
