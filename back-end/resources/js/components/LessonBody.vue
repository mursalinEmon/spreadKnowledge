<template>
<div class="row">
      <div class="col-md-4">
            <p>lesson List</p>
            <hr>
                <ul v-for="(lesson,index) in selected_course_lessons" :key="index"  >
                    <li class="card-header"  @click="fetch_body(lesson.id,index,$event)" :ref="index" >{{ lesson.lesson_title }}</li>
                </ul>

                <h1 v-if="!selected_course_lessons" class="text-danger">No Lessons to Show...!!</h1>
        </div>
        <div class="col-md-8">
            <div class="card-body body" v-html="lesson_body">
                {{ lesson_body }}
            </div>
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
        count:0,
        old:0,
        new:null,


    }
},
created(){
    //  this.click_button();
},
mounted(){
// this.click_button();
this.fetch_body(this.selected_course_lessons[0].id);

// this.$refs.ref0.$el.classList.add('active-class')
let old=this.old;
this.$refs[old][0].classList.add(['active-class']);
},
methods:{
fetch_body(id,index,event){

if (this.count>0){
    this.$refs.[this.old][0].classList.remove(['active-class']);
    this.new=index;
    this.$refs.[this.new][0].classList.add(['active-class']);
    this.old=index;
}


    axios.get(`/lesson/${id}/body`).then((res)=>{
        // console.log(res);

        this.lesson_body=res.data.lesson_body;
        this.count++;
    }).catch((err)=>console.log(err));
},

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
</style>
