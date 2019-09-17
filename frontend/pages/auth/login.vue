<template>
  <section class="container" style="background-color: #FFB74D;">
    <v-content>
      <v-container fluid fill-height>
        <v-layout justify-center>
          <v-flex xs12 sm8>
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
                    @click="login"
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
export default {
  components: {},
  data() {
    return {
      response: '',
      message: ''
    }
  },
  methods: {
    login() {
      this.$auth.loginWith('facebook')
    }
  }
}
</script>

<style>
.button-size {
  min-width: 70%;
}
</style>
