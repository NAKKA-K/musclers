<template>
  <v-btn
    outlined
    :x-small="xsmall"
    :small="small"
    :large="large"
    :x-large="xlarge"
    class="primary-outline-btn"
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
    }
  }
}
</script>

<style lang="scss" scoped>
.primary-outline-btn {
  color: $main-color-deep;
  caret-color: $main-color-deep;
}
</style>
