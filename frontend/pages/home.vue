<template>
  <div>
    <div class="d-flex align-center">
      <v-text-field
        v-model="searchQuery"
        label="ユーザー検索"
        placeholder="キーワードでユーザーを検索"
        hide-details
        prepend-inner-icon="search"
        single-line
        outlined
        @keyup.enter="onSubmitSearch()"
      ></v-text-field>
      <v-btn class="ml-2" large color="primary" @click="onSubmitSearch()">
        検索
      </v-btn>
      <nuxt-link to="/search" class="ml-2 px-2 search-text">
        もっと詳しく
      </nuxt-link>
    </div>

    <div v-swiper:mySwiper="swiperOption" class="mt-4 swiper-container">
      <div class="swiper-wrapper">
        <div v-for="(blog, key) in recentBlogs" :key="key" class="swiper-slide">
          <v-img class="slide-image" :src="blog.thumbnail"></v-img>
          <div class="slide-box">
            <p class="slide-box-title">
              {{ blog.title }}
            </p>
          </div>
        </div>
      </div>

      <div slot="button-prev" class="swiper-button-prev"></div>
      <div slot="button-next" class="swiper-button-next"></div>
    </div>

    <h2>新着グループ</h2>

    <h2>タグ</h2>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  data: () => ({
    searchQuery: '',
    blogs: [],
    swiperOption: {
      slidesPerView: 'auto',
      spaceBetween: 0,
      loopedSlides: 4,
      loop: true,
      backgroundUrl: '~/assets/images/next.png',
      autoplay: {
        delay: 2500,
        disableOnInteraction: false
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev'
      }
    }
  }),

  computed: {
    recentBlogs() {
      return this.blogs.slice(0, 5)
    },
    ...mapGetters({
      shapedSearchParameters: 'users/shapedSearchParameters'
    })
  },

  async asyncData({ $axios }) {
    const blogs = await $axios.$get('/mock/api/blogs').then((res) => res.data)

    return {
      blogs
    }
  },

  methods: {
    onSubmitSearch() {
      const parameters = { keywords: this.searchQuery }
      this.$store.commit('users/setSearchParameters', { parameters })
      this.$router.push({
        path: '/users',
        query: this.shapedSearchParameters
      })
    }
  }
}
</script>

<style scoped>
.search-text {
  font-weight: bold;
  font-size: 77%;
  text-decoration: none;
}

.slide-box {
  position: absolute;
  display: block;
  bottom: 0;
  width: 100%;
  background: linear-gradient(to top, #000 0%, rgba(0, 0, 0, 0.2) 100%);
  padding: 16px;
  box-sizing: border-box;
}
.slide-box > .slide-box-title {
  color: white;
  width: 100%;
}

.swiper-container {
  width: 100%;
}
.swiper-slide {
  position: relative;
  text-align: center;
  background-color: #eee;
  display: flex;
  justify-content: center;
  align-items: center;
}
.swiper-button-prev,
.swiper-button-next {
  width: 27px;
  height: 44px;
  background-size: 27px 44px;
  background-position: center;
  background-repeat: no-repeat;
}
.swiper-button-prev {
  background-image: url('~@/assets/images/prev.png');
  background-size: 100px 100px;
}
.swiper-button-next {
  background-image: url('~@/assets/images/next.png');
  background-size: 100px 100px;
}
.slide-image {
  width: 375px;
  height: 232px;
}
</style>
