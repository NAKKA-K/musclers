<template>
  <div id="app">
  <TheHeader/>
  <TheFooter/>
</div>
</template>
<script>
import TheHeader from './TheHeader.vue'
import TheFooter from './TheFooter.vue'

export default{
  name:'app',
  components:{
    TheHeader,
    TheFooter
  }
}
</script>