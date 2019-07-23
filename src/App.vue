<template>
  <div id="app">
    <h1>Playground for our new components!</h1>
    <ImageComponent />
  </div>
</template>

<script>
import ImageComponent from './components/Image/Image.vue';
export default {
  name: 'app',
  components: {
    ImageComponent,
  },
};
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
