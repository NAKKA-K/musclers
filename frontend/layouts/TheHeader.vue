<template>
  <div>
    <v-toolbar flat :color="'#ffac12'">
      <v-toolbar-title>
        <nuxt-link v-if="currentUser" to="/home" class="header-title">
          Muscler's
        </nuxt-link>
        <nuxt-link v-else to="/" class="header-title">Muscler's</nuxt-link>
      </v-toolbar-title>

      <v-col class="col-5 col-xs-4">
        <v-text-field
          v-model="searchQuery"
          label="ユーザー検索"
          hide-details
          prepend-icon="search"
          single-line
          @keyup.enter="onSubmitSearch()"
        />
      </v-col>

      <div class="hidden-xs-only">
        <group-selector
          klass="group-selector"
          :items="group"
          :handle-select="handleSelectGroup"
        />
      </div>

      <v-spacer></v-spacer>

      <div v-if="currentUser">
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
      <!-- toプロパティで制御してしまうと、ログイン画面にいるときボタンの見た目が変わってしまうためclickで制御 -->
      <v-btn v-else id="header-login-btn" text @click="login">
        ログイン
      </v-btn>
    </v-toolbar>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import GroupSelector from '../components/GroupSelector.vue'

export default {
  components: {
    GroupSelector
  },
  data: () => ({
    items: [
      { link: '/mypage', icon: 'account_circle', title: 'マイページ' },
      { link: '/', icon: 'star', title: 'おすすめユーザー' },
      { link: '/messages', icon: 'message', title: 'メッセージ' },
      { link: '/groups', icon: 'group', title: 'グループ' },
      { link: '/users', icon: 'search', title: '検索' }
    ],
    group: [
      { id: 1, icon: 'search', text: 'グループ検索', value: 'search' },
      { id: 2, icon: 'add', text: 'グループ作成', value: 'create' },
      { id: 3, icon: 'ballot', text: 'グループ一覧', value: 'list' },
      { id: 4, icon: 'group', text: '参加グループ', value: 'joined' }
    ],
    searchQuery: ''
  }),
  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser'
    })
  },
  methods: {
    login() {
      this.$router.push('/auth/login')
    },
    logout() {
      this.$auth.logout()
      this.$store.dispatch('auth/logout')
    },
    handleSelectGroup(groupObj) {
      console.log(groupObj)
      if (!groupObj) {
        return
      }

      switch (groupObj.value) {
        case 'search':
          this.$router.push('/groups/search')
          break
        case 'create':
          this.$router.push('/groups/new')
          break
        case 'list':
          this.$router.push('/groups')
          break
        case 'joined':
          this.$router.push('/groups/joined')
          break
      }
    },
    onSubmitSearch() {
      this.$router.push('/users?q=' + this.searchQuery)
    }
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

.badge-position {
  margin: 0px 10px 0px 0px;
  vertical-align: middle;
}

#header-login-btn {
  padding: 0;
}
</style>
