<template>
  <div id="app">
    <v-app id="inspire">
      <v-toolbar flat :color="'#ffac12'">
        <div>
          <v-toolbar-title>Muscler's</v-toolbar-title>
        </div>
        <div class="search_bar">
          <v-text-field
            label="ユーザー検索"
            hide-details
            prepend-icon="search"
            single-line
          />
        </div>
        <v-toolbar-items class="hidden-sm-and-down">
          <div class="select_size">
            <v-select
              item-text="title"
              :items="group"
              label="グループ"
              return-object
            />
          </div>
        </v-toolbar-items>
        <v-spacer></v-spacer>
        <v-badge color="red" overlap class="badge_position">
          <i class="material-icons">notifications</i>
          <!--TODO:通知きた時用の分岐<v-if>-->
          <template v-slot:badge>
            <span>1</span>
          </template>
        </v-badge>
        <v-menu offset-y>
          <template v-slot:activator="{ on }">
            <i class="material-icons large-size">account_circle</i>
          </template>
          <v-list>
            <v-list-item v-for="(item, i) in items" :key="i">
              <v-list-item-title>{{ item.title }}</v-list-item-title
              ><br />
            </v-list-item>
          </v-list>
        </v-menu>
      </v-toolbar>
    </v-app>
  </div>
</template>
<script>
export default {
  data: () => ({
    items: [
      { title: 'マイページ' },
      { title: 'おすすめユーザー' },
      { title: 'メッセージ' },
      { title: 'グループ' },
      { title: '検索' },
      { title: 'ログアウト' }
    ],
    group: [
      { title: 'グループ検索' },
      { title: 'グループ作成' },
      { title: 'グループ一覧' },
      { title: '参加グループ' }
    ]
  })
}
</script>

<style>
.search_bar {
  width: 140px;
  margin: 0px 0px 20px 15px;
}

.select_size {
  width: 100px;
  margin: 0px 0px 0px 5px;
}

.material-icons.large-size {
  font-size: 25px;
}

.badge_position {
  margin: 0px 10px 0px 0px;
}
</style>
