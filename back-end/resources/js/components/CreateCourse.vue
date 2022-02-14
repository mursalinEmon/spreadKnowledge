<template>
    <div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div v-if="next == 'false'" class="card">
                        <div class="card-header">
                            {{
                                next == "true"
                                    ? `Design Your Course(${title})`
                                    : "Create New Course"
                            }}
                        </div>

                        <div>
                            <form
                                class="card-body"
                                @submit.prevent="submitFile()"
                            >
                                <div class="form-group">
                                    <label for="blogTitle">Course Title</label>
                                    <input
                                        v-model="title"
                                        type="text"
                                        class="form-control"
                                        id="blogTitle"
                                        aria-describedby="emailHelp"
                                        placeholder="Title"
                                        required
                                    />
                                </div>
                                <div class="form-group">
                                    <label
                                        >Upload Course Banner
                                        <small
                                            >(Recomended: 13:6 ratio)</small
                                        ></label
                                    ><br />

                                    <div class="d-flex justify-content-center">
                                        <label
                                            for="image"
                                            class="btn btn-primary form-group"
                                            id="selector"
                                            style="cursor: pointer;height:40px!important;"
                                            >Select Image
                                            <i class="fas fa-image"></i
                                        ></label>
                                        <input
                                            class="form-group form-control"
                                            ref="file"
                                            type="file"
                                            @change="processFile()"
                                            style="opacty:1;position: absolute;z-index:-1;"
                                            id="image"
                                            name="file"
                                        />
                                        <div
                                            :style="{
                                                'background-image': `url(${previewImage})`
                                            }"
                                            v-if="previewImage"
                                            class="imagePreviewWrapper"
                                        >
                                            <span
                                                @click="removeImage"
                                                class="badge badge-secondary rounded float-right m-2"
                                                >x</span
                                            >
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Course Level</label>
                                    <select
                                        class="form-group form-control"
                                        v-model="level"
                                        id="level"
                                        name="level"
                                    >
                                        <option class="text-center" value=""
                                            >Select</option
                                        >
                                        <option value="beginner"
                                            >Beginner</option
                                        >
                                        <option value="intermediate"
                                            >Intermediate</option
                                        >
                                        <option value="Advance">Advance</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Course Category</label>
                                    <select
                                        class="form-group form-control"
                                        v-model="category"
                                        id="level"
                                        name="level"
                                    >
                                        <option class="text-center" value=""
                                            >Select</option
                                        >
                                        <option
                                            v-for="(category,
                                            index) in categories"
                                            :key="index"
                                            >{{ category.id }}.{{
                                                category.name
                                            }}</option
                                        >
                                    </select>
                                </div>
                                <div v-if="category" class="form-group">
                                    <label>Course Sub-Category</label>
                                    <select
                                        class="form-group form-control"
                                        v-model="sub_category"
                                        id="level"
                                        name="level"
                                    >
                                        <option class="text-center" value=""
                                            >Select</option
                                        >
                                        <option
                                            v-for="(category,
                                            index) in sub_categories"
                                            :key="index"
                                            >{{ category.id }}.{{
                                                category.name
                                            }}</option
                                        >
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Course Type</label>
                                    <select
                                        class="form-group form-control"
                                        v-model="course_type"
                                        id="course_type"
                                        name="course_type" @change="checkifpaid()"
                                    >
                                        <option class="text-center" value=""
                                            >Select</option
                                        >
                                        <option class="text-center" value="paid">Paid</option>
                                        <option class="text-center" value="free">Free</option>
                                    </select>
                                </div>
                                <div class="form-group" v-if="show_amt_opt">
                                    <label for="blogTitle">Course Fee</label>
                                    <input
                                        v-model="amount"
                                        type="number"
                                        class="form-control"
                                        id="coursefee"
                                        aria-describedby="emailHelp"
                                        placeholder="Course Fee"
                                        required
                                    />
                                </div>
                                <div class="form-group ">
                                    <label for="">Tags</label>
                                    <div class="d-flex">
                                        <div class="">
                                            <vue-bootstrap-typeahead
                                                v-model="query"
                                                :data="fetchedTags"
                                            />
                                        </div>

                                        <div class="ml-auto">
                                            <input
                                                value="Add"
                                                readonly
                                                @click="addTags"
                                                class="btn btn-primary "
                                            />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <button
                                        @click="deleteBadge(index)"
                                        class="btn btn-secondary ml-2 p-2"
                                        v-for="(tag, index) in tags"
                                        :key="index"
                                    >
                                        {{ tag }}
                                        <span
                                            class="badge badge-light crossButton"
                                            >x</span
                                        >
                                    </button>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <button
                                            type="submit"
                                            value="submit"
                                            class="btn btn-primary"
                                        >
                                            Submit
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div v-else>
                        <design-course
                            :course_name="title"
                            :course_id="course_id"
                        ></design-course>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import DesignCourse from "./DesignCourse.vue";

export default {
    components: { DesignCourse },
    props: {
        categories: ""
    },
    data: () => ({
        file: "",
        next: "false",
        title: "",
        fetchted_sub_category: [],
        id: "",
        level: "",
        category_id: "",
        sub_categories: [],
        toggleButton: false,
        query: "",
        fetchedTags: [],
        tags: [],
        previewImage: null,
        category: "",
        sub_category: "",
        sub_category_id: "",
        course_id: "3",
        course_type:"",
        show_amt_opt: false,
        amount: null
    }),
    watch: {
        category: function(newCategory, oldCategory) {
            this.processString(newCategory);
        }
    },

    created() {
        this.fetchTags();
        this.fetch_sub_category();
    },

    methods: {
        processFile() {
            this.file = this.$refs.file.files[0];
            let reader = new FileReader();
            reader.onload = e => {
                this.previewImage = e.target.result;
            };
            reader.readAsDataURL(this.file);
            this.$alert("Image Uploaded", "", "success");
        },
        processString(category) {
            this.category_id = parseInt(category.split(".", 1)[0]);
            axios
                .get(`/get-selected-sub-categories/${this.category_id}`)
                .then(res => {
                    this.sub_categories = res.data;
                })
                .catch(err => {
                    console.log(err);
                });
        },
        fetch_sub_category() {
            axios.get("/get-sub-category").then(res => {
                this.fetchted_sub_category = res.data;
            });
        },
        fetchTags() {
            axios
                .get("fetch-tags")
                .then(res => {
                    let data = res.data.tags;
                    let f_tags = [];
                    data.forEach(element => {
                        f_tags.push(element.name);
                    });
                    this.fetchedTags = f_tags;
                })
                .catch();
        },

        submitFile() {
            this.sub_category_id = parseInt(this.sub_category.split(".", 1)[0]);
            let formData = new FormData();
            formData.append("file", this.file);
            formData.append("title", this.title);
            formData.append("tags", JSON.stringify(this.tags));
            formData.append("level", this.level);
            formData.append("course_type", this.course_type);
            formData.append("amount", this.amount);
            formData.append("category_id", this.category_id);
            formData.append("sub_category_id", this.sub_category_id);
            // formData.append('level', this.level);

            axios
                .post("/course-create", formData, {
                    headers: {
                        "Content-Type": "multipart/form-data"
                    }
                })
                .then(res => {
                    this.level = "";
                    this.tags = [];
                    this.file = "";
                    this.previewImage = null;
                    this.$alert(res.data.message, "", "success");

                    this.course_id = res.data.course_id;
                    if (res.data.course_id) {
                        this.next = "true";
                    }
                })
                .catch();
        },

        addTags() {
            this.tags.push(this.query);
            this.query = "";
        },

        deleteBadge(index) {
            this.tags.splice(index, 1);
        },

        removeImage() {
            this.previewImage = null;
            this.file = null;
            this.$refs.file.value = "";
        },
        checkifpaid(){
            if(this.course_type=="paid"){
                this.show_amt_opt=true;
                console.log('Paid');
            }
            else{
                this.show_amt_opt=false;
            }
        }
    }
};
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
</style>
