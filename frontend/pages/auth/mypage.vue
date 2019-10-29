<template>
  <div>
    <h2>マイページ</h2>

    <v-text-field v-model="nickname" label="ニックネーム"></v-text-field>

    <v-text-field v-model="age" label="年齢" disabled></v-text-field>

    <v-text-field v-model="gender" label="性別" disabled></v-text-field>

    <v-text-field v-model="height" label="身長" disabled></v-text-field>

    <v-text-field v-model="weight" label="体重" disabled></v-text-field>

    <v-radio-group v-model="seriousness" row disabled>
      <v-radio label="ガチ" value="serious"></v-radio>
      <v-radio label="エンジョイ" value="enjoy"></v-radio>
      <v-radio label="未設定" value="none"></v-radio>
    </v-radio-group>

    <p>-{{ currentUser }}-</p>
    <p>-{{ user }}-</p>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  middleware: 'auth',
  data: () => ({
    user: {}
  }),

  computed: {
    ...mapGetters('auth', ['currentUser']),
    nickname: {
      get: (vm) => (vm.user ? vm.user.nickname : null),
      set(val) {
        this.user.nickname = val
      }
    },
    age: (vm) => (vm.user ? vm.user.age : null),
    gender: (vm) => (vm.user ? vm.user.gender : null),
    height: (vm) => (vm.user ? vm.user.height : null),
    weight: (vm) => (vm.user ? vm.user.weight : null),
    seriousness: (vm) => (vm.user ? vm.user.seriousness : null)
  },

  mounted() {
    console.log(this.user)
    console.log(this.currentUser)
    if (this.currentUser) {
      this.user = this.currentUser
    }
  }
}
</script>
