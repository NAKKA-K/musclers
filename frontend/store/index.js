export const state = () => ({
  joinGroup: [],
  notification: [],
  recommendUser: [],
  isLoading: false
})

export const getters = {
  joinGroup: (state) => state.joinGroup,
  notification: (state) => state.notification,
  recommendUser: (state) => state.recommendUser
}

export const mutations = {
  setjoinGroup(state, { joinGroup }) {
    state.joinGroup = joinGroup
  },
  setnotification(state, { notification }) {
    state.notification = notification
  },
  setrecommendUser(state, { recommendUser }) {
    state.recommendUser = recommendUser
  },
  setIsLoading(state, isLoading) {
    state.isLoading = isLoading
  }
}

export const actions = {
  setjoinGroup({ commit }, { joinGroup }) {
    commit('setjoinGroup', { joinGroup })
    joinGroup = this.$axios.$get('/api/group')
  },
  setnotification({ commit }, { notification }) {
    commit('setnotification', { notification })
    notification = this.$axios.$get('/api/notification')
  },
  setrecommendUser({ commit }, { recommendUser }) {
    commit('setrecommendUser', { recommendUser })
    recommendUser = this.$axios.$get('/api/recommendUser')
  }
}
