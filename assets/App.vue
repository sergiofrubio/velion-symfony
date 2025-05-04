<template>
  <div class="app-wrapper">
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'App',
};
</script>

<style scoped>
.app-wrapper {
  width: 100vw;
  min-height: 100vh;
  overflow-x: hidden;
}
</style>
