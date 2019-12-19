<template>
  <div>
    <div class="group-page-header">
      <h1>グループ一覧</h1>
      <v-spacer></v-spacer>
      <v-btn class="group-create-btn" to="/groups/new" nuxt>
        <v-icon dark>mdi-plus</v-icon>
        グループ作成
      </v-btn>
    </div>

    <div class="group-search-form mt-12">
      <v-text-field
        slot="activator"
        v-model="searchQuery"
        label="グループ検索"
        placeholder="キーワードでグループを検索"
        class="search-box"
        hide-details
        single-line
        outlined
        @keyup.enter="onSubmitSearch"
      >
        <v-icon slot="prepend-inner" class="search-icon">
          search
        </v-icon>
      </v-text-field>
      <v-btn outlined class="ml-2 search-btn" large @click="onSubmitSearch">
        検索
      </v-btn>
      <nuxt-link to="/groups/search" class="ml-2 px-2 search-text" nuxt>
        もっと詳しく
      </nuxt-link>
    </div>

    <v-list v-if="groups" class="mt-6">
      <v-row>
        <v-col
          v-for="group in groups"
          :key="group.id"
          class="mb-2"
          cols="12"
          xl="3"
          lg="3"
          md="3"
          sm="3"
        >
          <nuxt-link
            :to="{ name: 'groups-id', params: { id: group.id } }"
            class="_no-decoration"
          >
            <v-hover v-slot:default="{ hover }">
              <v-card class="group-card" :elevation="hover ? 4 : 2">
                <v-img
                  alt="サムネイル"
                  class="group-image"
                  :src="
                    group.thumbnail ||
                      'https://data.ac-illust.com/data/thumbnails/e3/e3879bde102fa55e1b15630f564e7df1_w.jpeg'
                  "
                ></v-img>
                <v-card-title class="pb-0 group-name">
                  {{ group.name }}
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
                  <div
                    class="card-body-overflow"
                    v-text="group.description"
                  ></div>
                </v-card-text>
              </v-card>
            </v-hover>
          </nuxt-link>
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

<style lang="scss" scoped>
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

.group-page-header {
  display: flex;

  > .v-btn.v-btn--contained.group-create-btn {
    background-color: $main-color-deep;
    color: white;
  }
}

.group-search-form {
  display: flex;
  align-items: center;

  > .v-input--is-focused.search-box {
    color: $main-color-deep !important;
    caret-color: $main-color-deep !important;
  }

  > .search-btn {
    color: $main-color-deep !important;
  }

  > .search-text {
    font-weight: bold;
    font-size: 77%;
    text-decoration: none;
    color: $main-color-deep;
  }
}

.group-card {
  max-width: 374px;
  max-height: 550px;

  > .group-image {
    height: 200px;
  }
}
.group-card:hover {
  > .group-name {
    color: $main-color;
  }
}
</style>
