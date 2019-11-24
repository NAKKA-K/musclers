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
                  <v-col cols="6">
                    <v-img
                      src="https://diamond.jp/mwimgs/c/2/600/img_c256d0b5bc611ba415623c0428dffe262112487.jpg"
                      class="img-size"
                      alt="Avatar"
                    />
                    <h4>最戸 たける</h4>
                  </v-col>
                  <v-col cols="6">
                    <v-img
                      src="https://gaishishukatsu.com/wp-content/uploads/2018/07/muscle.jpg"
                      class="img-size"
                      alt="Avatar"
                    />
                    <h4>内田 真智雄</h4>
                  </v-col>
                  <v-col cols="6">
                    <v-img
                      src="https://watch-monster.com/system/item_getties/images/000/205/406/medium/4380bf06-a23d-4a70-9dd1-2f4bbde0302a.jpg?1537371756"
                      class="img-size"
                      alt="Avatar"
                    />
                    <h4>朝田 和樹</h4>
                  </v-col>
                  <v-col cols="6">
                    <v-img
                      src="http://cache.img.gmo.jp/gmobb/april2014/main_massuru.png"
                      class="img-size"
                      alt="Avatar"
                    />
                    <h4>呉屋 省吾</h4>
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
          <TheJoingroup />
        </v-tab-item>
        <v-tab-item>
          <TheNotification />
        </v-tab-item>
        <v-tab-item>
          <TheRecommenduser />
        </v-tab-item>
      </v-tabs>
    </v-card>
  </div>
</template>
<script>
// import { mapGetters } from 'vuex'
import TheJoingroup from './TheJoingroup.vue'
import TheNotification from './TheNotification.vue'
import TheRecommenduser from './TheRecommenduser.vue'
export default {
  middleware: 'auth',
  components: {
    TheJoingroup,
    TheNotification,
    TheRecommenduser
  },
  data() {
    return {
      tab: null,
      items: ['トップ', '参加中のグループ', '通知', 'おすすめユーザー']
    }
  },
  async asyncData({ $axios }) {
    const groups = await $axios.$get(`/mock/api/groups`)

    return {
      groups
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
