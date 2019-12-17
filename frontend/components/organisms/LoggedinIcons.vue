<template>
  <div>
    <v-menu offset-y>
      <template v-slot:activator="{ on }">
        <v-btn icon v-on="on">
          <v-badge color="red" overlap class="badge-position">
            <v-icon color="black">notifications</v-icon>
            <template v-slot:badge>
              <span>1</span>
            </template>
          </v-badge>
        </v-btn>
      </template>
      <v-card>
        <h4 class="font-weight-thin title-position">通知</h4>
        <div v-for="i in informations" :key="i.id">
          <span class="font-weight-thin">
            <v-avatar class="img-small">
              <v-img
                src="https://icon-library.net/images/icon-muscle/icon-muscle-29.jpg"
              />
            </v-avatar>
            {{ i.by_name }}から{{ i.genre }}が届きました。
          </span>
          <p class="text-right">{{ i.created_at }}</p>
          <v-divider inset></v-divider>
        </div>
        <h5 class="foot-position font-weight-thin text-center">
          通知一覧を見る
        </h5>
      </v-card>
    </v-menu>

    <v-menu offset-y>
      <template v-slot:activator="{ on }">
        <v-btn icon v-on="on">
          <v-avatar v-if="currentUser.thumbnail">
            <img :src="currentUser.thumbnail" />
          </v-avatar>
          <v-icon v-else>person</v-icon>
        </v-btn>
      </template>

      <v-list>
        <v-list-item v-for="(item, i) in items" :key="i" :to="item.link">
          <v-avatar size="25px" class="mr-2">
            <v-icon v-text="item.icon"></v-icon>
          </v-avatar>
          <v-list-item-content>
            <v-list-item-title v-text="item.title"></v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item key="logout" @click="logout">
          <v-avatar size="25px" class="mr-2">
            <v-icon>assignment_return</v-icon>
          </v-avatar>
          <v-list-item-content>
            <v-list-item-title>ログアウト</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-menu>
  </div>
</template>

<script>
export default {
  props: {
    currentUser: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      items: [
        { link: '/auth/mypage', icon: 'account_circle', title: 'マイページ' },
        { link: '/direct_messages', icon: 'message', title: 'DM一覧' },
        { link: '/search', icon: 'search', title: '検索' },
        { link: '/auth/setting', icon: 'build', title: '設定' }
      ],
      informations: []
    }
  },
  async mounted() {
    this.informations = await this.$axios
      .$get('/api/user/information')
      .then((res) => res.data)
    console.log(this.informations)
  },
  methods: {
    logout() {
      if (this.currentUser.provider === 'facebook') {
        this.$auth.logout()
      } else {
        this.$store.dispatch('auth/setDebugLoggedIn', { flag: false })
      }
      this.$store.dispatch('auth/logout')
      this.$router.push('/')
    }
  }
}
</script>

<style scoped>
.badge-position {
  margin: 0px 10px 0px 0px;
  vertical-align: middle;
}
.text-position {
  margin: 5px 0px;
}
.img-small {
  width: 30px;
  height: 30px;
}
.card-size {
  width: 150%;
  height: 150%;
}
.title-position {
  background-color: #ededed;
  margin-bottom: 5px;
}
.foot-position {
  background-color: #ededed;
  margin-top: 5px;
}
</style>
