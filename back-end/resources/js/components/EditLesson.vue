<template>
<div>
    <div v-if="!hide" class="card">
        <div class="card-header">{{ course_name }}</div>
        <form class="card-body" @submit.prevent="updateLesson">
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
                <input v-model="link" type="text" class="form-control" id="video_link" aria-describedby="emailHelp" placeholder="Video Link" required>

            </div>
            <div class="form-group">
                <div>
                    <button type="submit" value="submit" class="btn btn-primary">Update</button>
                </div>

            </div>

        </form>
    </div>

    <div v-else class="card">
        <a  :href="(url + course_id)" class="btn btn-lg btn-primary"> GO Back To Lessons</a>
    </div>

</div>

</template>

<script>
export default {
    props:{
        lesson:{type:Object}
    },
    created(){
        this.content = this.lesson.lesson_body;
        this.title=this.lesson.lesson_title;
        this.link=this.lesson.link;
        this.id=this.lesson.id;
        this.course_id=this.lesson.course_id;
    },
    data:()=>({
    content:"",
    title:"",
    id:"",
    link:"",
    course_id:"",
    url:"/course_lessons/",
    hide:false
    }),
    methods:{
        updateLesson(){
            let formData = new FormData();
            formData.append('lesson_body', this.content);
            formData.append('lesson_title', this.title);
            formData.append('link', this.link);
            formData.append('id', this.id);

            axios.post('/update-lesson',
                formData,
                {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
              }

            ).then((res)=>{

                this.hide=true;

            this.$alert(
              res.data.message,
              "",
              "success"
            )}).catch();
        }

    },
}
</script>

<style>

</style>
