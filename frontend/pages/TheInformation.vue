<!-- 通知 -->
<template>
  <v-container>
    <v-row v-for="info in infos" :key="info.id">
      <v-col cols="3">
        <nuxt-link :to="{ name: 'infos-id', params: { id: info.id } }">
          <v-img
            class="img-small"
            :src="info.thumbnail"
            alt="Avatar"
            align="middle"
          />
        </nuxt-link>
      </v-col>
      <v-col cols="9">
        <nuxt-link :to="{ name: 'infos-id', params: { id: info.id } }">
          <font size="3">
            {{ info.by_name }}から {{ info.type }}が届きました。</font
          >
        </nuxt-link>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
export default {
  props: {
    infos: {
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
