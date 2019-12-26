<!-- 通知 -->
<template>
  <v-container>
    <v-row v-for="info in notification" :key="info.id">
      <v-col cols="12" class="link-box">
        <nuxt-link
          :to="{ name: 'notification-id', params: { id: info.id } }"
          class="link-title"
        >
          <span>
            <v-img class="img-small no-wrap" :src="info.thumbnail" />
            <p align="left" class="text-position">
              {{ info.by_name }}から{{ info.genre }}が届きました。
            </p>
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

<style lang="scss" scoped>
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
