export default ({ app, $axios }) => {
  app.$fetchUserData = (userId) => {
    const url = `http://api:8080/api/users/${userId}`
    return $axios.get(url)
  }
}
