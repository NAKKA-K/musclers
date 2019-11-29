<template>
  <div>
    <v-btn to="/groups" class="mb-4" text small>戻る</v-btn>
    <p class="grey--text text--lighten-1">{{ group.created_at }}作成</p>
    <v-flex>
      <h1>「{{ group.name }}」グループ</h1>
      <div v-if="!group.is_public"><v-icon>lock</v-icon></div>
    </v-flex>

    <template v-for="tag in group.tags">
      <v-btn :key="tag.id" color="darkgray" class="mr-2 mb-1" depressed small>
        {{ tag.name }}
      </v-btn>
    </template>

    <v-tabs v-model="tab" class="mt-6" background-color="transparent">
      <v-tab v-for="(item, index) in tabs" :key="index">
        {{ item }}
      </v-tab>

      <v-tabs-items v-model="tab" class="mt-6">
        <v-tab-item class="flat-background">
          <h5 class="mb-2">概要</h5>
          {{ group.description }}
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
    tab: null
  }),

  async asyncData({ $axios, params }) {
    const group = await $axios
      .$get(`/mock/api/groups/${params.id}`)
      .then((res) => res.data)
    const messages = await $axios
      .$get(`/mock/api/groups/${params.id}/messages`)
      .then((res) => res.data)

    return {
      group,
      messages
    }
  },

  mounted() {
    // BUG: タグが変わりません
    const tab = this.$route.query.tab
    this.tab = tab >= 0 && tab <= 2 ? tab : null
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
