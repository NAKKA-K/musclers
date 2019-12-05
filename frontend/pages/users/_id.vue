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
            <v-col cols="5" class="standard-information">
              <v-row>
                <v-col cols="5">
                  <p>年齢： {{ user.age }}</p>
                </v-col>
                <v-col cols="5">
                  <p>本気度： {{ user.seriousness }}</p>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="5">
                  <p>身長： {{ user.height }}</p>
                </v-col>
                <v-col cols="5">
                  <p>体型： {{ user.figure }}</p>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="5">
                  <p>性別： {{ user.gender }}</p>
                </v-col>
                <v-col cols="5">
                  <p>筋肉量： {{ user.muscle_mass }}</p>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="5">
                  <p>体重： {{ user.wight }}</p>
                </v-col>
                <v-col cols="5">
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
            <v-row>
              <h2>{{ user.nickname }}</h2>
              <v-layout class="justify-end mr-3">
                <div v-if="user.seriousness === '未設定'">
                  <v-icon color="red">star</v-icon>
                  <v-icon>star</v-icon>
                  <v-icon>star</v-icon>
                </div>
                <div v-else-if="user.seriousness === 'エンジョイ'">
                  <v-icon color="red">star</v-icon>
                  <v-icon color="red">star</v-icon>
                  <v-icon>star</v-icon>
                </div>
                <div v-else-if="user.seriousness === 'ガチ'">
                  <v-icon color="red">star</v-icon>
                  <v-icon color="red">star</v-icon>
                  <v-icon color="red">star</v-icon>
                </div>
              </v-layout>
            </v-row>
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
              <v-img class="sp-user-image" :src="user.thumbnail"></v-img>
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
          <v-col cols="12" class="sp-standard-information">
            <v-row>
              <v-col cols="5">
                年齢：
              </v-col>
              <v-col cols="7"> {{ user.age }}歳 </v-col>
              <v-col cols="5">
                身長：
              </v-col>
              <v-col cols="7"> {{ user.height }}cm </v-col>
              <v-col cols="5">
                性別：
              </v-col>
              <v-col cols="7">
                {{ user.gender }}
              </v-col>
              <v-col cols="5">
                体重：
              </v-col>
              <v-col cols="7"> {{ user.wight }}kg </v-col>
              <v-col cols="5">
                本気度：
              </v-col>
              <v-col cols="7">
                <v-row>
                  {{ user.seriousness }}&nbsp;
                  <div v-if="user.seriousness === '未設定'">
                    <v-icon color="red">star</v-icon>
                    <v-icon>star</v-icon>
                    <v-icon>star</v-icon>
                  </div>
                  <div v-else-if="user.seriousness === 'エンジョイ'">
                    <v-icon color="red">star</v-icon>
                    <v-icon color="red">star</v-icon>
                    <v-icon>star</v-icon>
                  </div>
                  <div v-else-if="user.seriousness === 'ガチ'">
                    <v-icon color="red">star</v-icon>
                    <v-icon color="red">star</v-icon>
                    <v-icon color="red">star</v-icon>
                  </div>
                </v-row>
              </v-col>
              <v-col cols="5">
                体型：
              </v-col>
              <v-col cols="7">
                {{ user.figure }}
              </v-col>
              <v-col cols="5">
                筋肉量：
              </v-col>
              <v-col cols="7">
                {{ user.muscle_mass }}
              </v-col>
              <v-col cols="5">
                体脂肪率：
              </v-col>
              <v-col cols="7">
                {{ user.body_fat_percentage }}
              </v-col>
            </v-row>
          </v-col>
        </v-tab-item>
        <v-tab-item>
          <!-- swiper1 -->
          <swiper
            ref="swiperTop"
            :options="swiperOptionTop"
            class="gallery-top"
          >
            <v-img
              class="swiper-slide sp-slide-big-image"
              :src="user.thumbnail"
            ></v-img>
            <v-img
              class="swiper-slide sp-slide-big-image"
              :src="user.thumbnail"
            ></v-img>
            <v-img
              class="swiper-slide sp-slide-big-image"
              :src="user.thumbnail"
            ></v-img>
            <v-img
              class="swiper-slide sp-slide-big-image"
              :src="user.thumbnail"
            ></v-img>
            <v-img
              class="swiper-slide sp-slide-big-image"
              :src="user.thumbnail"
            ></v-img>
          </swiper>
          <!-- swiper2 Thumbs -->
          <swiper
            ref="swiperThumbs"
            :options="swiperOptionThumbs"
            class="gallery-thumbs"
          >
            <v-img
              class="swiper-slide sp-slide-image"
              :src="user.thumbnail"
            ></v-img>
            <v-img
              class="swiper-slide sp-slide-image"
              :src="user.thumbnail"
            ></v-img>
            <v-img
              class="swiper-slide sp-slide-image"
              :src="user.thumbnail"
            ></v-img>
            <v-img
              class="swiper-slide sp-slide-image"
              :src="user.thumbnail"
            ></v-img>
            <v-img
              class="swiper-slide sp-slide-image"
              :src="user.thumbnail"
            ></v-img>
            <div slot="button-next" class="swiper-button-next"></div>
            <div slot="button-prev" class="swiper-button-prev"></div>
          </swiper>
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
      },
      swiperOptionTop: {
        spaceBetween: 10,
        loop: true,
        loopedSlides: 4,
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
        }
      },
      swiperOptionThumbs: {
        spaceBetween: 10,
        slidesPerView: 4,
        touchRatio: 0.2,
        loop: true,
        loopedSlides: 4,
        slideToClickedSlide: true
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
@import '~/assets/css/pc_details.css';
/* @import '~/assets/css/sp_details.css'; */

/* sp site css */
.sp-user-information {
  height: 86vh;
  background-size: cover;
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
.sp-user-image {
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
.sp-standard-information {
  margin-left: 30px;
  font-size: 1.2em;
}
.friend-request-button {
  margin-bottom: 36px;
  text-align: center;
}

/* swiper */
.sp-swiper-container {
  margin-top: 30px;
  width: 90%;
  height: 400px;
}
.sp-swiper-slide {
  text-align: center;
  background-color: #eee;
  display: flex;
  justify-content: center;
  align-items: center;
}

.sp-slide-big-image {
  margin-right: 10px;
  border-radius: 10px;
}
.sp-slide-image {
  width: 100px;
  height: 50px;
  margin-right: 10px;
  border-radius: 10px;
}
.sp-swiper-button-prev,
.sp-swiper-button-next {
  position: absolute;
  bottom: 10px;
  width: 27px;
  height: 44px;
  background-size: 27px 44px;
  background-position: center;
  background-repeat: no-repeat;
}
.sp-swiper-button-prev {
  background-image: url('~@/assets/images/prev.png');
  margin-left: 30%;
  background-size: 70px 70px;
}
.sp-swiper-button-next {
  background-image: url('~@/assets/images/next.png');
  margin-left: 60%;
  background-size: 70px 70px;
}

.swiper-slide {
  background-size: cover;
  background-position: center;
}
.gallery-top {
  width: 90%;
  border-radius: 10px;
}
.gallery-thumbs {
  box-sizing: border-box;
  width: 90%;
  padding: 10px 0;
  height: 100px;
}
.gallery-thumbs .swiper-slide {
  width: 25%;
  height: 100%;
  opacity: 0.4;
}
.gallery-thumbs .swiper-slide-active {
  opacity: 1;
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
