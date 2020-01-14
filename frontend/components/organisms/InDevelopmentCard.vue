<template>
  <v-card class="mx-auto ma-12" max-width="500">
    <v-card-title class="justify-center">
      こちらのページは現在開発中です
    </v-card-title>
    <v-card-text class="text-center">
      今しばらくお待ちください。
    </v-card-text>
    <v-card-actions class="justify-center">
      <v-btn text class="return-btn" to="/home">ホームページに戻る</v-btn>
      <v-btn text class="return-btn" @click="() => $router.go(-1)">
        一つ前のページに戻る
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<style lang="scss" scoped>
.return-btn {
  color: $main-color-deep;
}
</style>
