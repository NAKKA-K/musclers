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
                  color="light-blue darken-2"
                  class="white--text button-size"
                  style="min-width: 60%;"
                  @click="login"
                  >Facebookでログイン</v-btn
                >
              </v-card-actions>
              <v-card-actions
                v-if="debugMode"
                primary-title
                class="justify-center"
              >
                <v-btn
                  primary
                  color="light-blue darken-2"
                  class="white--text button-size"
                  style="min-width: 60%;"
                  @click="debug"
                  >デバッグログイン</v-btn
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
  layout: 'login',
  data: () => ({
    debugMode: false
  }),
  mounted() {
    if (process.env.NODE_ENV === 'development') {
      this.debugMode = true
    }
  },
  methods: {
    login() {
      this.$auth.loginWith('facebook')
    },
    debug() {
      this.$axios
        .$get('/api/debug_login')
        .then((response) => {
          this.$store.dispatch('auth/setCurrentUser', { user: response.data })
          this.$store.dispatch('auth/setDebugLoggedIn', { flag: true })
          this.$router.push('/home')
        })
        .catch((error) => {
          console.log('response error', error)
        })
    }
  }
}
</script>
