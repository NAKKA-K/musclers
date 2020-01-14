<template>
  <div>
    <v-card>
      <v-tabs
        v-model="tab"
        centered
        background-color="white"
        color="#f48009"
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
                    v-for="group in limitedGroups"
                    :key="group.id"
                    cols="6"
                    xs="3"
                    sm="3"
                    class="link-box"
                  >
                    <nuxt-link
                      :to="{ name: 'groups-id', params: { id: group.id } }"
                      class="link-title"
                    >
                      <v-img :src="group.thumbnail" class="img-size"></v-img>
                      <p>{{ group.name }}</p>
                    </nuxt-link>
                  </v-col>
                  <v-col cols="12">
                    <a class="more-link" @click="tab++">もっと見る</a>
                  </v-col>
                </v-row>
              </v-container>
            </div>

            <h2 align="left">通知</h2>
            <div align="center">
              <v-container>
                <v-row v-for="info in limitedInformation" :key="info.id">
                  <v-col cols="12" class="link-box">
                    <nuxt-link
                      :to="{ name: 'notification-id', params: { id: info.id } }"
                      class="link-title"
                    >
                      <v-img
                        class="img-small no-wrap"
                        :src="info.thumbnail"
                      ></v-img>
                      <p align="left" class="text-position">
                        {{ info.by_name }}から{{ info.genre }}が届きました。
                      </p>
                    </nuxt-link>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="12">
                    <a class="more-link" @click="tab += 2">もっと見る</a>
                  </v-col>
                </v-row>
              </v-container>
            </div>

            <h2>おすすめユーザー</h2>
            <div align="center">
              <v-container>
                <v-row>
                  <v-col
                    v-for="recommend in limitedRecommendusers"
                    :key="recommend.id"
                    cols="6"
                    xs="3"
                    sm="3"
                    class="link-box"
                  >
                    <nuxt-link
                      :to="{ name: 'users-id', params: { id: recommend.id } }"
                      class="link-title"
                    >
                      <v-img
                        :src="recommend.thumbnail"
                        class="img-size"
                      ></v-img>
                      <p>{{ recommend.nickname || 'No name' }}</p>
                    </nuxt-link>
                  </v-col>
                  <v-col cols="12">
                    <a class="more-link" @click="tab += 3">もっと見る</a>
                  </v-col>
                </v-row>
              </v-container>
            </div>
          </div>
        </v-tab-item>
        <v-tab-item>
          <TheJoingroup :groups="groups" />
        </v-tab-item>
        <v-tab-item>
          <TheInformation :notification="notification" />
        </v-tab-item>
        <v-tab-item>
          <TheRecommenduser :recommends="recommends" />
        </v-tab-item>
      </v-tabs>
    </v-card>
  </div>
</template>
<script>
import TheJoingroup from '~/pages/TheJoingroup.vue'
import TheInformation from '~/pages/TheInformation.vue'
import TheRecommenduser from '~/pages/TheRecommenduser.vue'

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
  computed: {
    limitedGroups() {
      return this.groups.slice(0, 4)
    },
    limitedInformation() {
      return this.notification.slice(0, 3)
    },
    limitedRecommendusers() {
      return this.recommends.slice(0, 4)
    }
  },
  async asyncData({ $axios, store }) {
    const groups = await $axios.$get('/api/groups').then((res) => res.data)
    const recommends = await $axios
      .$get(`/api/users/recommended_users`)
      .then((res) => res.data)
    const notification = await $axios
      .$get(`/api/user/information`)
      .then((res) => res.data)
    return {
      groups,
      recommends,
      notification
    }
  }
}
</script>

<style lang="scss" scoped>
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
  border-radius: 4px;
}
.link-box {
  &:hover {
    background-color: #eeeeee;
    border-radius: 15px;
  }

  .link-title {
    @extend ._no-decoration;
    color: black;

    &:hover {
      @extend ._text-hover;
    }
  }
}
.more-link {
  color: $main-color-deep;
  font-weight: bold;
}

.no-wrap {
  float: left;
}
.text-position {
  margin-left: 80px;
  margin-top: 20px;
}
</style>
