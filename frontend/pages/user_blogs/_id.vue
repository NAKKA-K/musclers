<template>
  <div>
    <v-btn to="/user_blogs" class="mb-4" text small>戻る</v-btn>
    <p class="grey--text text--lighten-1">{{ blog.created_at }}作成</p>
    <h1 class="mb-4">{{ blog.title }}</h1>

    <template v-for="tag in blog.tags">
      <v-btn :key="tag.id" color="darkgray" class="mr-2 mb-1" depressed small>
        {{ tag.name }}
      </v-btn>
    </template>

    <p class="mt-12 mx-6 blog-body">
      {{ blog.body }}
    </p>
  </div>
</template>

<script>
export default {
  validate({ params }) {
    return /^\d+$/.test(params.id)
  },

  data: () => ({
    blog: null
  }),

  async asyncData({ $axios, params }) {
    const blog = await $axios
      .$get(`/api/blogs/${params.id}`)
      .then((res) => res.data)

    return {
      blog
    }
  }
}
</script>

<style>
.theme--light.v-btn--active::before {
  opacity: 0;
}

.blog-body {
  white-space: pre-wrap;
  word-wrap: break-word;
}
</style>
