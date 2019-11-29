<!-- おすすめユーザー -->
<template>
  <div align="center">
    <v-container>
      <v-row>
        <v-col v-for="recommend in recommended" :key="recommend.id" cols="6">
          <v-img :src="recommend.thumbnail" class="img-size" />
          <h4>{{ recommend.nickname }}</h4>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>
<script>
export default {
  props: ['recommended']
}
</script>
<style>
.img-small {
  width: 60px;
  height: 60px;
  border-radius: 50%;
}
</style>
