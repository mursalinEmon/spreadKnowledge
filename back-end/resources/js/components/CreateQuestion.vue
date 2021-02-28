<template>
  <div>
     <form  @submit.prevent="submitFile">
         <div class="form-group">
            <label for=""> Put Question Topic</label>
            <input class="form-control form-group" type="text" v-model="topic" placeholder="Put Question Topic....">
        </div>
        <div class="form-group">
            <label for=""> Put Your Question</label>
            <input class="form-control form-group" type="text" v-model="question" placeholder="Put Question....">
        </div>
        <div class="form-group">
            <label for="">Describe Your Question Details</label>
            <vue-editor v-model="body" />
        </div>
            <div class="form-group ">
                                        <label for="">Tags</label>
                                        <div class="d-flex">
                                            <div class="">
                                                <vue-bootstrap-typeahead  v-model="query" :data="fetchedTags"/>
                                            </div>

                                            <div class="ml-auto">
                                                <input value="Add" readonly @click="addTags" class="btn btn-primary ">
                                            </div>
                                        </div>

                            </div>


                            <div class="form-group">
                                <button @click="deleteBadge(index)" class="btn btn-secondary ml-2 p-2" v-for="(tag,index) in tags" :key="index">{{ tag }} <span class="badge badge-light crossButton">x</span></button>
                            </div>
        <div>
            <button class="text-center btn btn-primary form-group form-control" type="submit">Submit</button>
        </div>
     </form>


  </div>
</template>

<script>
export default {
     created(){
        this.fetchTags();
       this.fetch_sub_category();
    },
data:()=>{
    return{
        question:"",
        body:"",
        topic:"",
        fetchedTags:[],
        query:"",
        tags:[],
    }
},
methods:{

submitFile(){
    let formData = new FormData();
    formData.append('question',this.question);
    formData.append('body',this.body);
    formData.append('topic',this.topic);
    formData.append('tags',JSON.stringify(this.tags));
    axios.post('/question-create',formData).then((res)=>{
        this.$alert(
              res.data.message,
              "",
              "success"
            );
            this.tags=[];
            this.question="";
            this.body="";
            this.topic="";
            this.query="";
    }).catch((err)=>{console.log(err);})

},
fetchTags(){
           axios.get('fetch-tags').then((res)=>{

              let data=res.data.tags;
                let f_tags=[];
              data.forEach(element => {

                  f_tags.push(element.name);
              });
              this.fetchedTags=f_tags;

          }).catch()
      },
        addTags(){
          this.tags.push(this.query);
          this.query="";
      },

      deleteBadge(index){
          this.tags.splice(index,1);
      },

}

}
</script>

<style>

</style>
