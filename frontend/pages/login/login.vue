<template>
  <section class="container">
    <v-content>
      <v-container fluid fill-height>
        <v-layout justify-center>
          <v-flex xs12 sm8>
            <!-- success login -->
            <div v-if="this.response.message === ''">
              <v-alert :value="true" type="success">
                ログインに成功しました!!
              </v-alert>
            </div>

            <!-- can't login... -->
            <div v-else-if="this.response.message === ''">
              <v-alert :value="true" type="error">
                ログインに失敗しました...
              </v-alert>
            </div>
            <br /><br /><br />

            <!-- login form -->
            <div v-if="this.response.message !== ''">
              <v-card class="elevation-12">
                <br /><br />
                <v-card-title primary-title class="justify-center">
                  <p class="display-3 text--primary font-weight-black">
                    Musclers
                  </p>
                </v-card-title>
                <br /><br />
                <v-card-actions primary-title class="justify-center">
                  <v-btn
                    primary
                    width="30%"
                    color="orange lighten-2"
                    class="white--text button-size"
                    @click="userLogin"
                    >ログイン</v-btn
                  >
                </v-card-actions>
                <v-card-actions primary-title class="justify-center">
                  <v-btn
                    primary
                    width="30%"
                    color="light-blue darken-2"
                    class="white--text button-size"
                    @click="userLogin"
                    >Facebookで新規登録</v-btn
                  >
                </v-card-actions>
                <br /><br /><br />
              </v-card>
            </div>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </section>
</template>

<script>
import axios from 'axios'

const LOGIN_URL = process.env.API_URL + 'api/auth/login'

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
      await axios
        .post(LOGIN_URL, {
          user: {
            email: this.user_email,
            password: this.user_pass
          }
        })
        .then((res) => {
          this.response = res.data
          if (this.response.message === 'succesful login') {
            this.$store.commit('login', {
              user_name: this.response.user_name,
              user_token: this.response.user_token,
              user_id: this.response.user_id,
              user_image_url: this.response.user_image_url
            })
          }
        })
        .catch((err) => {
          console.log(err)
        })
    }
  }
}
</script>

<style>
.button-size {
  min-width: 70%;
}
</style>
