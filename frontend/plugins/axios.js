export default function({ $axios, store }) {
  $axios.onRequest((config) => {
    const token = store.getters['auth/token']
    if (token) {
      config.headers.common.Authorization = token
    }
    config.headers.common['Content-type'] = 'application/json'
    return config
  })
}
