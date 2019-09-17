<template>
  <div id="app">
    <v-app id="inspire" style="background-color: #FFB74D;">
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
