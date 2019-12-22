<template>
  <div>
    <div
      :style="{ 'background-image': 'url(' + user.thumbnail + ')' }"
      class="user-information"
    >
      <v-col cols="3" offset-md="1">
        <div class="container bg-rgba">
          <h2>{{ user.nickname }}</h2>
          <p>{{ user.description }}</p>
          <friend-request-btn :user="user" class="mt-10"></friend-request-btn>
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
      swiperOption: {
        slidesPerView: 'auto',
        spaceBetween: 50,
        loop: true,
        loopedSlides: 5,
        backgroundUrl: '~/assets/images/next.png',
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
        }
      },
      requestFriend: false,
      resultRequestType: null,
      resultRequestMessage: null
    }
  }
}
</script>
<style scoped>
@import '~/assets/css/pc_details.css';
</style>
