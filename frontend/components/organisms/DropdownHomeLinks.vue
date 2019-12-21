<template>
  <v-toolbar-items>
    <!-- pc site -->
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

    <!-- sp site -->
    <v-menu class="hidden-sm-and-up" bottom>
      <template v-slot:activator="{ on }">
        <v-layout
          class="ml-3 header__item"
          align-center="align-center"
          v-on="on"
        >
          <span>Home</span>
          <v-icon class="header__item__icon--drop" size="18px" light="light">
            arrow_drop_down
          </v-icon>
        </v-layout>
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
      </v-list>
    </v-menu>
  </v-toolbar-items>
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
