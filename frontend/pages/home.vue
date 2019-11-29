<template>
  <div>
    <v-card>
      <v-tabs
        v-model="tab"
        centered
        background-color="white"
        color="deep-purple accent-4"
        right
      >
        <v-tab v-for="item in items" :key="item">{{ item }}</v-tab>
        <v-tab-item>
          <div>
            <h2>参加中のグループ</h2>
            <div align="center">
              <v-container>
                <v-row>
                  <v-col v-for="group in groups" :key="group.id" cols="6">
                    <nuxt-link
                      v-if="group.id <= 2"
                      :to="{ name: 'groups-id', params: { id: group.id } }"
                    >
                      <v-img :src="group.thumbnail" class="img-size" />
                    </nuxt-link>
                    <h4 v-if="group.id <= 2">{{ group.name }}</h4>
                  </v-col>
                  <v-col cols="12">
                    <a @click="tab++">もっと見る</a>
                  </v-col>
                </v-row>
              </v-container>
              <h2 align="left">通知</h2>
              <v-container>
                <v-row v-for="info in infos" :key="info.id">
                  <v-col v-if="info.id <= 2" cols="3">
                    <v-img
                      class="img-small"
                      :src="info.thumbnail"
                      alt="Avatar"
                      align="middle"
                    />
                  </v-col>
                  <v-col v-if="info.id <= 2" cols="9">
                    <font size="3"
                      >{{ info.by_name }}から{{ info.type }}が届きました。</font
                    >
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="12">
                    <a @click="tab += 2">もっと見る</a>
                  </v-col>
                </v-row>
              </v-container>
            </div>
            <h2>おすすめユーザー</h2>
            <div align="center">
              <v-container>
                <v-row>
                  <v-col
                    v-for="recommend in recommended"
                    :key="recommend.id"
                    cols="6"
                  >
                    <v-img
                      v-if="recommend.id <= 2"
                      :src="recommend.thumbnail"
                      class="img-size"
                    />
                    <h4 v-if="recommend.id <= 2">{{ recommend.nickname }}</h4>
                  </v-col>
                  <v-col cols="12">
                    <a @click="tab += 3">もっと見る</a>
                  </v-col>
                </v-row>
              </v-container>
            </div>
          </div>
        </v-tab-item>
        <v-tab-item>
          <TheJoingroup :joingroup="groups" />
        </v-tab-item>
        <v-tab-item>
          <TheNotification :infos="infos" />
        </v-tab-item>
        <v-tab-item>
          <TheRecommenduser :recommended="recommended" />
        </v-tab-item>
      </v-tabs>
    </v-card>
  </div>
</template>
<script>
import TheJoingroup from './TheJoingroup.vue'
import TheRecommenduser from './TheRecommenduser.vue'
import TheNotification from './TheNotification.vue'
export default {
  middleware: 'auth',
  components: {
    TheJoingroup,
    TheRecommenduser,
    TheNotification
  },
  data() {
    return {
      tab: null,
      items: ['トップ', '参加中のグループ', '通知', 'おすすめユーザー']
    }
  },
  async asyncData({ $axios, store }) {
    const groups = await $axios.$get('/mock/api/groups').then((res) => res.data)
    const recommended = await $axios
      .$get(`/api/users/recommended_users`)
      .then((res) => res.data)
    const infos = await $axios
      .$get(`/mock/api/user/information`)
      .then((res) => res.data)
    return {
      groups,
      recommended,
      infos
    }
  }
}
</script>
<style>
h2 {
  margin-left: 20px;
}
.img-small {
  width: 60px;
  height: 60px;
  border-radius: 50%;
}
.img-size {
  width: 121px;
  height: 121px;
  border-radius: 50%;
}
</style>
