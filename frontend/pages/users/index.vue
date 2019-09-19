<template>
  <div>
    <h1>ユーザー一覧</h1>

    <v-list v-if="users">
      <v-row>
        <v-col
          v-for="user in users"
          :key="user.id"
          cols="6"
          xl="3"
          lg="3"
          md="3"
          sm="3"
        >
          <div class="pa-4">
            <v-img
              :src="
                user.thumbnail ||
                  'https://data.ac-illust.com/data/thumbnails/e3/e3879bde102fa55e1b15630f564e7df1_w.jpeg'
              "
            ></v-img>
            <p class="text-center" v-text="user.nickname || 'No name'"></p>
          </div>
        </v-col>
      </v-row>
    </v-list>
    <div v-else>
      ユーザーが存在しません
    </div>
  </div>
</template>

<script>
export default {
  async asyncData({ $axios }) {
    const users = await $axios
      .$get('/api/users/search')
      .then((res) => res.data)
      .catch((err) => {
        if (err && err.response && err.response.data) {
          console.error('Reponse: ' + err.response.data.message)
        } else {
          console.error(err)
        }
        return null
      })

    return {
      users
    }
  }
}
</script>
