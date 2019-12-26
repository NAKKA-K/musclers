<!-- おすすめユーザー -->
<template>
  <div align="center">
    <v-container>
      <v-row>
        <v-col
          v-for="recommend in recommends"
          :key="recommend.id"
          class="link-box"
          cols="6"
        >
          <nuxt-link
            :to="{ name: 'users-id', params: { id: recommend.id } }"
            class="link-title"
          >
            <v-img :src="recommend.thumbnail" class="img-size" />
            <p>{{ recommend.nickname || 'No name' }}</p>
          </nuxt-link>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>
<script>
export default {
  props: {
    recommends: {
      type: Object,
      default: null
    }
  }
}
</script>
<style lang="scss" scoped>
.img-size {
  width: 121px;
  height: 121px;
  border-radius: 4px;
}
.link-box {
  &:hover {
    background-color: #eeeeee;
    border-radius: 15px;
  }

  .link-title {
    @extend ._no-decoration;
    color: black;

    &:hover {
      @extend ._text-hover;
    }
  }
}
</style>
