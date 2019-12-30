<template>
  <div>
    <div class="top-wrapper">
      <div class="container">
        <h1>筋肉を今よりも素敵に。</h1>
        <p>
          このページでは筋トレについてのブログが掲載しています。
          1人で、グループで、記事読みながら頑張りましょう！
        </p>
      </div>
    </div>

    <v-container>
      <v-row>
        <v-col v-for="blog in blogs" :key="blog.id" cols="12">
          <v-card :to="`/user_blogs/${blog.id}`">
            <div class="d-flex flex-no-wrap">
              <v-avatar class="ma-3" size="70" tile>
                <v-img :src="blog.thumbnail"></v-img>
              </v-avatar>

              <div>
                <v-card-text class="pb-0">
                  {{ blog.created_at }}
                </v-card-text>
                <v-card-title class="headline pt-0">
                  {{ blog.title }}
                </v-card-title>
                <v-card-text>
                  {{ makeShortBody(blog.body) }}
                </v-card-text>

                <v-card-text>
                  <template v-for="tag in blog.tags">
                    <v-btn
                      :key="tag.id"
                      color="darkgray"
                      class="mr-2 mb-1"
                      depressed
                      small
                    >
                      {{ tag.name }}
                    </v-btn>
                  </template>
                </v-card-text>
              </div>
            </div>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  layout: 'index',

  data: () => ({
    blogs: null
  }),

  async asyncData({ $axios }) {
    const blogs = await $axios.$get('/api/blogs').then((res) => res.data)

    return {
      blogs
    }
  },

  methods: {
    makeShortBody(body) {
      return body.slice(0, 80)
    }
  }
}
</script>

<style lang="scss" scoped>
.headline {
  line-height: 1.3rem;
  font-size: 20px !important;
  font-weight: 700;
}

.top-wrapper {
  padding: 100px 0 100px 0;
  background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)),
    url('https://publicdomainq.net/images/201707/17s/publicdomainq-0011229ofc.jpg');
  background-size: cover;
  color: white;
  font-size: 1.2em;
  text-shadow: 0px 0px 5px #000;

  h1 {
    opacity: 0.9;
    letter-spacing: 5px;
  }
  p {
    opacity: 0.9;
  }
  @include smart-vertical {
    font-size: 1em;
    h1 {
      font-size: 24px;
    }
  }
}
</style>
