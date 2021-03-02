<template>
    <div class="container" style="background-color:aliceblue;">
        <div v-if="(top_courses.length)">
            <h4>Top Courses</h4>
        <hr />
        <hooper :itemsToShow="3" pagination="no">
            <slide
                v-for="(course, index) in top_courses"
                :key="index"
                :index="index"
            >
                <!-- <h6>{{course.course_title}}</h6> -->
                <div class="card" style="width:10vw;margin-right:1rem;">
                    <img
                        class="card-img-top card_image"
                        :src="'/' + course.image"
                        alt="Card image"
                    />
                    <div class="card-body">
                        <h6 class="card-title">{{ course.course_title }}</h6>
                        <a href="#" class="btn btn-primary">Brouse Course</a>
                    </div>
                </div>
            </slide>

            <hooper-navigation slot="hooper-addons"></hooper-navigation>
        </hooper>
        </div>
       <div v-if="(Object.keys(this.recomended_courses).length != 0)">
            <h4>Recomended For You</h4>
        <hr />
        <hooper :itemsToShow="3" pagination="no">
            <slide
                v-for="(course, index) in recomended_courses"
                :key="index"
                :index="index"
            >
                <!-- <h6>{{course.course_title}}</h6> -->
                <div class="card" style="width:10vw;margin-right:1rem;">
                    <img
                        class="card-img-top card_image"
                        :src="'/' + course[0].image"
                        alt="Card image"
                    />
                    <div class="card-body">
                        <h6 class="card-title">{{ course[0].course_title }}</h6>
                        <a href="#" class="btn btn-primary">Brouse Course</a>
                    </div>
                </div>
            </slide>

            <hooper-navigation slot="hooper-addons"></hooper-navigation>
        </hooper>
       </div>

      <div v-if="(top_courses_month.length)">
            <h4>Popular This Month</h4>
        <hr />
        <hooper :itemsToShow="3" pagination="no">
            <slide
                v-for="(course, index) in top_courses_month"
                :key="index"
                :index="index"
            >
                <!-- <h6>{{course.course_title}}</h6> -->
                <div class="card" style="width:10vw;margin-right:1rem;">
                    <img
                        class="card-img-top card_image"
                        :src="'/' + course.image"
                        alt="Card image"
                    />
                    <div class="card-body">
                        <h6 class="card-title">{{ course.course_title }}</h6>
                        <a href="#" class="btn btn-primary">Brouse Course</a>
                    </div>
                </div>
            </slide>

            <hooper-navigation slot="hooper-addons"></hooper-navigation>
        </hooper>
      </div>


    <div v-if="(rating_based_courses.length)">
            <h4>Courses You Might Wanna Take</h4>
        <hr />
        <hooper :itemsToShow="3" pagination="no">
            <slide
                v-for="(course, index) in rating_based_courses"
                :key="index"
                :index="index"
            >
                <!-- <h6>{{course.course_title}}</h6> -->
                <div class="card" style="width:10vw;margin-right:1rem;">
                    <img
                        class="card-img-top card_image"
                        :src="'/' + course.image"
                        alt="Card image"
                    />
                    <div class="card-body">
                        <h6 class="card-title">{{ course.course_title }}</h6>
                        <a href="#" class="btn btn-primary">Brouse Course</a>
                    </div>
                </div>
            </slide>

            <hooper-navigation slot="hooper-addons"></hooper-navigation>
        </hooper>
        </div>



    </div>
</template>

<script>
import { Hooper, Slide, Navigation as HooperNavigation } from "hooper";
import "hooper/dist/hooper.css";
export default {
    components: {
        Hooper,
        Slide,
        HooperNavigation
    },
    props: {},
    data: () => ({
        top_courses: [],
        recomended_courses: [],
        top_courses_month: [],
        rating_based_courses: []

    }),
    created() {
        this.fetch_Top_Courses();
        this.fetch_Recomended_Courses();
        this.fetch_Top_Courses_month();
        this.fetch_Ratingbased_courses();
    },
    methods: {
        fetch_Top_Courses() {
            axios
                .get("/top-course")
                .then(res => {
                    // console.log(res);
                    this.top_courses = res.data.top_courses;
                })
                .catch(err => {
                    console.log(err);
                });
        },
        fetch_Recomended_Courses() {
            axios
                .get("/recomended-courses")
                .then(res => {
                    // console.log(res);
                    this.recomended_courses = res.data.recomended_courses;

                })
                .catch(err => {
                    console.log(err);
                });
        },
        fetch_Top_Courses_month() {
            axios
                .get("/top-courses-this-month")
                .then(res => {
                    //  console.log(res);
                    this.top_courses_month = res.data.top_courses_month;
                })
                .catch(err => {
                    console.log(err);
                });
        },
        fetch_Ratingbased_courses(){
            axios.get('/rating-rec').then((res)=>{
                this.rating_based_courses=res.data.rating_based_courses;
            }).catch((err)=>console.log(err));
        }
    }
};
</script>

<style lang="scss">
.card_image {
    height: 20px;
    width: 20px;
}
</style>
