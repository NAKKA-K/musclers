<template>
  <div>
    <v-badge color="red" overlap class="badge-position">
      <i class="material-icons">notifications</i>
      <!--TODO:通知きた時用の分岐<v-if>-->
      <template v-slot:badge>
        <span>1</span>
      </template>
    </v-badge>

    <v-menu offset-y>
      <template v-slot:activator="{ on }">
        <v-btn icon v-on="on">
          <v-avatar v-if="currentUser.thumbnail">
            <img :src="currentUser.thumbnail" />
          </v-avatar>
          <v-icon v-else>person</v-icon>
        </v-btn>
      </template>

      <v-list>
        <v-list-item v-for="(item, i) in items" :key="i" :to="item.link">
          <v-avatar size="25px" class="mr-2">
            <v-icon v-text="item.icon"></v-icon>
          </v-avatar>
          <v-list-item-content>
            <v-list-item-title v-text="item.title"></v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item key="logout" @click="logout">
          <v-avatar size="25px" class="mr-2">
            <v-icon>assignment_return</v-icon>
          </v-avatar>
          <v-list-item-content>
            <v-list-item-title>ログアウト</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-menu>
  </div>
</template>

<script>
export default {
  props: {
    currentUser: {
      type: Object,
      required: true
    }
  },
  data: () => ({
    items: [
      { link: '/home', icon: 'account_circle', title: 'マイページ' },
      { link: '/direct_messages', icon: 'message', title: 'DM一覧' },
      { link: '/search', icon: 'search', title: '検索' },
      { link: '/auth/setting', icon: 'build', title: '設定' }
    ]
  }),

  methods: {
    logout() {
      this.$auth.logout()
      this.$store.dispatch('auth/logout')
      this.$router.push('/')
    }
  }
}
</script>

<style scoped>
.badge-position {
  margin: 0px 10px 0px 0px;
  vertical-align: middle;
}
</style>
