<template>
  <div>
    <v-toolbar flat :color="'#ffac12'">
      <div>
        <v-toolbar-title>Muscler's</v-toolbar-title>
      </div>
      <div class="search-bar">
        <v-text-field
          label="ユーザー検索"
          hide-details
          prepend-icon="search"
          single-line
        />
      </div>
      <v-toolbar-items class="hidden-sm-and-down">
        <div class="select-size">
          <v-select
            item-text="title"
            :items="group"
            label="グループ"
            return-object
          />
        </div>
      </v-toolbar-items>
      <v-spacer></v-spacer>
      <v-badge color="red" overlap class="badge-position">
        <i class="material-icons">notifications</i>
        <!--TODO:通知きた時用の分岐<v-if>-->
        <template v-slot:badge>
          <span>1</span>
        </template>
      </v-badge>

      <v-menu v-if="currentUser" offset-y>
        <template v-slot:activator="{ on }">
          <v-btn icon v-on="on">
            <i class="material-icons large-size">account_circle</i>
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
      <v-btn v-else text @click="login">
        ログイン
      </v-btn>
    </v-toolbar>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
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
      { title: 'グループ検索' },
      { title: 'グループ作成' },
      { title: 'グループ一覧' },
      { title: '参加グループ' }
    ]
  }),
  mounted() {
    console.log(this.currentUser)
  },
  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser'
    })
  },
  methods: {
    login() {
      this.$auth.loginWith('facebook')
    }
  }
}
</script>

<style>
.search-bar {
  width: 140px;
  margin: 0px 0px 20px 15px;
}

.select-size {
  width: 100px;
  margin: 0px 0px 0px 5px;
}

.material-icons.large-size {
  font-size: 25px;
}

.badge-position {
  margin: 0px 10px 0px 0px;
}
</style>
