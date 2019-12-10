<template>
  <div>
    <v-btn outlined color="blue lighten-1" @click="sendFriendRequest">
      友達申請をする
    </v-btn>

    <v-snackbar
      v-model="requestFriend"
      :color="resultRequestType"
      top
      vertical
      :timeout="2500"
    >
      {{ resultRequestMessage }}
      <v-btn dark text @click="requestFriend = false">CLOSE</v-btn>
    </v-snackbar>
  </div>
</template>

<script>
export default {
  data: () => ({
    requestFriend: false,
    resultRequestType: null,
    resultRequestMessage: null
  }),

  methods: {
    async sendFriendRequest() {
      await this.$axios
        .$post(`/api/user/frineds`, { user_id: this.user.id })
        .then(() => {
          this.resultRequestMessage = `友達申請しました`
          this.resultRequestType = 'info'
        })
        .catch(() => {
          this.resultRequestMessage = `友達申請に失敗しました`
          this.resultRequestType = 'error'
        })
      this.requestFriend = true
    }
  }
}
</script>
