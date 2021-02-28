<template>
  <div class="container">
      <div class="card">
        <div class="card-header">
            Course: {{ this.course.course_title }} Lesson: {{ this.$attrs.courselesson.lesson_title }}
        </div>
        <div class="card-body">
            <form  @submit.prevent="createQustion">

                <label for="exampleFormControlTextarea1">Question Body</label>
                <textarea required class="form-control form-group"  v-model="question_body" id="exampleFormControlTextarea1" rows="3"></textarea>
                <h6>Options For the Question</h6>
                 <label for="1">Option 1:</label>
                <input required type="text" id="1"  v-model="option_1" class="form-control form-group">
                 <label for="2">Option 2:</label>
                <input required type="text" id="2" v-model="option_2" class="form-control form-group">
                 <label  required for="3">Option 3:</label>
                <input required type="text" id="3" v-model="option_3"  class="form-control form-group">
                 <label for="4">Option 4:</label>
                <input required type="text" id="4" v-model="option_4" class="form-control form-group">
                  <label for="Ans">Answer:</label>
                <input required type="number" id="Ans"  v-model="answer" class="form-control form-group">
                <button type="submit" value="submit" class="btn btn-primary">Submit</button>

            </form>
            <br>
            <div v-if="show" class="pr-4 float-right">
                <button @click="goBack()" class="btn btn-success">Go Back >></button>
            </div>
        </div>



      </div>
  </div>
</template>

<script>
export default {
    props:{
        course:{
            type:Object,
            default:null
        },
         courseLesson:{
            type:Object,
            default:null
        }
    },
    data:()=>({
        course_id:null,
        lession_id:null,
        question_body:"",
        option_1:"",
        option_2:"",
        option_3:"",
        option_4:"",
        options:[],
        answer:null,
        show:false,

    }),
    created(){
        this.course_id=this.course.id;
        this.lession_id=this.$attrs.courselesson.id;
    },
    methods:{
        createQustion(){
            let list=[];
            list.push(this.option_1);
            list.push(this.option_2);
            list.push(this.option_3);
            list.push(this.option_4);
            this.options=list;
            // console.log(this.options);
             let formData = new FormData();
            formData.append('options',this.options);
            formData.append('answer',this.answer);
            formData.append('course_id',this.course_id);
            formData.append('lession_id',this.lession_id);
            formData.append('question_body',this.question_body);
            axios.post(`/courses/${this.course_id}/courseLessons/${this.lession_id}/quiz/create`,formData).then((res)=>{
                this.$alert(
              res.data.message,
              "",
              "success"
            );
            this.question_body="",
            this.option_1="",
            this.option_2="",
            this.option_3="",
            this.option_4="",
            this.options=[],
            this.answer=null,
            this.show=true;
                console.log(res);
            }).catch((err)=>(console.log(err)))





        },

        goBack(){
            location.replace(`/course_lessons/${this.course_id}`);
        }
    }

}
</script>

<style>

</style>
