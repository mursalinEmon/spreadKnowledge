<template>
<div>
    <div class="card">
        <div class="card-header">{{ course_name }}</div>
        <form class="card-body" @submit.prevent="createLesson">
            <div class="form-group">
                <label for="topicTitle">Lesson Title</label>
                <input v-model="title" type="text" class="form-control" id="topicTitle" aria-describedby="emailHelp" placeholder="Title" required>

            </div>


            <div class="form-group">
                <label for="">Content</label>
                    <vue-editor v-model="content" />
            </div>
            <div class="form-group">
                <label for="topicTitle">Lesson Video</label>
                <input v-model="video_link" type="text" class="form-control" id="video_link" aria-describedby="emailHelp" placeholder="Video Link" required>

            </div>
            <div class="form-group">
                <div>
                    <button type="submit" value="submit" class="btn btn-primary">Submit</button>
                </div>

            </div>

        </form>

    </div>

    <br>
    <br>
    <div v-for="(lesson, index) in course_lessons"  :key="index">
        <div v-if="lesson.lesson_title"  class="card">
            <div class="card-header">
                {{ lesson.lesson_title }}
            </div>
            <div class="card-body d-flex justify-center">
                <a :href="(href + lesson.id)" class="btn btn-primary">Edit</a>
                <button class="btn btn-danger ml-4" @click="delete_lesson(lesson.id,index)">Delete</button>
            </div>
        </div>
        <br>
    </div>
</div>




</template>
<script>
export default {
    props:[{

    }],
     created(){
        this.course_id=this.$attrs.course.id;
        this.course_name=this.$attrs.course.course_title;
        console.log(this.course_id);
        this.showLessons();

    },
    data:()=>({
        href:"/edit_lesson/",
        title:"",
        content:"",
        course_id:null,
        fetched_lessons:"",
        course_lessons:[],
        course_name:"",
        video_link:"",
        options:{
            closeMethod :'fadeOut',
            closeDuration:300,
            closeEasing :'swing',
            closeEasing : 'linear',
            closeButton : true,
        }
    }),



    methods:{
        createLesson(){
             let formData = new FormData();
             if( this.course_id){
                    formData.append('course_id', this.course_id);
                    formData.append('topic_title', this.title);
                    formData.append('topic_body', this.content);
                    formData.append('video_link', this.video_link);

                    axios.post('/create-course-lesson',formData).then((res)=>{
                        this.showLessons();
                        this.title="";
                        this.content="";
                        this.video_link="";
                        this.$alert(
                                res.data.message,
                                "",
                                "success"
                                )
                    this.showLessons();
                    }).catch((err)=>{console.log(err)});
             }

        },

         fetchLessons(){
            axios.get('/get-course-lessons').then((res)=>{
            this.fetched_lessons=res.data;

            }).catch((err)=>{console.log(err);});

        },

        showLessons(){
            axios.get(`/get-selected-course-lessons/${this.course_id}`).then((res)=>{

                this.course_lessons=res.data;

            }).catch((err)=>{console.log(err);});

        },
        delete_lesson(id,index){
            this.course_lessons.splice(index,1,"");
            axios.get(`/course_lesson/${id}`).then((res)=>{

                this.$toastr.success(res.data.message, 'Successful', this.options);
            }).catch((err)=>{
                console.log(err);
            });
        },

    },
}
</script>
<style lang="scss" scoped>

</style>
