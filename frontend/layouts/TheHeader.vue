<template>
  <div>
    <v-navigation-drawer v-model="drawer" app clipped>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title class="title">
            Muscler's
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>
      <v-divider></v-divider>
      <v-list dense>
        <v-list-item v-for="(item, i) in items" :key="i" :to="item.link">
          <v-list-item-action>
            <v-avatar size="25px" class="mr-2">
              <v-icon v-text="item.icon"></v-icon>
            </v-avatar>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title v-text="item.title"></v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app clipped-left flat :color="'#ffac12'">
      <v-app-bar-nav-icon
        class="hidden-sm-and-up"
        @click.stop="drawer = !drawer"
      />
      <v-toolbar-title>
        <nuxt-link v-if="currentUser" to="/auth/mypage" class="header-title">
          Muscler's
        </nuxt-link>
        <nuxt-link v-else to="/" class="header-title">Muscler's</nuxt-link>
      </v-toolbar-title>
      <v-toolbar-items>
        <v-btn
          v-for="(item, i) in items"
          :key="i"
          :to="item.link"
          text
          class="hidden-md-and-down hidden-xl-only"
        >
          <v-icon left v-text="item.icon"></v-icon>
          {{ item.title }}
        </v-btn>
      </v-toolbar-items>
      <v-spacer></v-spacer>
      <the-right-side-or-the-header></the-right-side-or-the-header>
    </v-app-bar>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import TheRightSideOrTheHeader from '~/components/organisms/TheRightSideOrTheHeader.vue'

export default {
  components: {
    TheRightSideOrTheHeader
  },
  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser'
    })
  },
  data: () => ({
    drawer: false,
    items: [
      { link: '/home', icon: 'home', title: 'ホーム' },
      { link: '/groups', icon: 'group', title: 'グループ' },
      { link: '/user_blogs', icon: 'menu_book', title: 'ユーザーブログ' }
    ]
  })
}
</script>

<style lang="scss" scoped>
.musclers-header {
  background-color: $main-color;
}

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
