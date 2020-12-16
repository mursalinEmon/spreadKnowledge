<template>
    <div>
        <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">Create New Tag</div>

                    <div class="card-body">
                        <form @submit.prevent="postTag">
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
                                   <button type="submit" value="submit" class="btn btn-primary">Submit</button>
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
  data: () => ({
    description: "",
    title:"",
  }),
  methods: {
      postTag(){

              axios.post('/tags-create', {
              title: this.title,
              description: this.description,


          }).then((res)=>{
              console.log(res);
              this.title="";
              this.description="";
              this.$alert(
              res.data.message,
              "",
              "success"
            )}).catch()

      },

  }

};
</script>

