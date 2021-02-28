<template>
<div class="container">
    <form v-if="show" class="card-body" @submit.prevent="submitFile()">
                            <div class="form-group">
                                <label for="blogTitle">Course Title</label>
                                <input v-model="title" type="text" class="form-control" id="blogTitle" aria-describedby="emailHelp" placeholder="Title" required>

                            </div>
                            <div class="form-group">
                                  <label  >Upload Course Banner <small>(Recomended: 13:6 ratio)</small></label><br>
                                    <img :src="databaseImage" class="image" alt="databaseimage">
                                    <p class="text text-center">(Current Image)</p>
                                    <div class="d-flex justify-content-center">
                                         <label for="image" class="btn btn-primary form-group" id="selector" style="cursor: pointer;height:40px!important;">Update Image <i class="fas fa-image"></i></label>
                                         <input class="form-group form-control"  ref="file" type="file" @change="processFile()" style="opacty:1;position: absolute;z-index:-1;" id="image" name="file">
                                            <div :style="{ 'background-image': `url(${previewImage})` }" v-if="previewImage" class="imagePreviewWrapper">
                                                <span @click="removeImage" class="badge badge-secondary rounded float-right m-2">x</span>
                                            </div>
                                    </div>


                            </div>

                            <div class="form-group">
                                <label>Course Level</label>
                                <select class="form-group form-control" v-model="level" id="level" name="level">
                                    <option class="text-center" value="">Select</option>
                                    <option value="beginner">Beginner</option>
                                    <option value="intermediate">Intermediate</option>
                                    <option value="Advance">Advance</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Course Category (Current Category: {{category.name}})</label>

                                <select class="form-group form-control" v-model="selected_category" id="level" name="level">
                                    <option class="text-center"  value="">Select</option>
                                    <option v-for="(category, index) in categories"  :key="index" >{{ category.name  }}</option>
                                </select>
                            </div>
                             <div v-if="selected_category" class="form-group">
                                <label>Course Sub-Category</label>
                                <select class="form-group form-control" v-model="sub_category" id="level" name="level">
                                    <option class="text-center"  value="">Select</option>
                                    <option v-for="(category, index) in sub_categories"  :key="index" >{{ category.name  }}</option>
                                </select>
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
                               <div>
                                   <button type="submit" value="submit" class="btn btn-primary">Update</button>
                               </div>

                            </div>

                        </form>

                        <div v-else>
                            <design-course :course_name="title"  :course_id="course_id"></design-course>
                        </div>

</div>
</template>

<script>
export default {

props:{
    course:{
        type:Object,
        default:null
    }
},
 watch: {

        selected_category: function (newCategory, oldCategory) {
            console.log("hit");
            this.processString( newCategory);
        }
    },
created(){
    this.title=this.course.course_title;
    this.level=this.course.course_level;
    this.category_id=this.course.category_id;
    this.databaseImage=`../../${this.course.image}`;

    this.course_id=this.course.id;
    // this.course_name=this.$attrs.course_name;
    console.log(this.course_id);
    // this.showLessons();

    this.fetchTags();
    this.fetchCategories();
    this.push_tags();

},
    data:()=>({

    title:"",
    level:"",
    query:"",
    previewImage:null,
    databaseImage:"",
    category_id:null,
    category:"",
    selected_category:"",
    categories:[],
    sub_category:"",
    fetchted_sub_category:"",
    fetchedTags:[],
    tags:[],
    file:"",
    sub_categories:[],
    show:'true',
    course_id:null,
    course_name:""



}),
methods:{
    fetchTags(){
            axios.get('/tags-list').then((res)=>{

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
    push_tags(){
        let old_tags=JSON.parse(this.course.tags);
        console.log(old_tags.length);
        for (let i =0;i<old_tags.length;i++ ){
            this.tags.push(old_tags[i]);
        }
    },

      deleteBadge(index){
          this.tags.splice(index,1);
      },
     search_category(category, categories){
            for (var i=0; i < categories.length; i++) {
                if (categories[i].name === category) {
                    return categories[i];
                }
                    }
    },
    processString(category){
            //  this.category_id=parseInt(category.split('.',1)[0]);
           let cat=this.search_category(category,this.categories);
            this.category_id=cat.id;
            axios.get(`/get-selected-sub-categories/${this.category_id}`).then((res)=>{
                this.sub_categories=res.data;
            }).catch((err)=>{console.log(err);});

    },
    fetchCategories(){
        axios.get(`/category/${this.category_id}`).then((res)=>{
            this.category= res.data.category;

            this.categories=res.data.categories;
        }).catch((err)=>{console.log(err);})
    },
     fetch_sub_category(){
            axios.get('/get-sub-category').then((res)=>{

                this.fetchted_sub_category=res.data;
                });
        },
    processFile(){
        console.log("hit");

           this.file = this.$refs.file.files[0];
            let reader = new FileReader
          reader.onload = e => {

            this.previewImage = e.target.result;

          }
          reader.readAsDataURL(this.file);
            this.$alert(
              "Image Uploaded",
              "",
              "success"
            )
        },
      removeImage(){
        this.previewImage = null;
        this.file=null;
        this.$refs.file.value="";


      },
      deleteBadge(index){
          this.tags.splice(index,1);
      },
      reload() {
        location.reload();
    },
      submitFile(){
        let formData=new FormData();
        formData.append('file',this.file);
        formData.append('title',this.title);
        formData.append('tags', JSON.stringify(this.tags));
        formData.append('level', this.level);
        formData.append('category_id',this.category_id);
        formData.append('sub_category',this.sub_category);

        axios.post(`/courses/${this.course.id}/Update`,formData).then((res)=>{
            this.$confirm(`${res.data.message}`).then(() => {

              this.reload();
            //   this.show=false;

            });
        }).catch((err)=>{console.log(err);})

      },

    //   goToLessons(){
    //         location.replace(`/course-create/`);
    //     }



}

}
</script>

<style scoped lang="scss">
.imagePreviewWrapper {
    width: 150px;
    height: 150px;
    display: block;
    cursor: pointer;
    margin: 0 auto 30px;
    background-size: cover;
    background-position: center center;
}
.image{
    width: 250px;
    height: 250px;
    display: block;
    cursor: pointer;
    margin: 0 auto 30px;
    background-size: cover;
    background-position: center center;
}
</style>
