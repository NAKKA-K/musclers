export const state = () => ({
  // user relation
  user_name: null, // user name
  user_token: null, // user token
  user_image_url: null, // user image
  login_status: false, // user status flag
  isLoading: false
})

export const mutations = {
  login(state, payload) {
    /*
    state.user_name = payload.user_name
    state.user_token = payload.user_token
    state.user_id = payload.user_id
    state.user_image_url = payload.user_image_url
    state.login_status = true
    */
  },
  logout(state) {
    state.user = null
    state.user_token = null
    state.status = false
  },
  setIsLoading(state, isLoading) {
    state.isLoading = isLoading
  }
}

export const getters = {
  isSignedIn(state) {
    return state.status
  }
}

export const actions = {}
