<template>
  <div>
    <h1>{{ getOpponent.nickname }}さんとのDM</h1>
    <h1>{{ this.dm }}</h1>
    <v-card max-width="450" class="mx-auto chat-card">
      <div class="overflow-y-auto messages">
        <template v-for="(item, index) in directMessages">
          <v-list :id="`message-${index}`" :key="index" three-line class="pa-0">
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
      </div>

      <v-col cols="12" class="mt-12 chat-message-box">
        <v-text-field
          v-model="message"
          outlined
          label="Message"
          hide-details
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
    sending: false,
    directMessageChannel: null,
    dm: 'aaaaaa'
  }),

  channels: {
    DirectMessageChannel: {
      connected: () => {
        console.log('connect')
      },
      received: (data) => {
        console.log(this.directMessages)
      },
      disconnected: () => {}
    }
  },

  mounted() {
    this.$cable.subscribe({
      channel: 'DirectMessageChannel'
    })
  },

  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser'
    }),
    getOpponent() {
      if (this.currentUser.id !== this.directMessageGroup.to_user.id) {
        return this.directMessageGroup.to_user
      }

      return this.directMessageGroup.by_user
    }
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

  updated() {
    this.scrollToEnd()
  },

  methods: {
    getUserBy(id) {
      if (id === this.directMessageGroup.to_user.id) {
        return this.directMessageGroup.to_user
      }

      return this.directMessageGroup.by_user
    },
    scrollToEnd() {
      const chatLog = document.getElementById(
        `message-${this.directMessages.length - 1}`
      )
      if (!chatLog) return
      // TODO: これではoverflow:scroll表示されている要素に飛べないっぽい
      chatLog.scrollTop = chatLog.scrollHeight
    },
    sendMessage(e) {
      // 日本語変換でもkeydownが発火してしまうため処理で制御
      if (e.type !== 'click' && e.keyCode !== 13) return

      // this.sending = true
      this.$cable.perform({
        channel: 'DirectMessageChannel',
        action: 'direct_message',
        data: {
          message: this.message
        }
      })
      // this.sending = false
    }
  }
}
</script>

<style>
.chat-card {
  height: 85vh;
  position: relative;
}

.chat-message-box {
  position: absolute;
  bottom: 0;
}

.messages {
  height: 75vh;
}
</style>
