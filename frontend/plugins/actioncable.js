import Vue from 'vue'
import ActionCable from 'actioncable'

const cable = ActionCable.createConsumer(process.env.wsURL)
Vue.prototype.$cable = cable
