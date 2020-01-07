<template>
  <div>
    <div class="d-flex align-center">
      <v-text-field
        v-model="searchQuery"
        label="ユーザー検索"
        placeholder="キーワードでユーザーを検索"
        hide-details
        single-line
        outlined
        class="search-placeholder"
        @keyup.enter="onSubmitSearch()"
      ></v-text-field>
      <primary-btn
        class="ml-2"
        large
        to="/groups/new"
        @click="onSubmitSearch()"
      >
        検索
      </primary-btn>
      <nuxt-link to="/search" class="ml-2 px-2 search-text">
        もっと詳しく
      </nuxt-link>
    </div>

    <div v-swiper:mySwiper="swiperOption" class="mt-4 swiper-container">
      <div class="swiper-wrapper">
        <div v-for="(blog, key) in recentBlogs" :key="key" class="swiper-slide">
          <v-img class="slide-image" :src="blog.thumbnail"></v-img>
          <div class="slide-box">
            <nuxt-link :to="`/user_blogs/${blog.id}`" class="undecoration-link">
              <p class="slide-box-title">
                {{ blog.title }}
              </p>
            </nuxt-link>
          </div>
        </div>
      </div>

      <div slot="button-prev" class="swiper-button-prev"></div>
      <div slot="button-next" class="swiper-button-next"></div>
    </div>
    <nuxt-link
      to="/user_blogs"
      class="d-inline-block search-text subtitle-1 mt-2"
    >
      ユーザーブログをもっと見る
      <v-icon>chevron_right</v-icon>
    </nuxt-link>

    <h2 class="mt-12 ml-0">新着グループ</h2>
    <v-row>
      <v-col v-for="group in groups" :key="group.id" cols="12" sm="6" lg="3">
        <v-card max-height="500">
          <nuxt-link :to="{ name: 'groups-id', params: { id: group.id } }">
            <v-img height="200" :src="group.thumbnail"></v-img>
          </nuxt-link>

          <v-card-title class="title pb-0">
            <nuxt-link
              :to="{ name: 'groups-id', params: { id: group.id } }"
              class="undecoration-link black--text font-weight-bold"
            >
              {{ group.name }}
            </nuxt-link>
          </v-card-title>

          <v-card-text>
            <v-chip-group v-if="group.tags" column>
              <v-chip
                v-for="tag in group.tags.split(' ')"
                :key="tag.id"
                label
                small
              >
                {{ tag }}
              </v-chip>
            </v-chip-group>
            <div class="mb-4 grey--text text--lighten-1">
              {{ group.created_at }}
            </div>
            <div
              class="card-body-overflow"
              v-text="group.description.slice(0, 100)"
            ></div>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <nuxt-link to="/groups" class="d-inline-block search-text subtitle-1">
      グループをもっと見る
      <v-icon class="blue--text">chevron_right</v-icon>
    </nuxt-link>

    <h2 class="mt-12 ml-0">タグ</h2>
    <v-row>
      <v-col
        v-for="tag in tags"
        :key="tag.id"
        cols="6"
        md="3"
        class="pa-2 cell-wrapper"
        :to="`/home?tag=${tag.name}`"
      >
        <nuxt-link :to="`/home?tag=${tag.name}`" class="undecoration-link">
          <span class="cell-body">
            {{ tag.name }}
          </span>
        </nuxt-link>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import PrimaryBtn from '~/components/atoms/PrimaryBtn.vue'

export default {
  components: {
    PrimaryBtn
  },

  data: () => ({
    searchQuery: '',
    blogs: [],
    groups: [],
    tags: [],
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
    const blogs = await $axios.$get('/api/blogs').then((res) => res.data)
    const tags = await $axios.$get('/api/tags').then((res) => res.data)
    const groups = await $axios
      .$get('/api/groups')
      .then((res) => res.data.slice(0, 4))

    return {
      blogs,
      tags,
      groups
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

<style lang="scss" scoped>
.search-placeholder {
  font-size: 85%;
}

.undecoration-link {
  text-decoration: none;
}

.search-text {
  font-weight: bold;
  font-size: 70%;
  text-decoration: none;
  color: $main-color-deep;

  > .v-icon {
    color: $main-color-deep !important;
  }
}

.cell-wrapper {
  width: 25%;
  width: -webkit-calc(25% - 10px);
  width: calc(25% - 10px);
  min-height: 80px;
}
.cell-body {
  width: 100%;
  height: 100%;
  padding: 10px;
  background: white;
  border: solid 2px #eaeaea;
  border-radius: 10px;
  font-weight: bold;
  font-size: 110%;
  color: black;

  display: flex;
  justify-content: center;
  align-items: center;
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
.slide-box .slide-box-title {
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
