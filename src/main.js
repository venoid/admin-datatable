import Vue from 'vue';
import App from './App.vue';
import { Table, Icon, Button, Select } from 'buefy'
import 'buefy/dist/buefy.css'
import '@mdi/font/css/materialdesignicons.css'

Vue.config.productionTip = false;

Vue.use(Table)
Vue.use(Icon)
Vue.use(Button)
Vue.use(Select)

new Vue({
  render: h => h(App),
}).$mount('#app');
