<template>
<div class="row ml-4">
      <div class="col-md-3">
            <p>lesson List</p>
            <hr>
                <ul v-for="(lesson,index) in selected_course_lessons" :key="index"  >
                    <li class="card-header"  @click="fetch_body(lesson.course_id,lesson.id,index,$event)" :ref="index" >{{ lesson.lesson_title }}</li>
                </ul>

                <h1 v-if="!selected_course_lessons" class="text-danger">No Lessons to Show...!!</h1>
        </div>
        <div class="col-md-8">
            <div class="card-body body" v-html="lesson_body">
                {{ lesson_body }}
            
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="d-flex justify-content-center align-items-center frame" v-html="link">
                        {{ link }}
                         <!-- <iframe width="90%" height="515" src="https://www.youtube.com/embed/NyDT3KkscSk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
                    </div>
                </div>
            </div>

            
                <div v-if="modal" class="modal">
                   <div class="rating">
                       <h2>Do You Want To Rate This Course ?</h2>
                       <div class="stars">
                           <star-rating v-model="rating"></star-rating>
                       </div>

                        <button @click="manage_Rating()" class="btn btn-success float-right mt-5"> Done </button>
                   </div>

                </div>
        </div>
        <div class="col-md-2">

        </div>

</div>

</template>

<script>
export default {

props:{
    selected_course_lessons:{
        type:Array,
        default:null,
    }
},
data:()=>{
    return{
        lessons:[],
        lesson_body:"",
        link:"",
        count:0,
        old:0,
        new:null,
        rating:0,
        modal:false,
        is_rated:false,
    }
},
created(){
    this.check_Rating();
    
},
mounted(){

this.fetch_body(this.selected_course_lessons[0].course_id,this.selected_course_lessons[0].id,0);


let old=this.old;
this.$refs[old][0].classList.add(['active-class']);
},
methods:{
async fetch_body(cid,id,index,event){
    let pid =id;
    if(index!=0){
        await this.check_elegible(cid,id);
    }




if (this.count>0){
    this.$refs.[this.old][0].classList.remove(['active-class']);
    this.new=index;
    this.$refs.[this.new][0].classList.add(['active-class']);
    this.old=index;
    }


    axios.get(`/lesson/${pid}/body`).then((res)=>{
        this.lesson_body=res.data.lesson_body;
        this.link=res.data.link;
        this.count++;
    }).catch((err)=>console.log(err));
},
check_elegible(cid,id){
      axios.get(`/course/${cid}/lesson/${id}/check_status`).then((res)=>{
            console.log(res);
            if(res.data.questions.length!=0){
                this.$confirm(res.data.message).then(text => {
                       location.replace(`/course-lesson-exam/${cid}/${id}`);  // do somthing with text
                });
            }

        }).catch((err)=>{console.log(err);});

},
manage_modal(){
     this.modal=true;
},
manage_Rating(){
    this.modal=false;

    //then make a axios call based on the rating
     let formData = new FormData();
     formData.append('rating',this.rating);
    axios.post(`/courses/${this.selected_course_lessons[0].course_id}/ratings`,formData).then((res)=>{
        //console
    }).catch((err)=>{console.log(err);})

},
check_Rating(){
    axios.get(`/check/rating/${this.selected_course_lessons[0].course_id}`).then((res)=>{
        this.is_rated = res.data.is_rated;

        if(this.is_rated === false){
            setTimeout(this.manage_modal, 2000);
        }
        // console.log(res.data.is_rated);
    }).catch((err)=>{
        console.log(err);
    })
}

},

}
</script>

<style lang="scss">
ul{
    list-style:none;
    padding: 0px;
    // margin: 0px;
}
li{
    list-style: none;
    border-radius: 10px;
}
.body{
    border-left: 1px solid rgb(207, 200, 200);
}
.active-class{
    background-color: rgb(85, 78, 78);
    color:aliceblue;
    border-radius: 10px;
}
.modal{
    display: block;
    height: 100vh;
    width:100vw;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: rgba(0, 0, 0, 0.404);
    // transform: translate(50%,50%);
}
.rating{
    display: block;
    background-color: white;
    padding: 5rem;
    padding-top: 4rem;
    padding-bottom: 2rem;
}
.stars{
    margin-left: 25%;

}
.frame>iframe{
    width: 100%!important;
}
</style>
