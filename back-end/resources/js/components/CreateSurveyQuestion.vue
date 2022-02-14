<template>
  <div class="container">
      <div class="card">
        <div class="card-header">
            Create Survey Question
        </div>
        <div class="card-body">
            <form  @submit.prevent="createQustion">

                <label for="exampleFormControlTextarea1">Question Body</label>
                <textarea required class="form-control form-group"  v-model="question_body" id="exampleFormControlTextarea1" rows="3"></textarea>
                <h6 class="form-control form-group">Options For the Question</h6>
                 <select class="form-control form-group" v-model="selectedType" name="selectedType" id="">
                     <option value="">--Select--</option>
                     <option value="cat">Category</option>
                     <option value="subcat">Sub Category</option>
                 </select>
                <button type="submit" value="submit" class="btn btn-primary">Submit</button>

            </form>
        </div>



      </div>
  </div>
</template>

<script>
export default {
    props:{
        // type:null
    },
    data:()=>({

        selectedType:"",
        question_body:""

    }),
    created(){
    
    },
    methods:{
        createQustion(){
            // console.log(this.options);
             let formData = new FormData();
            formData.append('selectedType',this.selectedType);
            formData.append('question_body',this.question_body);
            axios.post(`/store-survey-question`,formData).then((res)=>{
                this.$alert(
              res.data.message,
              "",
              "success"
            );
            this.question_body="",
            this.selectedType="",
                console.log(res);
            }).catch((err)=>(console.log(err)))





        },

        // goBack(){
        //     location.replace(`/course_lessons/${this.course_id}`);
        // }
    }

}
</script>

<style>

</style>
