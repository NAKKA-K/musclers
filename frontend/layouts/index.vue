<template>
  <v-app id="inspire">
    <TheHeader />
    <v-content>
      <v-container class="pa-0" fluid>
        <nuxt />
      </v-container>
    </v-content>
    <TheFooter />
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
  },
  head: () => ({
    meta: [
      { hid: 'noindex', name: 'robots', content: 'noindex' },
      { hid: 'nofollow', name: 'robots', content: 'nofollow' }
    ]
  })
}
</script>
