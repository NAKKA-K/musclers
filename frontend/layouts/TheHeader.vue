<template>
  <div id="app">
    <v-app id="inspire">
      <v-toolbar flat :color="'#ffac12'">
        <div>
          <v-toolbar-title>Muscler's</v-toolbar-title>
        </div>
        <div>
          <v-textarea
            label="ユーザー検索"
            prepend-inner-icon="search"
            rows="1"
            style="width:140px;margin:0px 0px 0px 15px;"
          />
        </div>
        <v-toolbar-items class="hidden-sm-and-down">
          <div>
            <v-select
              item-text="title"
              :items="group"
              label="グループ"
              style="width:100px"
              return-object
            />
          </div>
        </v-toolbar-items>
        <v-spacer></v-spacer>
        <v-badge color="red" overlap style="margin:0px 10px 0px 0px;">
          <i class="material-icons">notifications</i>
          <!--<v-if>-->
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
.material-icons.large-size {
  font-size: 25px;
}
</style>
