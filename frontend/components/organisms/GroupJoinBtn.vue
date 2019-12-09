<template>
  <div>
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
</template>

<script>
export default {
  props: {
    group: {
      type: Object,
      required: true
    }
  },

  data: () => ({
    join: false,
    resultJoinType: null,
    resultJoinMessage: null
  }),

  methods: {
    async requestGroupJoin(group) {
      await this.$axios
        .$post(`/api/groups/${group.id}/join`)
        .then(() => {
          this.resultJoinMessage = `「${group.name}」グループに参加しました`
          this.resultJoinType = 'info'
        })
        .catch((err) => {
          this.resultJoinType = 'error'

          if (err.response.status === 409) {
            this.resultJoinMessage = err.response.data.message
            return
          }

          this.resultJoinMessage = `グループに参加失敗しました`
        })
      this.join = true
    }
  }
}
</script>
