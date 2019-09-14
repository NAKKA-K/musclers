<template>
  <div id="app">
    <v-app id="inspire">
      <TheHeader />
      <nuxt />
      <TheFooter />
    </v-app>
  </div>
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
