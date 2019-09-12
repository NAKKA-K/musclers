<template>
  <v-container fluid fill-height>
    <v-layout justify-center>
      <v-flex xs12 sm6 md6>
        <div v-if="status_code !== 200">
          <p>{{ err_msg }}</p>
        </div>
        <div v-else>
          <v-card>
            <v-img src="https://cdn.vuetifyjs.com/images/john.png"></v-img>
            <v-card-text>
              <div class="title text--primary">
                年齢：{{ user_detail_data.age }}
              </div>
              <div class="title text--primary">
                性別：{{ user_detail_data.gender }}
              </div>
              <div class="title text--primary">
                身長：{{ user_detail_data.height }}
              </div>
              <div class="title text--primary">
                体重：{{ user_detail_data.weight }}
              </div>
              <div class="title text--primary">
                体型：{{ user_detail_data.figure }}
              </div>
              <div class="title text--primary">
                筋肉量：
              </div>
              <div class="title text--primary">体脂肪率：</div>
              <div class="title text--primary">
                本気度：{{ user_detail_data.seriousness }}
              </div>
            </v-card-text>
          </v-card>
        </div>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  components: {},
  async asyncData({ params, $axios }) {
    const USER_DETAIL_API_URL = `http://localhost:8080/api/users/${params.id}`
    const response = await $axios.get(USER_DETAIL_API_URL, {
      headers: {
        'Content-Type': 'application/json'
      }
    })
    const StatusCode = response.data.code
    if (StatusCode === 200) {
      return {
        status_code: StatusCode,
        user_detail_data: response.data.data
      }
    } else {
      return {
        status_code: StatusCode,
        err_msg: response.data.errors[0].message
      }
    }
  }
}
</script>
