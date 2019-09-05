<template>
  <div id="app">
    <v-app id="inspire">
      <v-toolbar>
        <div>
          <v-toolbar-title>Muscler's</v-toolbar-title>
        </div>
        <div>
          <v-textarea
          label="ユーザー検索"
          prepend-inner-icon="search"
          rows="1"
          />
        </div>
        <v-toolbar-items class="hidden-sm-and-down">
          <div>
            <v-select
            item-text="title"
            :items="group"
            label="グループ"
            return-object
            />
          </div>
        </v-toolbar-items>
        <v-spacer></v-spacer>
        <a>
          <v-badge style="margin:25px;">
            <template v-slot:badge>0</template>
          </v-badge>
        </a>
        <v-menu offset-y>
          <template v-slot:activator="{ on }">
            <i v-on="on" class="material-icons" btn>account_circle</i>
          </template>
          <v-list>
            <v-list-item
            v-for="(item, index) in items"
            :key="index"
            @click=""
            size="18">
              <v-list-item-title>{{ item.title }}</v-list-item-title><br>
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
        { title: 'ログアウト' },
      ],
      group:[
        { title: 'グループ検索' },
        { title: 'グループ作成' },
        { title: 'グループ一覧' },
        { title: '参加グループ' },

      ]
    }),
  }
</script>