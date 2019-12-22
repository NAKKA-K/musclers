<template>
  <div>
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
            名前：{{ user.age }}歳&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 体型：{{
              user.figure
            }}
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
            <friend-request-btn
              block
              outlined
              class="friend-request-button"
              :user="user"
            ></friend-request-btn>
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
        <swiper ref="swiperTop" :options="swiperOptionTop" class="gallery-top">
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
            class="sp-slide-image swiper-slide"
            :src="user.thumbnail"
          ></v-img>
          <v-img
            class="sp-slide-image swiper-slide"
            :src="user.thumbnail"
          ></v-img>
          <v-img
            class="sp-slide-image swiper-slide"
            :src="user.thumbnail"
          ></v-img>
          <v-img
            class="sp-slide-image swiper-slide"
            :src="user.thumbnail"
          ></v-img>
          <v-img
            class="sp-slide-image swiper-slide"
            :src="user.thumbnail"
          ></v-img>
          <div slot="button-next" class="sp-swiper-button-next"></div>
          <div slot="button-prev" class="sp-swiper-button-prev"></div>
        </swiper>
      </v-tab-item>
    </v-tabs-items>
  </div>
</template>

<script>
import FriendRequestBtn from '~/components/organisms/FriendRequestBtn.vue'

export default {
  layout: 'index',
  components: {
    FriendRequestBtn
  },
  props: {
    user: Object
  },
  data() {
    return {
      tab: null,
      swiperOptionTop: {
        spaceBetween: 4,
        loop: true,
        loopedSlides: 4,
        navigation: {
          nextEl: '.sp-swiper-button-next',
          prevEl: '.sp-swiper-button-prev'
        }
      },
      swiperOptionThumbs: {
        spaceBetween: 4,
        slidesPerView: 4,
        touchRatio: 0.2,
        loop: true,
        loopedSlides: 4,
        navigation: {
          nextEl: '.sp-swiper-button-next',
          prevEl: '.sp-swiper-button-prev'
        },
        slideToClickedSlide: true
      },
      requestFriend: false,
      resultRequestType: null,
      resultRequestMessage: null
    }
  }
}
</script>
<style scoped>
@import '~/assets/css/sp_details.scss';
</style>
