<!-- 参加中のグループ -->
<template>
  <div align="center">
    <v-container>
      <v-row>
        <v-col v-for="group in joingroup" :key="group.id" cols="6">
          <v-img :src="group.thumbnail" class="img-size" />
          <h4>{{ group.name }}</h4>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>
<script>
export default {
  props: ['joingroup']
}
</script>
<style>
.img-size {
  width: 121px;
  height: 121px;
  border-radius: 50%;
}
</style>
