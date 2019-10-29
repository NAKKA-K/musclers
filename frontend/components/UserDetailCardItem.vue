<template>
  <v-list-item two-line>
    <v-list-item-content>
      <v-list-item-title>
        {{ item.title }}
      </v-list-item-title>
      <v-list-item-subtitle>
        {{ item.value || item.default }}
      </v-list-item-subtitle>
    </v-list-item-content>
  </v-list-item>
</template>

<script>
export default {
  props: {
    item: {
      type: Object,
      required: true
    }
  }
}
</script>
