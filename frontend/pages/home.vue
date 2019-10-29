<template>
  <div>
    <v-card>
      <v-tabs background-color="white" color="deep-purple accent-4" right>
        <v-tab>参加しているグループ</v-tab>
        <v-tab>通知</v-tab>
        <v-tab>おすすめユーザー</v-tab>
        <v-tab>自分のプロフィール</v-tab>

        <v-tab-item>
          <TheJoingroup />
        </v-tab-item>
        <v-tab-item>
          <TheNotification />
        </v-tab-item>
        <v-tab-item>
          <TheRecommenduser />
        </v-tab-item>
      </v-tabs>
    </v-card>
  </div>
</template>
<script>
import TheJoingroup from './TheJoingroup.vue'
import TheNotification from './TheNotification.vue'
import TheRecommenduser from './TheRecommenduser.vue'
export default {
  middleware: 'auth',
  name: 'App',
  components: {
    TheJoingroup,
    TheNotification,
    TheRecommenduser
  }
}
</script>
<style>
.img-size {
  width: 121px;
  height: 121px;
  border-radius: 50%;
}
</style>
