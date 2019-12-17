<!-- 通知 -->
<template>
  <v-container>
    <v-row v-for="info in notification" :key="info.id">
      <v-col cols="12" class="link-color">
        <nuxt-link :to="{ name: 'notification-id', params: { id: info.id } }">
          <span>
            <v-img class="img-small no-wrap" :src="info.thumbnail" />
            <h4 align="left" class="text-position">
              {{ info.by_name }}から{{ info.genre }}が届きました。
            </h4>
          </span>
        </nuxt-link>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
export default {
  props: {
    notification: {
      type: Object,
      default: null
    }
  }
}
</script>
<style scoped>
.img-small {
  width: 60px;
  height: 60px;
  border-radius: 50%;
}
.no-wrap {
  float: left;
}
.text-position {
  margin-left: 80px;
  margin-top: 20px;
  color: black;
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
