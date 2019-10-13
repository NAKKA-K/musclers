export const state = () => ({
  searchParameters: {
    text: '',
    page: 1,
    seriousness: 0,
    gender: 0,
    figure: 0,
    ageBetween: { min: null, max: null },
    weightBetween: { min: null, max: null },
    heightBetween: { min: null, max: null }
  }
})

export const getters = {
  searchParameters: (state) => state.searchParameters
}

export const mutations = {
  setSearchParameters(state, { parameters }) {
    state.searchParameters = { ...state.searchParameters, ...parameters }
  }
}
