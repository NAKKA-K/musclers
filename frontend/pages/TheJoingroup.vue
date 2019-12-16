<!-- 参加中のグループ -->
<template>
  <div align="center">
    <v-container>
      <v-row>
        <v-col
          v-for="group in groups"
          :key="group.id"
          class="link-color"
          cols="6"
        >
          <nuxt-link :to="{ name: 'groups-id', params: { id: group.id } }">
            <v-img :src="group.thumbnail" class="img-size" />
            <h4>{{ group.name }}</h4>
          </nuxt-link>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>
<script>
export default {
  props: {
    groups: {
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
}
</style>
