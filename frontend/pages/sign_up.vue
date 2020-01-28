<template>
  <div class="text-center ma-4">
    <v-card class="user-thumbnail mx-auto">
      <v-img
        v-if="currentUser.thumbnail"
        :src="currentUser.thumbnail"
        class="user-thumbnail"
      />
    </v-card>
    <h2 class="mb-12">
      {{ currentUser.nickname }}
    </h2>

    <div>
      <p>
        <v-btn class="warning large-button" x-large @click="clickProfileEdit">
          プロフィール編集
        </v-btn>
      </p>
      <p>
        <v-btn class="primary large-button" x-large @click="clickStart">
          始める
        </v-btn>
      </p>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  middleware: 'auth',

  computed: {
    ...mapGetters({ currentUser: 'authenticationauth/currentUser' })
  },

  methods: {
    clickProfileEdit() {
      this.$router.push('/auth/mypage')
    },
    clickStart() {
      this.$router.push('/home')
    }
  }
}
</script>

<style>
.user-thumbnail {
  max-width: 300px;
  max-height: 300px;
}

.large-button {
  width: 280px;
}
</style>
