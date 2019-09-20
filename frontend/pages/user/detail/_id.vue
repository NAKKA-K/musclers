<template>
  <v-container fluid fill-height>
    <v-layout justify-center>
      <v-flex xs12 sm6 md6>
        <v-card height="70vh" class="user-card" outlined raised>
          <v-list>
            <v-list-item class="justify-center">
              <v-list-item-avatar size="280">
                <v-img :src="thumbnail"></v-img>
              </v-list-item-avatar>
            </v-list-item>
            <v-list-item-content class="headline  text-center">
              <v-list-item-title class="title">{{ name }}</v-list-item-title>
              <v-list-item-subtitle
                >{{ description }}</v-list-item-subtitle
              >
            </v-list-item-content>
          </v-list>
          <v-tabs v-model="tab" fixed-tabs background-color="#FEBA00">
            <v-tab>
              基本情報
            </v-tab>
            <v-tab>
              自慢の部位
            </v-tab>
          </v-tabs>
          <v-tabs-items v-model="tab">
            <v-tab-item>
              <v-list>
                <v-list-item
                  v-for="(item, index) in items"
                  :key="index"
                  two-line
                >
                  <v-list-item-content>
                    <v-list-item-title>{{ item.title }}</v-list-item-title>
                    <v-list-item-subtitle>{{
                      item.value
                    }}</v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-tab-item>
            <v-tab-item>
              <!--
                TODO: 自慢の部位が登録できるようになった時に
                      画面をデザインして実装する
              -->
            </v-tab-item>
          </v-tabs-items>
        </v-card>
        <div class="move-items">
          <nuxt-link to="/" class="move-icon">
            <v-icon color="#FEBA00" x-large>arrow_back_ios</v-icon>
          </nuxt-link>
          <nuxt-link to="/" class="move-icon">
            <v-icon color="#FEBA00" x-large>arrow_forward_ios</v-icon>
          </nuxt-link>
        </div>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      tab: null,
      // TODO:新規登録機能が完成するまではダミーデータを表示させておく
      //     完成すればvalueにAPIレスポンスデータを当てはめる
      name: 'YAMADA TARO',
      description: '筋友を探しています',
      thumbnail: 'https://cdn.vuetifyjs.com/images/john.png',
      items: [
        { title: '年齢', value: '22' },
        { title: '性別', value: '女性' },
        { title: '身長', value: '175' },
        { title: '体重', value: '65' },
        { title: '体型', value: '普通型' },
        { title: '筋肉量', value: '28.6' },
        { title: '体脂肪率', value: '12' },
        { title: '本気度', value: 'ガチ' }
      ]
    }
  },
  async asyncData({ params, $axios, error }) {
    const USER_DETAIL_API_URL = `/api/users/${params.id}`
    console.log(params.id)
    try {
      const response = await $axios.$get(USER_DETAIL_API_URL, {
        headers: {
          'Content-Type': 'application/json'
        }
      })
      console.log(response.status)
      const statusCode = response.status
      if (statusCode === 200) {
        return {
          statusCode,
          userDetailData: response.data
        }
      } else if (statusCode === 404) {
        return {
          statusCode,
          errMsg: response.errors[0].message
        }
      } else {
        error({ statusCode, message: response.message })
      }
    } catch (err) {
      console.log(err)
    }
  }
}
</script>

<style scoped>
.user-card {
  overflow-y: auto;
}
.move-items {
  text-align: center;
  margin-top: 3%;
}
div .move-icon {
  text-decoration: none;
  padding: 15px;
}
</style>
