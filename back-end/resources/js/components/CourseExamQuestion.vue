<template>
    <div class="container">
        <div v-for="(question, ind) in questions" :key="ind">
            <div class="card">
                <div class="card-header">
                    {{ question.question_body }}
                </div>
                <div class="card-body">
                    <div
                        class="card-text"
                        v-for="(option, index) in question.options.split(',')"
                        :key="index"
                    >
                        <input
                            type="radio"
                            :id="index"
                            :value="option"
                            v-model="picked[ind]"
                        />
                        <label> {{ option }}</label>
                    </div>
                </div>
            </div>
            <br />
        </div>

        <div class="float-right mr-4 pr-4  pt-4 mb-4">
            <button @click="submit_paper()" class="btn btn-primary">
                Submit
            </button>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        questions: Array,
        default: []
    },
    data: () => ({
        picked: []
    }),
    mounted() {
        //    this.fill_arr();
    },
    methods: {
        submit_paper() {
            let formData = new FormData();
            formData.append("answers", this.picked);

            axios
                .post(
                    `/course-lesson-exam/${this.questions[0].course_id}/${this.questions[0].lession_id}/evaluate`,
                    formData
                )
                .then(res => {
                    this.$alert(
                        res.data.message,
                        "",
                        "success"
                    );
                    location.replace(`/course/${res.data.course_id}/getLessons`);
                })
                .catch(err => console.log(err));
        }
    }
};
</script>

<style></style>
