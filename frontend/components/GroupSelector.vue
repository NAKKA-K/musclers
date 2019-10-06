<template>
  <v-select
    :class="klass"
    label="グループ"
    :items="items"
    item-text="text"
    item-value="id"
    clearable
    return-object
    @input="handleSelect"
  >
    <template slot="selection" slot-scope="data">
      <v-avatar size="25px">
        <v-icon v-text="data.item.icon"></v-icon>
      </v-avatar>
      <v-flex class="ml-1">
        {{ data.item.text }}
      </v-flex>
    </template>
    <template slot="item" slot-scope="data">
      <v-avatar size="25px" class="mr-2">
        <v-icon v-text="data.item.icon"></v-icon>
      </v-avatar>
      <v-list-item-content>
        <v-list-item-title v-text="data.item.text"></v-list-item-title>
      </v-list-item-content>
    </template>
  </v-select>
</template>

<script>
export default {
  props: {
    klass: {
      type: String,
      default: ''
    },
    items: {
      type: Array,
      required: true,
      default: null
    },
    handleSelect: {
      type: Function,
      default: null
    }
  }
}
</script>
