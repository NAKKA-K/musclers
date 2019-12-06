<template>
  <div>
    <v-btn to="/groups" class="mb-4" text small>戻る</v-btn>
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

    <div class="ma-2 mb-10">
      <v-btn
        color="#1CA1F1"
        rounded
        outlined
        @click.prevent="() => requestGroupJoin(group)"
      >
        グループに参加する
      </v-btn>

      <v-snackbar
        v-model="join"
        :color="resultJoinType"
        top
        vertical
        :timeout="2500"
      >
        {{ resultJoinMessage }}
        <v-btn dark text @click="join = false">CLOSE</v-btn>
      </v-snackbar>
    </div>

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
        </v-tab-item>

        <v-tab-item class="flat-background">
          グループメンバー
        </v-tab-item>
      </v-tabs-items>
    </v-tabs>
  </div>
</template>

<script>
export default {
  validate({ params }) {
    return /^\d+$/.test(params.id)
  },

  data: () => ({
    group: null,
    messages: null,
    tabs: ['詳細', 'チャット', 'メンバー'],
    tab: null,
    join: false,
    resultJoinType: null,
    resultJoinMessage: null
  }),

  async asyncData({ $axios, params }) {
    const group = await $axios
      .$get(`/api/groups/${params.id}`)
      .then((res) => res.data)
    const messages = await $axios
      .$get(`/mock/api/groups/${params.id}/messages`)
      .then((res) => res.data)

    return {
      group,
      messages
    }
  },

  methods: {
    async requestGroupJoin(group) {
      await this.$axios
        .$post(`/api/groups/${group.id}/join`)
        .then(() => {
          this.resultJoinMessage = `「${group.name}」グループに参加しました`
          this.resultJoinType = 'info'
        })
        .catch(() => {
          this.resultJoinMessage = `グループに参加失敗しました`
          this.resultJoinType = 'error'
        })
      this.join = true
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
