<template>
  <div>
    <div class="d-flex">
      <h1>グループ一覧</h1>
      <v-spacer></v-spacer>
      <v-btn fab dark small color="#ffac12" to="/groups/new">
        <v-icon dark>mdi-plus</v-icon>
      </v-btn>
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
          <v-card
            class="mx-auto my-4"
            max-width="374"
            max-height="530"
            min-height="530"
          >
            <nuxt-link :to="{ name: 'groups-id', params: { id: group.id } }">
              <v-img
                height="300"
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
              <div class="black--text sub-info-text">
                タグ:&nbsp;
                <template v-for="tag in group.tags">
                  {{ tag.name + ' ' }}
                </template>
              </div>
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
export default {
  data: () => ({
    groups: []
  }),

  async asyncData({ $axios }) {
    const groups = await $axios.$get('/mock/api/groups').then((res) => res.data)

    return {
      groups
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
