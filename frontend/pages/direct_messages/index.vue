<template>
  <div>
    <h1>DM一覧</h1>

    <v-card max-width="450" class="mx-auto">
      <template v-for="(item, index) in computed_direct_message_groups">
        <v-list :key="index" three-line>
          <v-list-item :to="`/direct_messages/${item.id}`">
            <v-list-item-avatar>
              <v-img :src="item.opponent.thumbnail"></v-img>
            </v-list-item-avatar>

            <v-list-item-content>
              <v-list-item-title>
                {{ item.opponent.nickname }}
                <span class="grey--text text--lighten-1">
                  {{ item.latest_message.created_at }}
                </span>
              </v-list-item-title>
              <v-list-item-subtitle>
                {{ item.latest_message.body }}
              </v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>

          <v-divider
            v-if="isNotLast(index)"
            :key="index"
            :inset="true"
          ></v-divider>
        </v-list>
      </template>
    </v-card>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  middleware: 'auth',

  data: () => ({
    direct_message_groups: []
  }),

  async asyncData({ $axios }) {
    const groups = await $axios
      .$get('/mock/api/user/direct_message_groups')
      .then((res) => res.data)
      .catch(() => [])

    return {
      direct_message_groups: groups
    }
  },

  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser'
    }),
    computed_direct_message_groups() {
      return this.direct_message_groups.reduce((result, current) => {
        if (current.to_user.id !== this.currentUser.id) {
          current.opponent = current.to_user
        } else {
          current.opponent = current.by_user
        }
        result.push(current)
        return result
      }, [])
    }
  },

  methods: {
    isNotLast(index) {
      return index + 1 < this.computed_direct_message_groups.length
    }
  }
}
</script>
