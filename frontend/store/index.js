export const state = () => ({
  isLoading: false,
  jonigroup: null,
  notification: null,
  recommendusers: null
})

export const getters = {
  joingroup: (state) => state.joingroup,
  notification: (state) => state.notification,
  recommendusers: (state) => state.recommendusers
}

export const mutations = {
  setIsLoading(state, isLoading) {
    state.isLoading = isLoading
  },
  setJoinGroup(state, {joingroup}) {
    state.JoinGroup = joingroup
  },
  setNotification(state, {notification}) {
    state.Notification = notification
  },
  setRecommenUsers(state, {recommendusers}) {
    state.RecommendUsers = recommendusers
  }
}

export const actions = {
  setJoinGroup({ commit }, { joingroup }) {
    commit('setJoinGroup',{ joingroup:'/api/groups' })
  },
  setNotification({ commit },{ notification }) {
    commit('setNotification',{ notification:'/api/notification' })
  },
  setRecommenUsers({ commit },{ recommendusers }) {
    commit('setRecommendUsers',{ recommendusers:'/api/recommendusers' })
  }
}
