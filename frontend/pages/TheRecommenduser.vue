<!-- おすすめユーザー -->
<template>
  <div align="center">
    <v-container>
      <v-row>
        <v-col
          v-for="recommend in recommends"
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
    recommends: {
      type: Object,
      default: null
    }
  }
}
</script>
<style scoped>
.img-size {
  width: 121px;
  height: 121px;
  border-radius: 4px;
}
a:link {
  text-decoration: none;
  color: black;
}
.link-color:hover {
  background-color: #eeeeee;
  border-radius: 15px;
}
</style>
