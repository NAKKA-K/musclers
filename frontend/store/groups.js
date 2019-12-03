const defaultState = {
  searchParameters: {
    keywords: null,
    page: null
  }
}

export const state = () => defaultState

const arrayToObject = (obj, arr) => {
  obj[arr[0]] = arr[1]
  return obj
}

export const getters = {
  searchParameters: (state) => state.searchParameters,
  shapedSearchParameters: (state) => {
    // 設定されたパラメータだけを抽出
    return Object.entries(state.searchParameters)
      .filter(([key, val]) => {
        return val !== null && val !== ''
      })
      .reduce(arrayToObject, {})
  }
}

export const mutations = {
  setSearchParameters(state, { parameters }) {
    state.searchParameters = { ...defaultState.searchParameters, ...parameters }
  },
  addSearchParameters(state, { parameters }) {
    state.searchParameters = { ...state.searchParameters, ...parameters }
  },
  setFilteredSearchParameters(state, { queries }) {
    const filteredQueries = Object.entries(queries)
      .filter(([key, val]) => {
        return state.searchParameters.hasOwnProperty(key)
      })
      .reduce(arrayToObject, {})
    state.searchParameters = { ...state.searchParameters, ...filteredQueries }
  }
}
