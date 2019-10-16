export default ({ app, store }) => {
  app.router.beforeEach((to, from, next) => {
    console.log('------')
    console.log(store.getters['users/shapedSearchParameters'])
    console.log(to.query)
    console.log('------')
    store.commit('users/setFilteredSearchParameters', { queries: to.query })
    next({ query: store.getters['users/shapedSearchParameters'] })
  })
}
