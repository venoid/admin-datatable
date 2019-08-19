<template>
  <div>
    <div v-show="isVisible">Ahoj!</div>
    <button @click="toggle">Click me</button>
  </div>
</template>
<script>
export default {
  name: "Default Component",
  data() {
    return {
      isVisible: false
    }
  },
  methods: {
    toggle() {
      this.isVisible = !this.isVisible
    }
  }
}
</script>
<style lang="scss" scoped>

</style>
