<template>
  <div>
    <div
      :style="{ 'background-image': 'url(' + user.thumbnail + ')' }"
      class="top-wrapper"
    >
      <div class="container">
        <h1>筋肉を今よりも素敵に。</h1>
        <p>筋肉大好き人間が集まるマッチングアプリです。</p>
        <p>他人が投稿した筋肉を見たり、筋トレをしましょう。</p>
        <div class="register-wrapper mt-5">
          <v-btn to="/auth/login" class="register-btn" color="#FFAC12" nuxt>
            Musclersを始める
          </v-btn>
        </div>
      </div>
    </div>
    <div class="services-wrapper">
      <div class="container">
        <div class="service-heading">
          <h2>Musclersには様々な仕組みがあります</h2>
        </div>
        <div class="services">
          <div class="service-box">
            <div class="service-icon">
              <v-icon color="#FEBA00" size="90">emoji_people</v-icon>
              <p>マッチング</p>
            </div>
            <p class="service-text">
              様々な筋肉と出会うことが出来ます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon color="#FEBA00" size="90">person_add</v-icon>
              <p>友達申請</p>
            </div>
            <p class="service-text">
              気になる人と繋がりを作ることができます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon color="#FEBA00" size="90">message</v-icon>
              <p>メッセージ</p>
            </div>
            <p class="service-text">
              友達になった人とやり取りすることが出来ます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon color="#FEBA00" size="90">search</v-icon>
              <p>検索</p>
            </div>
            <p class="service-text">
              自分好みの筋肉を詳細に検索できます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon color="#FEBA00" size="90">group</v-icon>
              <p>グループ</p>
            </div>
            <p class="service-text">
              グループを作成し、話し合うことが出来ます。
            </p>
          </div>
          <div class="service-box">
            <div class="service-icon">
              <v-icon color="#FEBA00" size="90">fitness_center</v-icon>
              <p>筋肉</p>
            </div>
            <p class="service-text">
              Musclersを用いて筋肉ライフを充実させましょう。
            </p>
          </div>
          <div class="clear-float-left" />
        </div>
      </div>
    </div>
    <div class="register-wrapper">
      <div class="container">
        <v-btn to="/auth/login" class="register-btn" color="#FFAC12" dark nuxt>
          Muscler'sを始める
        </v-btn>
      </div>
    </div>
  </div>
  <!--
  <v-container>
    <v-img :src="user.thumbnail" class="head-img"></v-img>
    <v-layout justify-center> </v-layout>
  </v-container>
  -->
</template>

<script>
// import UserDetailCardItem from '../../components/UserDetailCardItem.vue'

export default {
  layout: 'index',

  data() {
    return {
      tab: null
    }
  },
  async asyncData({ $axios, params, error }) {
    const response = await $axios
      .get(`/api/users/${params.id}`)
      .catch((err) => {
        console.log(err)
        console.log(err.response)
        return err.response
      })

    if (!response) {
      throw new Error('ネットワークに接続できませんでした')
      // TODO: もう少し何とかする。toastとか出す?
    } else if (response.status !== 200) {
      error({ status: response.status, message: response.data.message })
      return
    }

    return {
      user: response.data.data
    }
  }
}
</script>

<style scoped>
@import '@/assets/css/user_details.css';

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

.title-space {
  margin-left: 10%;
  width: 80%;
}

.user-description {
  font-size: 0.875rem;
}
.top-wrapper {
  padding: 100px 0 100px 0;
  height: 90vh;
  background-size: cover;
  color: white;
  font-size: 1.2em;
  text-shadow: 0px 0px 5px #000;
}
</style>
