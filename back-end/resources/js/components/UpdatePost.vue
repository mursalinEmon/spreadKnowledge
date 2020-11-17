<template>
    <div>
        <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">Update Post</div>

                    <div class="card-body">
                        <form @submit.prevent="postBlog">
                            <div class="form-group">
                                <label for="blogTitle">Blog Title</label>
                                <input v-model="title" type="text" class="form-control" id="blogTitle" aria-describedby="emailHelp" placeholder="Title" required>

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


                            <div class="form-group">
                                <label for="">Content</label>
                               <vue-editor v-model="content" />
                            </div>
                           <div class="form-group">
                               <div>
                                   <button type="submit" value="submit" class="btn btn-primary">Update</button>
                               </div>

                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</template>



<script>
import { VueEditor } from "vue2-editor";


export default {
  components: { VueEditor },
  props:['post'],
  data: () => ({
    content: "",
    title:"",
    id: "",
    toggleButton: false,
    query:"",
    fetchedTags:[],
    tags:[],


  }),

  mounted(){
      this.fetchTags();
      this.editpost();
  },

  methods: {
      postBlog(){

              axios.post('update-post', {
              title: this.title,
              content: this.content,
              tags: this.tags,
              id: this.id

          }).then((res)=>{
              console.log(res);
              this.title="";
              this.content="";
              this.$alert(
              res.data.message,
              "",
              "success"
            )}).catch()

      },


      editpost(){
          this.content=this.post.content;
          this.title=this.post.title;
          this.tags=this.post.tags;
          this.id=this.post.id;
          console.log(this.title);
      },

      async fetchTags(){
          await axios.get('fetch-tags').then((res)=>{
              this.fetchedTags=res.data.tags;
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
};
</script>

<style lang="scss" scoped>
    ul{
        text-decoration: none;

    }

    li{
        text-decoration: none;
    }

    .crossButton{
        border-radius: 50%;

    }
</style>
