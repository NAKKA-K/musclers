<template>
  <div id="app">
  <Theheader/>
  <Thefooter/>
</div>
</template>
<script>
import Theheader from './header.vue'
import Thefooter from './footer.vue'

export default{
  name:'app',
  components:{
    Theheader,
    Thefooter
  }
}
</script>