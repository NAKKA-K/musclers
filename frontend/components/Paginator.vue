<template>
  <div>
    <v-pagination
      v-model="currentPage"
      :length="meta.total_pages"
      :total-visible="7"
      class="list-paginator"
    ></v-pagination>
  </div>
</template>

<script>
export default {
  props: {
    meta: {
      type: Object,
      required: true,
      default: null
    }
  },

  computed: {
    currentPage: {
      get() {
        return this.meta.current_page
      },
      set(val) {
        if (this.meta.current_page !== val) {
          this.$emit('click', val)
        }
      }
    }
  }
}
</script>

<style lang="scss">
.list-paginator {
  button.v-pagination__item--active {
    background-color: $main-color !important;
    border-color: $main-color !important;
  }
}
</style>
