<template>
  <section class="container">
    <v-content>
      <v-container fluid fill-height>
        <v-layout justify-center>
          <v-flex xs12 sm8>
            <!-- login form -->
            <v-card class="elevation-12" style="height: 130%">
              <v-card-title primary-title margin-bottom class="justify-center">
                <p class="display-3 text--primary font-weight-black">
                  Musclers
                </p>
              </v-card-title>
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
                  >Facebookで新規登録</v-btn
                >
              </v-card-actions>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </section>
</template>

<script>
export default {
  components: {},
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
