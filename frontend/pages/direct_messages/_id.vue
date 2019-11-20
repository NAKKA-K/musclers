<template>
  <div>
    <h1>{{ getUserBy($route.params.id).nickname }}さんとのDM</h1>

    <v-card max-width="450" class="mx-auto">
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
    directMessages: null
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
    }
  }
}
</script>
