import Vue from 'vue'
import ActionCable from 'actioncable'

const cable = ActionCable.createConsumer('ws:localhost:8080/cable')
Vue.prototype.$cable = cable
