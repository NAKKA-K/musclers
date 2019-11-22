<template>
  <div>
    <div class="pc">
      <div
        :style="{ 'background-image': 'url(' + user.thumbnail + ')' }"
        class="user-information"
      >
        <v-col cols="3" offset-md="1">
          <div class="container bg-rgba">
            <h2>{{ user.nickname }}</h2>
            <p>{{ user.description }}</p>
            <v-btn to="" class="mt-10" outlined color="blue lighten-1">
              友達申請をする
            </v-btn>
          </div>
        </v-col>
      </div>
      <div class="services-wrapper">
        <div class="container">
          <div class="md-12">
            <h3>情報</h3>
          </div>
          <v-row>
            <v-col cols="4" offset-md="1">
              <v-img class="profile-image" :src="user.thumbnail"></v-img>
            </v-col>
            <v-col cols="7" class="standard-information">
              <v-row>
                <v-col cols="4">
                  <p>年齢： {{ user.age }}</p>
                </v-col>
                <v-col cols="4">
                  <p>本気度： {{ user.seriousness }}</p>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="4">
                  <p>身長： {{ user.height }}</p>
                </v-col>
                <v-col cols="4">
                  <p>体型： {{ user.figure }}</p>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="4">
                  <p>性別： {{ user.gender }}</p>
                </v-col>
                <v-col cols="4">
                  <p>筋肉量： {{ user.muscle_mass }}</p>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="4">
                  <p>体重： {{ user.wight }}</p>
                </v-col>
                <v-col cols="4">
                  <p>体脂肪率： {{ user.body_fat_percentage }}</p>
                </v-col>
              </v-row>
            </v-col>
          </v-row>
        </div>
      </div>
      <div v-swiper:mySwiper="swiperOption" class="swiper-container">
        <ul class="swiper-wrapper">
          <v-img class="slide-image swiper-slide" :src="user.thumbnail"></v-img>
          <v-img class="slide-image swiper-slide" :src="user.thumbnail"></v-img>
          <v-img class="slide-image swiper-slide" :src="user.thumbnail"></v-img>
          <v-img class="slide-image swiper-slide" :src="user.thumbnail"></v-img>
          <v-img class="slide-image swiper-slide" :src="user.thumbnail"></v-img>
        </ul>
        <div class="outlined">
          <button class="swiper-button-prev" type="button"></button>
          <button class="swiper-button-next" type="button"></button>
        </div>
      </div>
    </div>
    <div class="sp">
      <div
        :style="{ 'background-image': 'url(' + user.thumbnail + ')' }"
        class="sp-user-information"
      >
        <v-col cols="3" offset-md="1">
          <div class="container sp-bg-rgba">
            <h2>{{ user.nickname }}</h2>
            <p>
              名前：{{ user.age }}歳&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              体型：{{ user.figure }}
            </p>
          </div>
        </v-col>
      </div>
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
          <div class="sp-services-wrapper">
            <div class="container">
              <v-img class="sp-slide-image" :src="user.thumbnail"></v-img>
              <h2>{{ user.nickname }}</h2>
              <v-btn
                block
                outlined
                class="friend-request-button"
                color="blue lighten-1"
              >
                友達申請をする
              </v-btn>
              <p>{{ user.description }}</p>
            </div>
          </div>
          <v-col cols="12" class="standard-information">
            <v-row>
              <v-col cols="6">
                年齢：
              </v-col>
              <v-col cols="6">
                {{ user.age }}
              </v-col>
              <v-col cols="6">
                本気度：
              </v-col>
              <v-col cols="6">
                {{ user.seriousness }}
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="6">
                身長：
              </v-col>
              <v-col cols="6">
                {{ user.height }}
              </v-col>
              <v-col cols="6">
                体型：
              </v-col>
              <v-col cols="6">
                {{ user.figure }}
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="6">
                性別：
              </v-col>
              <v-col cols="6">
                {{ user.gender }}
              </v-col>
              <v-col cols="6">
                筋肉量：
              </v-col>
              <v-col cols="6">
                {{ user.muscle_mass }}
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="6">
                体重：
              </v-col>
              <v-col cols="6">
                {{ user.wight }}
              </v-col>
              <v-col cols="6">
                体脂肪率：
              </v-col>
              <v-col cols="6">
                {{ user.body_fat_percentage }}
              </v-col>
            </v-row>
          </v-col>
        </v-tab-item>
        <v-tab-item>
          <!--
            TODO: 自慢の部位が登録できるようになった時に
                  画面をデザインして実装する
          -->
        </v-tab-item>
      </v-tabs-items>
    </div>
  </div>
</template>

<script>
export default {
  layout: 'index',
  data() {
    return {
      tab: null,
      swiperOption: {
        slidesPerView: 'auto',
        centeredSlides: true,
        spaceBetween: 50,
        loop: true,
        backgroundUrl: '~/assets/images/next.png',
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
        }
      }
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
.profile-image {
  width: 280px;
  height: 280px;
  border-radius: 10px;
}
/* sp site css */
.sp-user-information {
  height: 90vh;
  background-size: cover;
  font-size: 1.2em;
  text-align: center;
  position: relative;
  font-size: 16px;
  text-align: left;
}
.sp-user-information h2 {
  font-size: 22px;
  font-weight: 100;
}
.sp-bg-rgba {
  height: 80px;
  background-color: rgba(255, 255, 255, 0.8);
  position: absolute;
  left: 0;
  bottom: 0;
}
.sp-slide-image {
  width: 350px;
  height: 200px;
  border-radius: 10px;
}
.sp-services-wrapper {
  padding-top: 10px;
}
.sp-services-wrapper h2 {
  font-size: 22px;
  font-weight: 10;
  margin-top: 16px;
  margin-bottom: 16px;
}
.sp-services-wrapper p {
  margin-bottom: 40px;
}
.sp-services-wrapper .user-info {
  text-align: left;
  font-size: 1.2em;
}
.friend-request-button {
  margin-bottom: 16px;
  text-align: center;
}
/* pc site css */
.user-information {
  padding: 100px 0 100px 0;
  height: 90vh;
  background-size: cover;
  font-size: 1.2em;
  text-align: center;
}
.user-information h2 {
  font-size: 22px;
  font-weight: 100;
  margin-top: 16px;
}
.user-information p {
  font-size: 12px;
  text-align: left;
  margin-top: 16px;
}

.standard-information {
  text-align: left;
  font-size: 1.2em;
}
.bg-rgba {
  background-color: rgba(255, 255, 255, 0.8);
  border-radius: 10px;
}

.swiper-container {
  margin-top: 30px;
  width: 70%;
  height: 400px;
}
.my-swiper {
  height: 300px;
  width: 100%;
}
.swiper-slide {
  text-align: center;
  background-color: #eee;
  display: flex;
  justify-content: center;
  align-items: center;
}
.swiper-pagination-bullet {
  background-color: red;
}
.swiper-button-prev,
.swiper-button-next {
  position: absolute;
  top: 70%;
  width: 27px;
  height: 44px;
  background-size: 27px 44px;
  background-position: center;
  background-repeat: no-repeat;
}
.swiper-button-prev {
  background-image: url('~@/assets/images/prev.png');
  margin-left: 40%;
  background-size: 100px 100px;
}
.swiper-button-next {
  background-image: url('~@/assets/images/next.png');
  margin-right: 40%;
  background-size: 100px 100px;
}
.slide-image {
  width: 220px;
  height: 200px;
  border-radius: 10px;
}
.pc {
  display: block !important;
}
.sp {
  display: none !important;
}
@media only screen and (max-width: 750px) {
  .pc {
    display: none !important;
  }
  .sp {
    display: block !important;
  }
}
</style>
