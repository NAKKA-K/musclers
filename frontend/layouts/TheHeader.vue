<template>
  <div>
    <v-toolbar flat :color="'#ffac12'">
      <v-toolbar-title>
        <nuxt-link v-if="currentUser" to="/auth/mypage" class="header-title">
          Muscler's
        </nuxt-link>
        <nuxt-link v-else to="/" class="header-title">Muscler's</nuxt-link>
      </v-toolbar-title>
      <v-toolbar-items>
        <dropdown-home-links></dropdown-home-links>
        <v-btn to="/home" class="header-title">
          <v-icon v-text="home"></v-icon>
          Link 1
        </v-btn>
        <v-btn to="/groups" class="header-title">
          <v-icon v-text="group"></v-icon>
          Link 2
        </v-btn>
        <v-btn to="/user_blogs" class="header-title">
          <v-icon v-text="menu_book"></v-icon>
          Link 3
        </v-btn>
      </v-toolbar-items>

      <v-spacer></v-spacer>

      <the-right-side-or-the-header></the-right-side-or-the-header>
    </v-toolbar>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import TheRightSideOrTheHeader from '~/components/organisms/TheRightSideOrTheHeader.vue'
import DropdownHomeLinks from '~/components/organisms/DropdownHomeLinks.vue'

export default {
  components: {
    TheRightSideOrTheHeader,
    DropdownHomeLinks
  },

  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser'
    })
  }
}
</script>

<style>
.header-title {
  margin-right: 0.8em;
  color: black !important;
  font-weight: bold;
  text-decoration: none;
}

.group-selector {
  max-width: 12em;
  margin-bottom: -22px;
}
</style>
