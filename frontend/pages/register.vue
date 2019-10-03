<template>
  <v-container>
    <v-col cols="12" sm="6" offset-sm="3">
      <div>
        <h3 class="margin">メールアドレスの設定</h3>
        <h5 class="red--text">
          Facebookでメールアドレスが設定されていませんでした。
        </h5>
      </div>
      <form>
        <v-text-field
          v-model="email"
          label="kobedenshi@gmail.com"
          hide-details
          prepend-icon="email"
          single-line
          required
        />
      </form>
    </v-col>
  </v-container>
</template>
<script>
export default {
  data() {
    return {
      email: ''
    }
  }
}
</script>
<style>
.margin {
  margin: 120px 0px 0px 0px;
}
.margin-bottom {
  margin-bottom: 50px;
}
</style>
