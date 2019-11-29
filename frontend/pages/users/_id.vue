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
          <!--
            TODO: 自慢の部位が登録できるようになった時に
                  画面をデザインして実装する
          -->
          <div v-swiper:mySwiper="swiperOption" class="swiper-container">
            <ul class="swiper-wrapper">
              <v-img
                class="sp-slide-image sp-swiper-slide"
                :src="user.thumbnail"
              ></v-img>
              <v-img
                class="sp-slide-image sp-swiper-slide"
                :src="user.thumbnail"
              ></v-img>
              <v-img
                class="sp-slide-image sp-swiper-slide"
                :src="user.thumbnail"
              ></v-img>
              <v-img
                class="sp-slide-image sp-swiper-slide"
                :src="user.thumbnail"
              ></v-img>
              <v-img
                class="sp-slide-image sp-swiper-slide"
                :src="user.thumbnail"
              ></v-img>
            </ul>
            <div class="outlined">
              <button class="sp-swiper-button-prev" type="button"></button>
              <button class="sp-swiper-button-next" type="button"></button>
            </div>
          </div>
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
@import '~/assets/css/pc_details.css';
@import '~/assets/css/sp_details.css';

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
