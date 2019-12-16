<template>
  <div>
    <v-btn to="/groups" class="mb-4" text>
      <v-icon>keyboard_arrow_left</v-icon>
      戻る
    </v-btn>
    <p class="grey--text text--lighten-1">{{ group.created_at }}作成</p>
    <v-flex>
      <h1>「{{ group.name }}」グループ</h1>
      <div v-if="!group.is_public"><v-icon>lock</v-icon></div>
    </v-flex>

    <v-chip-group v-if="group.tags" column>
      <v-chip v-for="tag in group.tags.split(' ')" :key="tag" label small>
        {{ tag }}
      </v-chip>
    </v-chip-group>

    <group-join-btn :group="group" class="ma-2 mb-10"></group-join-btn>

    <v-tabs v-model="tab" class="mt-6" background-color="transparent">
      <v-tab v-for="(item, index) in tabs" :key="index">
        {{ item }}
      </v-tab>

      <v-tabs-items v-model="tab" class="mt-6">
        <v-tab-item class="flat-background">
          <h5 class="mb-2">概要</h5>
          <p style="white-space: pre-wrap;">{{ group.description }}</p>
        </v-tab-item>
        <v-tab-item class="flat-background">
          <template v-for="(item, index) in messages">
            <v-list
              :id="`message-${index}`"
              :key="index"
              three-line
              class="pa-0 flat-background"
            >
              <v-list-item>
                <v-list-item-avatar>
                  <v-img :src="item.send_user.thumbnail"></v-img>
                </v-list-item-avatar>

                <v-list-item-content>
                  <v-list-item-title>
                    {{ item.send_user.nickname || 'unknown' }}
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
          <v-snackbar
            v-model="disconnectedChannel"
            :color="errMsgType"
            top
            vertical
            :timeout="2500"
          >
            {{ errMsg }}
            <v-btn dark text @click="disconnectedChannel = false">CLOSE</v-btn>
          </v-snackbar>
        </v-tab-item>

        <v-tab-item class="flat-background">
          <template v-for="(item, index) in members">
            <v-list
              :id="`member-${index}`"
              :key="index"
              three-line
              class="pa-0 flat-background"
            >
              <v-list-item :to="{ name: 'users-id', params: { id: item.id } }">
                <v-list-item-avatar>
                  <v-img :src="item.thumbnail"></v-img>
                </v-list-item-avatar>

                <v-list-item-content>
                  <v-list-item-title>
                    {{ item.nickname || 'unknown' }}
                  </v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </v-list>
          </template>
        </v-tab-item>
      </v-tabs-items>
    </v-tabs>
  </div>
</template>

<script>
import GroupJoinBtn from '~/components/organisms/GroupJoinBtn.vue'

export default {
  validate({ params }) {
    return /^\d+$/.test(params.id)
  },

  components: {
    GroupJoinBtn
  },

  data: () => ({
    group: null,
    messages: null,
    members: null,
    tabs: ['詳細', 'チャット', 'メンバー'],
    tab: null,
    message: '',
    groupMsgs: null,
    sending: false,
    groupMessageChannel: null,
    disconnectedChannel: false,
    errMsgType: 'error',
    errMsg: null
  }),

  async asyncData({ $axios, params }) {
    const group = await $axios
      .$get(`/api/groups/${params.id}`)
      .then((res) => res.data)
    const messages = await $axios
      .$get(`/mock/api/groups/${params.id}/messages`)
      .then((res) => res.data)
    const members = await $axios
      .$get(`/api/groups/${params.id}/users`)
      .then((res) => res.data.users)
    return {
      group,
      messages,
      members
    }
  },
  mounted() {
    this.groupMessageChannel = this.$cable.subscriptions.create(
      {
        channel: 'GroupMessageChannel',
        room: this.$route.params.id
      },
      {
        connected: () => {
          console.log('connected')
        },
        received: (data) => {
          this.messages.push(data)
        },
        rejected: () => {
          console.log('rejected')
          this.disconnectedChannel = true
          this.errMsgType = 'error'
          this.errMsg = 'メッセージの送信に失敗しました'
        },
        disconnected: () => {
          this.disconnectedChannel = true
          this.errMsgType = 'error'
          this.errMsg = 'チャンネルとの接続が切れました'
        }
      }
    )

    // this.groupMessageChannel.unsubscribe()
  },
  methods: {
    sendMessage(e) {
      // 日本語変換でもkeydownが発火してしまうため処理で制御
      if (e.type !== 'click' && e.keyCode !== 13) return
      this.sending = true
      this.groupMessageChannel.perform('group_message', {
        message: this.message,
        groupId: this.$route.params.id
      })
      this.sending = false
      this.message = ''
    }
  }
}
</script>

<style>
.theme--light.v-btn--active::before {
  opacity: 0;
}

.flat-background {
  background-color: rgb(250, 250, 250) !important;
}
</style>
