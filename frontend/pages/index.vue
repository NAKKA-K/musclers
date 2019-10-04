<template>
  <div>
    <h1>index page</h1>
    <p>{{ $auth.$state }}</p>
    <p>{{ $auth.$state.currentUser }}</p>
    <p>{{ $auth.$state.strategy }}</p>
  </div>
</template>

<script>
export default {}
</script>
