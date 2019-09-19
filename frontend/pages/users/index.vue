<template>
  <div>
    <h1>ユーザー一覧</h1>

    <v-list v-if="users">
      <v-row>
        <v-col cols="6" xs="12" v-for="user in users" :key="user.id">
          <v-img
            :src="
              user.thumbnail ||
                'https://pbs.twimg.com/media/D5h_2fXX4AAVopV?format=jpg&name=medium'
            "
          ></v-img>
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
