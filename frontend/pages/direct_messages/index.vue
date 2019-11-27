<template>
  <div>
    <h1>DM一覧</h1>

    <v-card max-width="450" class="mx-auto">
      <template v-for="(item, index) in computedDirectMessageGroups">
        <v-list :key="index" three-line>
          <v-list-item :to="`/direct_messages/${item.id}`">
            <v-list-item-avatar>
              <v-img :src="item.opponent.thumbnail"></v-img>
            </v-list-item-avatar>

            <v-list-item-content>
              <v-list-item-title>
                {{ item.opponent.nickname }}
                <span
                  v-if="item.latest_message !== null"
                  class="grey--text text--lighten-1"
                >
                  {{ item.latest_message.created_at }}
                </span>
                <span v-else>
                  <v-spacer></v-spacer>
                </span>
              </v-list-item-title>
              <v-list-item-subtitle v-if="item.latest_message !== null">
                {{ item.latest_message.body }}
              </v-list-item-subtitle>
              <v-list-item-subtitle v-else>
                <v-spacer></v-spacer>
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
    directMessageGroups: []
  }),

  async asyncData({ $axios }) {
    const groups = await $axios
      .$get('api/user/direct_message_groups')
      .then((res) => res.data)
      .catch(() => [])

    return {
      directMessageGroups: groups
    }
  },

  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser'
    }),
    computedDirectMessageGroups() {
      return this.directMessageGroups.reduce((result, current) => {
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
      return index + 1 < this.computedDirectMessageGroups.length
    }
  }
}
</script>
