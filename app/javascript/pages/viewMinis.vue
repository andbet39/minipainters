<template>
  <div id="app">
      <b-card-group columns>
        <b-card v-for="mini in minis " :key="mini.id"
        :title="mini.title"
            border-variant="primary"

        :img-src="mini.picture_urls[0]"
        img-alt="Image"
        img-top
        tag="article"
        style="max-width: 20rem;"
        class="mb-2"
        >
        <b-card-text>
        {{mini.description}}
        </b-card-text>

        <b-button @click="open(mini)" variant="primary">Go somewhere</b-button>
        </b-card>
      </b-card-group>
  </div>
</template>

<script>
export default {
  name:"miniList",
  data: function () {
    return {
        minis:[]
    }
  },
  created(){
      this.axios.get('/miniature_api/getMinis').then(resp=>{
          this.minis = resp.data
      })
  },
  methods:{
    open(mini){
      this.$router.push('mini/'+mini.id);
    }
  }
}
</script>

