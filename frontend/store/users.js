export const state = () => ({
  searchParameters: {
    keywords: null,
    page: null,
    seriousness: null,
    gender: null,
    figure: null,
    ageMin: null,
    ageMax: null,
    weightMin: null,
    weightMax: null,
    heightMin: null,
    heightMax: null
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
