<template>
  <div>
    <div class="pc">
      <PcView :user="user" />
    </div>
    <div class="sp">
      <SpView :user="user" />
    </div>
  </div>
</template>

<script>
import PcView from '~/layouts/user_details/PcView.vue'
import SpView from '~/layouts/user_details/SpView.vue'

export default {
  layout: 'index',
  components: {
    PcView,
    SpView
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
