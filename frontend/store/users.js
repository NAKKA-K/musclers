const defaultState = {
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
}

export const state = () => defaultState

export const getters = {
  searchParameters: (state) => state.searchParameters,
  shapedSearchParameters: (state) => {
    // 設定されたパラメータだけを抽出
    return Object.entries(state.searchParameters)
      .filter(([key, val]) => {
        return val !== null && val !== ''
      })
      .reduce((result, current) => {
        result[current[0]] = current[1]
        return result
      }, {})
  }
}

export const mutations = {
  setSearchParameters(state, { parameters }) {
    state.searchParameters = { ...state.searchParameters, ...parameters }
  }
}
