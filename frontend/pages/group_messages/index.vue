<template>
  <div>
    <h1>グループメッセージ一覧</h1>

    <v-card max-width="450" class="mx-auto">
      <template v-for="(item, index) in groups">
        <v-list :key="index" three-line>
          <v-list-item :to="`/groups/${item.id}?tab=1`">
            <v-list-item-avatar>
              <v-img :src="item.thumbnail"></v-img>
            </v-list-item-avatar>

            <v-list-item-content>
              <v-list-item-title>
                {{ item.name }}
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
    groups: []
  }),

  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser'
    })
  },

  async asyncData({ $axios }) {
    const groups = await $axios
      .$get('/mock/api/user/joined_groups')
      .then((res) => res.data)
      .catch(() => [])

    return {
      groups
    }
  },

  methods: {
    isNotLast(index) {
      return index + 1 < this.groups.length
    }
  }
}
</script>
