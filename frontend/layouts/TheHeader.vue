<template>
  <div>
    <v-toolbar flat :color="'#ffac12'">
      <v-toolbar-title class="header-title">Muscler's</v-toolbar-title>

      <v-col cols="6" sm="3">
        <v-text-field
          label="ユーザー検索"
          hide-details
          prepend-icon="search"
          single-line
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
              <v-icon>account_circle</v-icon>
            </v-btn>
          </template>

          <v-list>
            <v-list-item v-for="(item, i) in items" :key="i" @click="() => {}">
              <v-icon v-text="item.icon"></v-icon>
              <v-list-item-content>
                <v-list-item-title v-text="item.title"></v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </v-menu>
      </div>
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
      { icon: 'account_circle', title: 'マイページ' },
      { icon: 'account_circle', title: 'おすすめユーザー' },
      { icon: 'account_circle', title: 'メッセージ' },
      { icon: 'account_circle', title: 'グループ' },
      { icon: 'account_circle', title: '検索' },
      { icon: 'account_circle', title: 'ログアウト' }
    ],
    group: [
      { id: 1, icon: 'account_circle', text: 'グループ検索' },
      { id: 2, icon: 'account_circle', text: 'グループ作成' },
      { id: 3, icon: 'account_circle', text: 'グループ一覧' },
      { id: 4, icon: 'account_circle', text: '参加グループ' }
    ]
  }),
  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser'
    })
  },
  methods: {
    login() {
      this.$auth.loginWith('facebook')
    },
    handleSelectGroup(groupObj) {
      console.log(groupObj)
    }
  }
}
</script>

<style>
.header-title {
  margin-right: 0.8em;
}

.group-selector {
  max-width: 12em;
  margin-bottom: -22px;
}

.material-icons.large-size {
  font-size: 25px;
}

.badge-position {
  margin: 0px 10px 0px 0px;
}

#header-login-btn {
  padding: 0;
}
</style>
