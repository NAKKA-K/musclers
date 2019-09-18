<template>
  <v-app id="inspire">
    <div id="app">
      <TheHeader />
      <div class="container">
        <nuxt />
      </div>
      <TheFooter />
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
