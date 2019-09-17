<template>
  <v-container fluid fill-height>
    <v-layout justify-center>
      <v-flex xs12 sm6 md6>
        <div v-if="status_code !== 200">
          <p>{{ err_msg }}</p>
        </div>
        <div v-else>
          <v-card>
            <v-img
              height="20vh"
              src="https://cdn.vuetifyjs.com/images/john.png"
            ></v-img>
            <v-list-item>
              <v-list-item-content>
                <v-list-item-title class="headline"
                  >Our Changing Planet</v-list-item-title
                >
                <v-list-item-subtitle>by Kurt Wagner</v-list-item-subtitle>
              </v-list-item-content>
            </v-list-item>
            <v-card-title>YYAMADA TARO</v-card-title>
            <v-card-text class="detail-content">
              <ol>
                <li v-if="user_detail_data.age" class="title text--primary">
                  年齢：{{ user_detail_data.age }}
                </li>
                <li v-else class="title text--primary">
                  年齢：未設定
                </li>
                <li v-if="user_detail_data.gender" class="title text--primary">
                  性別：{{ user_detail_data.gender }}
                </li>
                <li v-else class="title text--primary">
                  性別：未設定
                </li>
                <li v-if="user_detail_data.height" class="title text--primary">
                  身長：{{ user_detail_data.height }}
                </li>
                <li v-else class="title text--primary">
                  身長：未設定
                </li>
                <li v-if="user_detail_data.weight" class="title text--primary">
                  体重：{{ user_detail_data.weight }}
                </li>
                <li v-else class="title text--primary">
                  体重：未設定
                </li>
                <li v-if="user_detail_data.figure" class="title text--primary">
                  体型：{{ user_detail_data.figure }}
                </li>
                <li v-else class="title text--primary">
                  体型：未設定
                </li>
                <!--
                TODO: 筋肉量と体脂肪率の項目は
                ユーザ詳細APIのレスポンスに筋肉量と体脂肪率のデータが含まれてから処理を書く
              -->
                <li class="title text--primary">
                  筋肉量：未設定
                </li>
                <li class="title text--primary">体脂肪率：未設定</li>
                <li
                  v-if="user_detail_data.seriousness"
                  class="title text--primary"
                >
                  本気度：{{ user_detail_data.seriousness }}
                </li>
                <li v-else class="title text--primary">
                  本気度：未設定
                </li>
              </ol>
            </v-card-text>
          </v-card>
        </div>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  async asyncData({ params, $axios, redirect }) {
    const USER_DETAIL_API_URL = `http://api:8080/api/users/${params.id}`
    try {
      const response = await $axios.$get(USER_DETAIL_API_URL, {
        headers: {
          'Content-Type': 'application/json'
        }
      })
      console.log(response.status)
      const StatusCode = response.status
      if (StatusCode === 200) {
        return {
          status_code: StatusCode,
          user_detail_data: response.data
        }
      } else if (StatusCode === 404) {
        return {
          status_code: StatusCode,
          err_msg: response.errors[0].message
        }
      } else {
        return redirect('/')
      }
    } catch (err) {
      console.log(err)
      return redirect('/')
    }
  }
}
</script>
