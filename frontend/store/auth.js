export const state = () => ({
  currentUser: null,
  token: null
})

export const getters = {
  currentUser: (state) => state.currentUser,
  token: (state) => state.token
}

export const mutations = {
  setCurrentUser(state, { user }) {
    state.currentUser = user
  },
  setToken(state, { token }) {
    state.token = token
  }
}

export const actions = {
  setCurrentUser({ commit }, { user }) {
    commit('setCurrentUser', { user })
    commit('setToken', { token: user.access_token })
  },
  logout({ commit }) {
    commit('setCurrentUser', { user: null })
    commit('setToken', { token: null })
  }
}
