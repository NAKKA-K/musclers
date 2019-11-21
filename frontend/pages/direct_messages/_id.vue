<template>
  <div>
    <h1>さんとのDM</h1>

    <v-card max-width="450" class="mx-auto chat-card">
      <template v-for="(item, index) in directMessages">
        <v-list :key="index" three-line class="pa-0">
          <v-list-item>
            <v-list-item-avatar>
              <v-img :src="getUserBy(item.send_user_id).thumbnail"></v-img>
            </v-list-item-avatar>

            <v-list-item-content>
              <v-list-item-title>
                {{ getUserBy(item.send_user_id).nickname || 'unknown' }}
                <span class="grey--text text--lighten-1">
                  {{ item.updated_at }}
                </span>
              </v-list-item-title>
              <v-list-item-subtitle class="d-block">
                {{ item.body }}
              </v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </template>

      <v-col cols="12" class="mt-12 chat-message-box">
        <v-text-field
          v-model="message"
          outlined
          label="Message"
          type="text"
          required
          @keydown.enter="sendMessage"
        >
          <template v-slot:append-outer>
            <v-fade-transition leave-absolute>
              <v-progress-circular
                v-if="sending"
                size="24"
                color="info"
                indeterminate
              ></v-progress-circular>
              <v-icon v-else @click="sendMessage">mdi-send</v-icon>
            </v-fade-transition>
          </template>
        </v-text-field>
      </v-col>
    </v-card>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  middleware: 'auth',

  validate({ params }) {
    return /^\d+$/.test(params.id)
  },

  data: () => ({
    directMessageGroup: null,
    directMessages: null,
    message: '',
    sending: false
  }),

  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser'
    })
  },

  async asyncData({ $axios, params }) {
    const dmGroup = await $axios
      .$get(`/mock/api/user/direct_message_groups/${params.id}`)
      .then((res) => res.data)
      .catch(() => null)
    const directMessages = dmGroup ? dmGroup.direct_messages : null

    return {
      directMessageGroup: dmGroup,
      directMessages
    }
  },

  methods: {
    getUserBy(id) {
      if (id === this.directMessageGroup.to_user.id) {
        return this.directMessageGroup.to_user
      }

      return this.directMessageGroup.by_user
    },
    isNotLast(index) {
      return index + 1 < this.directMessages.length
    },
    async sendMessage(e) {
      // 日本語変換でもkeydownが発火してしまうため処理で制御
      if (e.type !== 'click' && e.keyCode !== 13) return

      this.sending = true
      await this.$axios
        .$post(
          `/mock/api/user/direct_message_groups/${this.$route.params.id}`,
          { message: this.message }
        )
        .then((res) => {
          const message = res.data
          console.log(message)
          this.directMessages.push(message)

          this.sending = false
        })
        .catch(() => {
          this.sending = false
        })
    }
  }
}
</script>

<style>
.chat-card {
  height: 74vh;
  position: relative;
}

.chat-message-box {
  position: absolute;
  bottom: 0;
}
</style>
