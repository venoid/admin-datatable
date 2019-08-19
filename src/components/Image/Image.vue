<template>
  <div>
    <img :src="src" />
  </div>
</template>
<script>
export default {
  name: 'ImageComponent',
  props: {
    src: {
      type: String,
      default: 'https://picsum.photos/400'
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
