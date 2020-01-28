<template>
  <div>
    <primary-btn v-if="isFriends" large>
      友達申請済み
    </primary-btn>
    <primary-outline-btn v-else large @click.prevent="sendFriendRequest">
      友達申請をする
    </primary-outline-btn>

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
import PrimaryOutlineBtn from '~/components/atoms/PrimaryOutlineBtn.vue'
import PrimaryBtn from '~/components/atoms/PrimaryBtn.vue'

export default {
  components: {
    PrimaryOutlineBtn,
    PrimaryBtn
  },

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

  computed: {
    isFriends() {
      return this.user ? this.user.is_friends : false
    }
  },

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
  background-color: rgba(255, 255, 255, 1);
}
</style>
