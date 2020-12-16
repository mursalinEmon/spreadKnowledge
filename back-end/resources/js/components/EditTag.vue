<template>
    <div>
        <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">Create New Tag</div>

                    <div class="card-body">
                        <form @submit.prevent="updateTag">
                            <div class="form-group">
                                <label for="blogTitle">Tag Title</label>
                                <input v-model="title" type="text" class="form-control" id="blogTitle" placeholder="Title" required>

                            </div>
                             <div class="form-group">
                                <label for="blogTitle">Tag Title</label>
                                <textarea v-model="description" type="text" class="form-control" id="blogTitle" rows="3" placeholder="Put Description.." required></textarea>

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
export default {
    created(){
        this.title=this.$attrs.tag.name;
        this.description=this.$attrs.tag.description;
        this.id=this.$attrs.tag.id;
    },
 data: () => ({
     id:"",
    description:"",
    title:"",
  }),
  methods:{
      updateTag(){
            axios.post('/blogTags-update', {
              title: this.title,
              description: this.description,
              id: this.id

          }).then((res)=>{
              console.log(res);
              this.title="";
              this.description="";
              this.$alert(
              res.data.message,
              "",
              "success"
            )}).catch()
      }
  }



}
</script>
<style scoped>

</style>
