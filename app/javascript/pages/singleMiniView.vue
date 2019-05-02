<template>
  <b-row v-if="loaded">
    <b-row>
          <b-col>
              <h1>{{mini.title}}</h1>  
          </b-col>
          <b-col>
              <star-rating v-if="!voted" :max-rating="10" @rating-selected ="setRating"></star-rating>
                <div v-else> Votes : {{mini.cached_votes_total}} Average: {{mini.cached_weighted_average}}</div>
               
          </b-col>
          
    </b-row>
  
    <b-row>
      <b-col>
            <b-card no-body>
                <h4 slot="header">Author Info</h4>

                <b-card-body>
                  <b-card-title>Card Title</b-card-title>
                  <b-card-sub-title class="mb-2">Card Sub Title</b-card-sub-title>
                  <b-card-text>
                    Some quick example text to build on the card title and make up the bulk of the card's
                    content.
                  </b-card-text>
                </b-card-body>

                <b-list-group flush>
                  <b-list-group-item>Cras justo odio</b-list-group-item>
                  <b-list-group-item>Dapibus ac facilisis in</b-list-group-item>
                  <b-list-group-item>Vestibulum at eros</b-list-group-item>
                </b-list-group>

                <b-card-body>
                  <a href="#" class="card-link">Card link</a>
                  <a href="#" class="card-link">Another link</a>
                </b-card-body>
              </b-card>

      
      </b-col>
      
      <b-col cols="8">
          <div>
              <b-img-lazy  v-for="url in mini.picture_urls" v-bind="imgProps" :src="url" alt="Image 1"></b-img-lazy>
            </div>
      </b-col>
      <b-col>
        
      </b-col>

    </b-row>
  </b-row>
</template>

<script>

import StarRating from 'vue-star-rating'


export default {
  name:"miniView",
  components:{
    StarRating
  },
  data: function () {
    return {
      imgProps: {
          center: true,
          fluidGrow: false,
          blank: true,
          blankColor: '#bbb',
          width: 800,
          class: 'my-5'
        },
        mini:null,
        loaded:false,
        voted:false
    }
  },
  created(){
     this.axios.all([this.loadVoted(), this.loadmini()])
      .then(this.axios.spread( (voted, mini) =>{
        this.mini = mini.data
        this.voted = voted.data
        this.loaded = true
      }));
  },
  methods:{
    loadVoted(){
      return this.axios.get('/miniature_api/alreadyVoted?miniId=' +  this.$route.params.id)
    },
    loadmini(){
      return this.axios.get('/miniature_api/getMini/' +  this.$route.params.id)
    },
    setRating(e){
       this.axios.get('/miniature_api/voteMini?id='+this.$route.params.id + "&vote="+e).then(resp=>{
          this.mini = resp.data
          this.voted=true
          this.loaded=true
      })
    }
  }
}
</script>

