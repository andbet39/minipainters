<template>
  <b-container fluid>
    <router-view></router-view>
  </b-container>
</template>

<script>


export default {
  components:{
    
  },
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style>

nav{
  margin-bottom: 20px; 
}
</style>