<!-- 参加中のグループ -->
<template>
  <div align="center">
    <v-container>
      <v-row>
        <v-col
          v-for="group in groups"
          :key="group.id"
          class="link-box"
          cols="6"
        >
          <nuxt-link
            :to="{ name: 'groups-id', params: { id: group.id } }"
            class="link-title"
          >
            <v-img :src="group.thumbnail" class="img-size" />
            <p>{{ group.name }}</p>
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

<style lang="scss" scoped>
.img-size {
  width: 121px;
  height: 121px;
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
