<template>
  <div>
    <v-card>
      <v-tabs
        v-model="tab"
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
                      :to="{ name: 'groups-id', params: { id: group.id } }"
                    >
                      <v-img :src="group.thumbnail" class="img-size" />
                    </nuxt-link>
                    <h4>{{ group.name }}</h4>
                    <joingroup />
                  </v-col>
                  <v-col cols="12">
                    <a @click="tab++">もっと見る</a>
                  </v-col>
                </v-row>
              </v-container>
              <h2 align="left">通知</h2>
              <v-container>
                <v-row>
                  <v-col cols="12">
                    <p>
                      <img
                        class="img-small"
                        src="http://cache.img.gmo.jp/gmobb/april2014/main_massuru.png"
                        alt="Avatar"
                        align="middle"
                      />
                      <font size="2"
                        >呉屋省吾さんからメッセージが届きました。</font
                      >
                    </p>
                  </v-col>
                  <v-col cols="12">
                    <p>
                      <img
                        class="img-small"
                        src="http://cache.img.gmo.jp/gmobb/april2014/main_massuru.png"
                        alt="Avatar"
                        align="middle"
                      />
                      <font size="2"
                        >呉屋省吾さんからメッセージが届きました。</font
                      >
                    </p>
                  </v-col>
                  <v-col cols="12">
                    <p>
                      <img
                        class="img-small"
                        src="http://cache.img.gmo.jp/gmobb/april2014/main_massuru.png"
                        alt="Avatar"
                        align="middle"
                      />
                      <font size="2"
                        >呉屋省吾さんからメッセージが届きました。</font
                      >
                    </p>
                  </v-col>
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
                    <v-img :src="recommend.thumbnail" class="img-size" />
                    <h4>{{ recommend.nickname }}</h4>
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
          <div align="center">
            <v-container>
              <v-row>
                <v-col v-for="group in groups" :key="group.id" cols="6">
                  <nuxt-link
                    :to="{ name: 'groups-id', params: { id: group.id } }"
                  >
                    <v-img :src="group.thumbnail" class="img-size" />
                  </nuxt-link>
                  <h4>{{ group.name }}</h4>
                </v-col>
              </v-row>
            </v-container>
          </div>
        </v-tab-item>
        <v-tab-item>
          <TheNotification />
        </v-tab-item>
        <v-tab-item>
          <div align="center">
            <v-container>
              <v-row>
                <v-col
                  v-for="recommend in recommended"
                  :key="recommend.id"
                  cols="6"
                >
                  <v-img :src="recommend.thumbnail" class="img-size" />
                  <h4>{{ recommend.nickname }}</h4>
                </v-col>
              </v-row>
            </v-container>
          </div>
        </v-tab-item>
      </v-tabs>
    </v-card>
  </div>
</template>
<script>
import TheNotification from './TheNotification.vue'
export default {
  middleware: 'auth',
  components: {
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
    return {
      groups,
      recommended
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
