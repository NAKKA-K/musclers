export default function({ $axios, redirect }) {
  //$axios.setToken('access_token')

  $axios.onResponse(config => {
      $axios.setHeader('Access-Control-Allow-Origin', 'http://api:8080')
  })
}