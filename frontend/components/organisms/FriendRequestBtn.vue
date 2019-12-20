<template>
  <div>
    <v-btn outlined large class="user-request-btn" @click="sendFriendRequest">
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
  props: {
    user: {
      type: Object,
      required: true
    }
  },

  data: () => ({
    requestFriend: false,
    resultRequestType: null,
    resultRequestMessage: null
  }),

  methods: {
    async sendFriendRequest() {
      await this.$axios
        .$post(`/api/user/friends`, { user_id: this.user.id })
        .then(() => {
          this.resultRequestMessage = `友達申請しました`
          this.resultRequestType = 'info'
        })
        .catch((err) => {
          this.resultRequestType = 'error'

          if (err.response.status === 409) {
            this.resultRequestMessage = err.response.data.message
            return
          }

          this.resultRequestMessage = `友達申請に失敗しました`
        })
      this.requestFriend = true
    }
  }
}
</script>

<style lang="scss" scoped>
.user-request-btn {
  color: $main-color;
  caret-color: $main-color;
  font-weight: bold;
  font-size: 16px;
  background-color: rgba(255, 255, 255, 1);
}
</style>
