export default function({ $axios, store }) {
  $axios.onRequest((config) => {
    const token = store.getters['auth/token']
    if (token) {
      config.headers.common.Authorization = token
    }

    if (!config.headers['Content-Type']) {
      config.headers.common['Content-Type'] = 'application/json'
    }
    return config
  })
}
