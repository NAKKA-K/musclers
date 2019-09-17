<template>
  <div class="text-center">
    <h3 class="margin">メールアドレスの設定</h3>
    <h5 class="red--text">
      Facebookでメールアドレスが設定されていませんでした。
    </h5>
    <br />
    <v-container>
      <v-col>
        <v-text-field
          label="kobedenshi@gmail.com"
          hide-details
          prepend-icon="email"
          single-line
          class="width pa-5"
        />
      </v-col>
    </v-container>
    <div class="margin-bottom">
      <nuxt-link to="/sign_up"
        ><v-btn class="primary" rounded>登録</v-btn></nuxt-link
      >
    </div>
  </div>
</template>
<style>
.margin {
  margin: 120px 0px 0px 0px;
}
.margin-bottom {
  margin-bottom: 50px;
}
</style>
