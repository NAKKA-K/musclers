<!-- おすすめユーザー -->
<template>
  <div align="center">
    <v-container>
      <v-row>
        <v-col
          v-for="recommend in recommended"
          :key="recommend.id"
          class="link-color"
          cols="6"
        >
          <nuxt-link :to="{ name: 'users-id', params: { id: recommend.id } }">
            <v-img :src="recommend.thumbnail" class="img-size" />
            <h4>{{ recommend.nickname }}</h4>
          </nuxt-link>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>
<script>
export default {
  props: {
    recommended: {
      type: Object,
      default: null
    }
  }
}
</script>
<style>
.img-small {
  width: 60px;
  height: 60px;
  border-radius: 50%;
}
</style>
