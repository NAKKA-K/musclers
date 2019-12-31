<template>
  <v-btn
    :x-small="xsmall"
    :small="small"
    :large="large"
    :x-large="xlarge"
    :to="to ? to : null"
    :nuxt="to ? true : false"
    :type="type"
    class="primary-btn"
    @click="(e) => $emit('click', e)"
  >
    <slot></slot>
  </v-btn>
</template>

<script>
export default {
  props: {
    xsmall: {
      type: Boolean,
      required: false,
      default: false
    },
    small: {
      type: Boolean,
      required: false,
      default: false
    },
    large: {
      type: Boolean,
      required: false,
      default: false
    },
    xlarge: {
      type: Boolean,
      required: false,
      default: false
    },
    to: {
      type: String,
      required: false,
      default: null
    },
    type: {
      type: String,
      required: false,
      default: 'button'
    }
  }
}
</script>

<style lang="scss" scoped>
.theme--light.v-btn:not(.v-btn--flat):not(.v-btn--text):not(.v-btn--outlined).primary-btn {
  background-color: $main-color-deep;
  color: white;
}
</style>
