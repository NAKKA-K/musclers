export default ({ app, store }) => {
  app.router.beforeEach((to, from, next) => {
    store.commit('users/setFilteredSearchParameters', { queries: to.query })
    next({ query: store.getters['users/shapedSearchParameters'] })
  })
}
