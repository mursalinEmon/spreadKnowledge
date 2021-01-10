<template>
<div class="container" style="background-color:aliceblue;">

   <hooper :itemsToShow="3" pagination="no">

         <slide v-for="(course,index) in top_courses" :key="index" :index="index" >
            <!-- <h6>{{course.course_title}}</h6> -->
             <div class="card" style="width:10vw;margin-right:1rem;" >
                <img class="card-img-top card_image" :src="'/'+course.image" alt="Card image">
                <div class="card-body">
                <h6 class="card-title">{{ course.course_title }}</h6>
                <a href="#" class="btn btn-primary">Brouse Course</a>
                </div>
            </div>
         </slide>

              <hooper-navigation slot="hooper-addons" ></hooper-navigation>


  </hooper>
</div>
</template>

<script>

import { Hooper, Slide, Navigation as HooperNavigation } from 'hooper';
import 'hooper/dist/hooper.css';
export default {
 components:{
        Hooper,
        Slide,
        HooperNavigation
 },
 props:{

 },
 data:()=>({
     top_courses:[],

 }),
 created(){
     this.fetch_Top_Courses();
 },
methods:{
    fetch_Top_Courses(){
        axios.get('/top-course').then((res)=>{
            console.log(res);
            this.top_courses=res.data.top_courses;
            }).catch((err)=>{console.log(err);})
    }
}

}
</script>


<style lang="scss">
    .card_image{
        height: 50px;
        width: 70px;
    }
</style>
