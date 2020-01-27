<template>
  <loggedin-icons
    v-if="currentUser"
    :current-user="currentUser"
  ></loggedin-icons>
  <not-loggedin-icons v-else></not-loggedin-icons>
</template>

<script>
import { mapGetters } from 'vuex'
import LoggedinIcons from '~/components/organisms/LoggedinIcons.vue'
import NotLoggedinIcons from '~/components/organisms/NotLoggedinIcons.vue'

export default {
  components: {
    LoggedinIcons,
    NotLoggedinIcons
  },

  computed: {
    ...mapGetters({
      currentUser: 'authentication/currentUser'
    })
  }
}
</script>
