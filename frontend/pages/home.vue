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
                  <v-col
                    v-for="group in groups.slice(0, 2)"
                    :key="group.id"
                    cols="6"
                  >
                    <nuxt-link
                      :to="{ name: 'groups-id', params: { id: group.id } }"
                    >
                      <v-img :src="group.thumbnail" class="img-size" />
                      <h4>{{ group.name }}</h4>
                    </nuxt-link>
                  </v-col>
                  <v-col cols="12">
                    <a @click="tab++">もっと見る</a>
                  </v-col>
                </v-row>
              </v-container>
              <h2 align="left">通知</h2>
              <v-container>
                <v-row v-for="info in infos.slice(0, 3)" :key="info.id">
                  <v-col cols="3">
                    <nuxt-link
                      :to="{ name: 'infos-id', params: { id: info.id } }"
                    >
                      <v-img
                        class="img-small"
                        :src="info.thumbnail"
                        alt="Avatar"
                        align="middle"
                      />
                    </nuxt-link>
                  </v-col>
                  <v-col cols="9">
                    <nuxt-link
                      :to="{ name: 'infos-id', params: { id: info.id } }"
                    >
                      <font size="3"
                        >{{ info.by_name }}から
                        {{ info.type }}が届きました。</font
                      >
                    </nuxt-link>
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
                    v-for="recommend in recommended.slice(0, 2)"
                    :key="recommend.id"
                    cols="6"
                  >
                    <nuxt-link
                      :to="{
                        name: 'recommended-id',
                        params: { id: recommend.id }
                      }"
                    >
                      <v-img :src="recommend.thumbnail" class="img-size" />
                      <h4>{{ recommend.nickname }}</h4>
                    </nuxt-link>
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
          <TheInformation :infos="infos" />
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
import TheInformation from './TheInformation.vue'
import TheRecommenduser from './TheRecommenduser.vue'
export default {
  middleware: 'auth',
  components: {
    TheJoingroup,
    TheRecommenduser,
    TheInformation
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
