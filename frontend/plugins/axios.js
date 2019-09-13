export default function({ $axios, store }) {
  $axios.onRequest((config) => {
    const token = store.getter['auth/token']
    if (token) {
      config.headers.common.Authorization = token
    }
    return config
  })
}
