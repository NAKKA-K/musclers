<template>
  <div>
    <div class="d-flex">
      <h1>グループ一覧</h1>
      <v-spacer></v-spacer>
      <v-btn rounded small color="#ffac12" dark to="/groups/new">
        <v-icon dark>mdi-plus</v-icon>
        グループ作成
      </v-btn>
    </div>

    <div class="d-flex align-center mt-6">
      <v-text-field
        v-model="searchQuery"
        label="グループ検索"
        placeholder="キーワードでグループを検索"
        hide-details
        prepend-inner-icon="search"
        single-line
        outlined
        @keyup.enter="onSubmitSearch"
      ></v-text-field>
      <v-btn class="ml-2" large color="primary" @click="onSubmitSearch">
        検索
      </v-btn>
      <nuxt-link to="/groups/search" class="ml-2 px-2 search-text">
        もっと詳しく
      </nuxt-link>
    </div>

    <v-list v-if="groups">
      <v-row>
        <v-col
          v-for="group in groups"
          :key="group.id"
          cols="12"
          xl="3"
          lg="3"
          md="3"
          sm="3"
        >
          <v-card class="mx-auto my-4" max-width="374" max-height="550">
            <nuxt-link :to="{ name: 'groups-id', params: { id: group.id } }">
              <v-img
                height="200"
                :src="
                  group.thumbnail ||
                    'https://data.ac-illust.com/data/thumbnails/e3/e3879bde102fa55e1b15630f564e7df1_w.jpeg'
                "
              ></v-img>
            </nuxt-link>
            <v-card-title class="pb-0">
              <nuxt-link :to="{ name: 'groups-id', params: { id: group.id } }">
                {{ group.name }}
              </nuxt-link>
            </v-card-title>

            <v-card-text class="pb-1">
              <v-chip-group v-if="group.tags" column>
                タグ:&nbsp;
                <v-chip
                  v-for="tag in group.tags.split(' ')"
                  :key="tag"
                  label
                  x-small
                >
                  {{ tag }}
                </v-chip>
              </v-chip-group>
              <div class="mb-4 grey--text text--lighten-1">
                {{ group.created_at }}結成
              </div>
              <div class="card-body-overflow" v-text="group.description"></div>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-list>
    <div v-else>
      グループが存在しません
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  data: () => ({
    searchQuery: '',
    groups: []
  }),

  computed: {
    ...mapGetters({
      shapedSearchParameters: 'groups/shapedSearchParameters'
    })
  },

  async asyncData({ $axios }) {
    const groups = await $axios.$get('/api/groups').then((res) => res.data)

    return {
      groups
    }
  },

  methods: {
    onSubmitSearch(e) {
      // 日本語変換でもkeydownが発火してしまうため処理で制御
      if (e.type !== 'click' && e.keyCode !== 13) return

      const parameters = { keywords: this.searchQuery }
      this.$store.commit('groups/setSearchParameters', { parameters })
      this.$router.push({
        path: '/groups',
        query: this.shapedSearchParameters
      })
    }
  }
}
</script>

<style scoped>
.search-text {
  font-weight: bold;
  font-size: 77%;
  text-decoration: none;
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
