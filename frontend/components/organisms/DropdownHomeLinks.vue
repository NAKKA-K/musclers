<template>
  <v-menu bottom>
    <template v-slot:activator="{ on }">
      <v-layout class="ml-3 header__item" align-center="align-center" v-on="on">
        <span>Home</span>
        <v-icon class="header__item__icon--drop" size="18px" light="light">
          arrow_drop_down
        </v-icon>
      </v-layout>
    </template>

    <!-- TODO: 全員がアクセスできるまとめページ的なのにリンクする -->
    <v-list>
      <v-list-item v-for="(item, i) in items" :key="i" :to="item.link">
        <v-avatar size="25px" class="mr-2">
          <v-icon v-text="item.icon"></v-icon>
        </v-avatar>
        <v-list-item-content>
          <v-list-item-title v-text="item.title"></v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-menu>
</template>

<script>
export default {
  data: () => ({
    items: [
      { link: '/home', icon: 'home', title: 'ホーム' },
      { link: '/groups', icon: 'group', title: 'グループ' },
      { link: '/user_blogs', icon: 'menu_book', title: 'ユーザーブログ' }
    ]
  })
}
</script>
