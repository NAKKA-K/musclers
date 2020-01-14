<template>
  <div>
    <primary-btn v-if="isGroupJoined">
      参加済み
    </primary-btn>
    <primary-outline-btn v-else @click.prevent="requestGroupJoin(group)">
      グループに参加する
    </primary-outline-btn>

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
import PrimaryOutlineBtn from '~/components/atoms/PrimaryOutlineBtn.vue'
import PrimaryBtn from '~/components/atoms/PrimaryBtn.vue'

export default {
  components: {
    PrimaryOutlineBtn,
    PrimaryBtn
  },

  props: {
    group: {
      type: Object,
      required: true
    }
  },

  computed: {
    isGroupJoined() {
      return this.group ? this.group.joined : false
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
