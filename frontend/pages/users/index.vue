<template>
  <div>
    <h1>ユーザー一覧</h1>
    <p>「{{ shapedSearchParameters.keywords }}」で検索しました。</p>

    <paginator :meta="meta" @click="updateUsersPage"></paginator>

    <v-list v-if="users">
      <v-row>
        <v-col
          v-for="user in users"
          :key="user.id"
          class="my-2"
          cols="12"
          xl="3"
          lg="3"
          md="3"
          sm="3"
        >
          <nuxt-link
            :to="{ name: 'users-id', params: { id: user.id } }"
            class="_no-decoration"
          >
            <v-hover v-slot:default="{ hover }">
              <v-card class="user-card" :elevation="hover ? 4 : 2">
                <v-img
                  class="user-image"
                  alt="サムネイル"
                  :src="
                    user.thumbnail ||
                      'https://data.ac-illust.com/data/thumbnails/e3/e3879bde102fa55e1b15630f564e7df1_w.jpeg'
                  "
                ></v-img>
                <v-card-title class="user-name pb-0">
                  {{ user.nickname || 'No name' }}
                </v-card-title>
                <v-card-text class="pb-1">
                  <div class="mb-4 black--text sub-info-text">
                    友達: 9000人<br />本気度: {{ user.seriousness || 'none' }}
                  </div>
                  <div
                    class="card-body-overflow"
                    v-text="user.description"
                  ></div>
                </v-card-text>

                <v-btn
                  class="mt-4 user-request-btn"
                  outlined
                  @click.prevent="() => sendFriendRequest(user)"
                >
                  友達申請する
                </v-btn>
              </v-card>
            </v-hover>
          </nuxt-link>
        </v-col>
      </v-row>
    </v-list>
    <div v-else>
      ユーザーが存在しません
    </div>

    <paginator :meta="meta" @click="updateUsersPage"></paginator>

    <v-snackbar
      v-model="requestFriend"
      :color="resultRequestType"
      top
      vertical
      :timeout="2500"
    >
      {{ resultRequestMessage }}
      <v-btn dark text @click="requestFriend = false">CLOSE</v-btn>
    </v-snackbar>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Paginator from '../../components/Paginator'

function fetchSearchedUsers({ fetcher, params }) {
  return fetcher.$get(`/api/users`, { params }).catch((err) => {
    if (err && err.response && err.response.data) {
      console.error('Reponse: ' + err.response.data.message)
      return err.response
    }

    throw err
  })
}

export default {
  components: {
    Paginator
  },

  data: () => ({
    searchQuery: '',
    users: null,
    requestFriend: false,
    resultRequestType: null,
    resultRequestMessage: null
  }),

  computed: {
    ...mapGetters({
      shapedSearchParameters: 'users/shapedSearchParameters'
    })
  },

  async beforeRouteUpdate(to, from, next) {
    const res = await fetchSearchedUsers({
      fetcher: this.$axios,
      params: this.shapedSearchParameters
    })
    if (res.status === 200) {
      this.users = res.data
      this.meta = res.meta
    }
    next()
  },

  async asyncData({ $axios, query, error, store }) {
    const searchQuery = query.q

    const res = await fetchSearchedUsers({
      fetcher: $axios,
      params: store.getters['users/shapedSearchParameters']
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
    async sendFriendRequest(user) {
      await this.$axios
        .$post(`/api/user/friends`, { user_id: user.id })
        .then(() => {
          this.resultRequestMessage = `${user.nickname}さんに友達申請しました`
          this.resultRequestType = 'info'
        })
        .catch((err) => {
          this.resultRequestType = 'error'

          if (err.response.status === 409) {
            this.resultRequestMessage = err.response.data.message
            return
          }

          this.resultRequestMessage = `友達申請に失敗しました`
        })
      this.requestFriend = true
    },
    updateUsersPage(page) {
      // pageの変更をURLのクエリパラメータに反映
      const parameters = { page }
      this.$store.commit('users/addSearchParameters', { parameters })
      this.$router.replace({ query: this.shapedSearchParameters })
    }
  }
}
</script>

<style lang="scss" scoped>
.user-card {
  max-width: 374px;
  max-height: 500px;
  min-height: 500px;

  > .user-image {
    height: 250px;
  }
  > .user-name {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    display: inline-block;
    font-size: 1.1rem;
    max-width: 100%;
  }
  > .user-request-btn {
    color: $main-color;
    caret-color: $main-color;
    display: block;
    margin-right: auto;
    margin-left: auto;
  }
}
.user-card:hover {
  > .user-name {
    color: $main-color;
  }
  > .user-request-btn:hover:before {
    opacity: 0.15; // vuetify側のopacityに加算されてる
  }
}

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
