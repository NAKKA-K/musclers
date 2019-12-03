<template>
  <div>
    <v-toolbar flat :color="'#ffac12'">
      <v-toolbar-title>
        <nuxt-link v-if="currentUser" to="/auth/mypage" class="header-title">
          Muscler's
        </nuxt-link>
        <nuxt-link v-else to="/" class="header-title">Muscler's</nuxt-link>
      </v-toolbar-title>
      <v-toolbar-items>
        <dropdown-home-links></dropdown-home-links>
      </v-toolbar-items>

      <v-col class="col-5 col-xs-4">
        <v-text-field
          v-model="searchQuery"
          label="ユーザー検索"
          hide-details
          prepend-icon="search"
          single-line
          @keyup.enter="onSubmitSearch()"
        />
      </v-col>

      <div class="hidden-xs-only">
        <group-selector
          klass="group-selector"
          :items="group"
          :handle-select="handleSelectGroup"
        />
      </div>

      <v-spacer></v-spacer>

      <the-right-side-or-the-header></the-right-side-or-the-header>
    </v-toolbar>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import GroupSelector from '../components/GroupSelector.vue'
import TheRightSideOrTheHeader from '~/components/organisms/TheRightSideOrTheHeader.vue'
import DropdownHomeLinks from '~/components/organisms/DropdownHomeLinks.vue'

export default {
  components: {
    GroupSelector,
    TheRightSideOrTheHeader,
    DropdownHomeLinks
  },

  data: () => ({
    group: [
      { id: 1, icon: 'search', text: 'グループ検索', value: 'search' },
      { id: 2, icon: 'add', text: 'グループ作成', value: 'create' },
      { id: 3, icon: 'ballot', text: 'グループ一覧', value: 'list' },
      { id: 4, icon: 'group', text: '参加グループ', value: 'joined' }
    ],
    searchQuery: ''
  }),

  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser',
      shapedSearchParameters: 'users/shapedSearchParameters'
    })
  },

  methods: {
    handleSelectGroup(groupObj) {
      if (!groupObj) {
        return
      }

      switch (groupObj.value) {
        case 'search':
          this.$router.push('/groups/search')
          break
        case 'create':
          this.$router.push('/groups/new')
          break
        case 'list':
          this.$router.push('/groups')
          break
        case 'joined':
          this.$router.push('/groups/joined')
          break
      }
    },
    onSubmitSearch() {
      const parameters = { keywords: this.searchQuery }
      this.$store.commit('users/setSearchParameters', { parameters })
      this.$router.push({
        path: '/users',
        query: this.shapedSearchParameters
      })
    }
  }
}
</script>

<style>
.header-title {
  margin-right: 0.8em;
  color: black !important;
  font-weight: bold;
  text-decoration: none;
}

.group-selector {
  max-width: 12em;
  margin-bottom: -22px;
}
</style>
