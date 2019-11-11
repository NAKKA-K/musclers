<template>
  <div>
    <h1>{{ $route.params.id }}さんとのDM</h1>
  </div>
</template>

<script>
export default {
  validate({ params }) {
    return /^\d+$/.test(params.id)
  }
}
</script>
