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
  background-image: url('~/assets/images/prev.001.jpeg');
  margin-left: 40%;
}
.swiper-button-next {
  background-image: url('~/assets/images/next.001.jpeg');
  margin-right: 40%;
}
.slide-image {
  width: 220px;
  height: 200px;
  border-radius: 10px;
}
</style>
