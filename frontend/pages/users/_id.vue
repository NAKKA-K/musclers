<template>
  <div>
    <div class="pc">
      <PcDetails />
    </div>
    <div class="sp">
      <SpDetails />
    </div>
  </div>
</template>

<script>
import SpDetails from '~/components/SpDetails.vue'
import PcDetails from '~/components/PcDetails.vue'

export default {
  layout: 'index',
  components: {
    SpDetails,
    PcDetails
  }
}
</script>

<style scoped>
@import '~/assets/css/pc_details.css';
@import '~/assets/css/sp_details.scss';

.pc {
  display: block !important;
}
.sp {
  display: none !important;
}
@media only screen and (max-width: 750px) {
  .pc {
    display: none !important;
  }
  .sp {
    display: block !important;
  }
}
</style>
