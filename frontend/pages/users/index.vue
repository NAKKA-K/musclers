<template>
  <div>
    <h1>ユーザー一覧</h1>
    <p>「{{ searchQuery }}」で検索しました。</p>

    <paginator :meta="meta" @click="updateUsersPage"></paginator>

    <v-list v-if="users">
      <v-row>
        <v-col
          v-for="user in users"
          :key="user.id"
          cols="12"
          xl="3"
          lg="3"
          md="3"
          sm="3"
        >
          <v-card
            class="mx-auto my-4"
            max-width="374"
            max-height="530"
            min-height="530"
          >
            <nuxt-link :to="{ name: 'users-id', params: { id: user.id } }">
              <v-img
                height="300"
                :src="
                  user.thumbnail ||
                    'https://data.ac-illust.com/data/thumbnails/e3/e3879bde102fa55e1b15630f564e7df1_w.jpeg'
                "
              ></v-img>
            </nuxt-link>
            <v-card-title class="pb-0">
              <nuxt-link :to="{ name: 'users-id', params: { id: user.id } }">
                {{ user.nickname || 'No name' }}
              </nuxt-link>
            </v-card-title>
            <v-card-text class="pb-1">
              <div class="mb-4 black--text sub-info-text">
                友達: 9000人<br />本気度: {{ user.seriousness || 'none' }}
              </div>
              <div class="card-body-overflow" v-text="user.description"></div>
            </v-card-text>

            <div class="text-center">
              <v-btn
                color="#1CA1F1"
                rounded
                outlined
                @click.prevent="() => sendFriendRequest(user.id)"
              >
                友達申請する
              </v-btn>
            </div>
          </v-card>
        </v-col>
      </v-row>
    </v-list>
    <div v-else>
      ユーザーが存在しません
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Paginator from '../../components/Paginator'

export default {
  components: {
    Paginator
  },

  data: () => ({
    searchQuery: '',
    users: null
  }),

  computed: {
    ...mapGetters({
      shapedSearchParameters: 'users/shapedSearchParameters'
    })
  },

  beforeRouteUpdate(to, from, next) {
    // 検索クエリを更新
    this.searchQuery = to.query.q
    // TODO: 再取得
    console.log('beforeRouteUpdate')
    next()
  },

  async asyncData({ $axios, query, error, store }) {
    const searchQuery = query.q

    const res = await $axios
      .$get('/api/users/search', {
        params: store.getters['users/shapedSearchParameters']
      })
      .catch((err) => {
        if (err && err.response && err.response.data) {
          console.error('Reponse: ' + err.response.data.message)
          return err.response
        }

        throw err
      })

    if (res.status !== 200) {
      error({ statusCode: res.status, message: res.data.message })
      return
    }

    return {
      searchQuery,
      users: res.data,
      meta: res.meta
    }
  },

  methods: {
    sendFriendRequest(userId) {
      // TODO: 友達申請APIを呼び出す
      console.log(userId)
    },
    async updateUsersPage(page) {
      const parameters = { page }
      this.$store.commit('users/addSearchParameters', { parameters })

      const res = await this.$axios
        .$get(`/api/users/search`, { params: this.shapedSearchParameters })
        .catch((err) => {
          if (err && err.response && err.response.data) {
            console.error('Reponse: ' + err.response.data.message)
            return err.response
          }

          throw err
        })

      if (res.status === 200) {
        this.users = res.data
        this.meta = res.meta
      }
    }
  }
}
</script>

<style>
.card-body-overflow {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
  min-height: 5em;
}
.sub-info-text {
  font-size: 14px;
}
</style>
