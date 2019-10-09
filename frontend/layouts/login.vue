<template>
  <v-app id="inspire">
    <div id="app">
      <v-app id="inspire" style="background-color: #ffb74d;">
        <TheHeader />
        <nuxt />
        <TheFooter />
      </v-app>
    </div>
  </v-app>
</template>

<script>
import TheHeader from './TheHeader.vue'
import TheFooter from './TheFooter.vue'

export default {
  name: 'App',
  components: {
    TheHeader,
    TheFooter
  }
}
</script>
