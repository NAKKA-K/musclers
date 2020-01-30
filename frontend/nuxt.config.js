import colors from 'vuetify/es5/util/colors'

require('dotenv').config()

export default {
  mode: 'universal',

  /*
   ** Headers of the page
   */
  head: {
    titleTemplate: '%s - ' + process.env.npm_package_name,
    title: process.env.npm_package_name || '',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      {
        hid: 'description',
        name: 'description',
        content: process.env.npm_package_description || ''
      }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
      {
        rel: 'stylesheet',
        href:
          'https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons'
      }
    ]
  },

  env: {
    wsURL: process.env.WS_URL
  },
  /*
   ** Customize the progress-bar color
   */
  loading: { color: '#fff' },

  /*
   ** Plugins to load before mounting the App
   */
  plugins: [
    '~plugins/persistedstate.js',
    '~/plugins/axios.js',
    '~/plugins/vuelidate.js',
    '~/plugins/queryParamsUpdater.js',
    '~plugins/vue-scrollto',
    { src: '~/plugins/swiper.js', ssr: false },
    { src: '~/plugins/actioncable.js', ssr: false }
  ],

  /*
   ** Global CSS
   */
  css: ['swiper/dist/css/swiper.css'],
  styleResources: {
    scss: ['~/assets/scss/app.scss']
  },

  /*
   ** Nuxt.js modules
   */
  modules: [
    // Doc: https://buefy.github.io/#/documentation
    '@nuxtjs/vuetify',
    // Doc: https://axios.nuxtjs.org/usage
    '@nuxtjs/axios',
    '@nuxtjs/pwa',
    '@nuxtjs/auth',
    '@nuxtjs/markdownit',
    '@nuxtjs/style-resources'
  ],

  /**
   * PWA compatible for develop
   */
  /*
  workbox: {
    dev: true
  },
  */

  /*
   ** vuetify module configuration
   ** https://github.com/nuxt-community/vuetify-module
   */
  vuetify: {
    theme: {
      primary: colors.blue.darken2,
      accent: colors.grey.darken3,
      secondary: colors.amber.darken3,
      info: colors.teal.lighten1,
      warning: colors.amber.base,
      error: colors.deepOrange.accent4,
      success: colors.green.accent3
    }
  },

  /*
   ** Axios module configuration
   ** See https://axios.nuxtjs.org/options
   */
  axios: {
    baseURL: process.env.API_URL,
    browserBaseURL: process.env.API_URL_BROWSER
  },

  /*
   ** Build configuration
   */
  build: {
    /*
     ** You can extend webpack config here
     */
    vendor: ['vue-awesome-swiper'],
    extend(config, ctx) {}
  },

  /**
   * auth session
   */
  auth: {
    watchLoggedIn: false,
    redirect: {
      login: '/auth/login',
      logout: '/',
      callback: '/callback',
      home: '/redirect'
    },
    strategies: {
      facebook: {
        client_id: process.env.FACEBOOK_APP,
        userinfo_endpoint:
          'https://graph.facebook.com/v2.12/me?fields=about,name,picture{url},email,birthday',
        scope: ['public_profile', 'email', 'user_birthday']
      }
    }
  },
  watchers: {
    webpack: {
      poll: true
    }
  },
  markdownit: {
    injected: true,
    breaks: true,
    html: false,
    linkify: false,
    typography: true
  }
}
