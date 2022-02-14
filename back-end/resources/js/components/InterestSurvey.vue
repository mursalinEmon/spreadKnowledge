<template>
    <div class="container">
        <div id="app1" class="align-middle">
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
                </div>
            </div>
            </div>
        </div>
        <br>
        <div class="card d-flex flex-row mr-2">
            <div class="card-body"  v-for="(category,index) in sent_cat" :key="index">
                <h5 class="card-title">{{category.name}}</h5>
                <div  v-for="(sub_Cat,index) in sent_sub_cat" :key="index">
                    <div  v-if="sub_Cat.category_id==category.id"><input v-model="selected_sub_cats" type="checkbox">{{sub_Cat.name}}</div>
                     <div v-else class="d-none"></div>

                </div>
            </div>
        </div>
    </div>
    
</template>

<script>

export default {
    props: {
        categories:null,
        sub_categories:null
    },
    data: () => ({
        sent_cat:[],
        sent_sub_cat:[],
        fetched_subcats:[],
        selected_cats:[],
        selected_sub_cats:[],
    }),
    watch: {
        category: function(newCategory, oldCategory) {
            this.processString(newCategory);
        }
    },

    created() {
        this.sent_cat=this.$props.categories;
        this.sent_sub_cat=this.$props.sub_categories;
        // this.fetch_sub_category_id();
    },

    methods: {
        getsubcategories(id){
            this.selected_cats.push(id);
            
            // this.selected_cats=temp;
             this.sent_sub_cat.forEach(element => {
               if(element.category_id==id){
                   this.fetched_subcats.push(element);
               }
            });
        },

        // getCategoryId(category){
        //     if(!this.category_id.includes(category.id)){
        //         this.category_id.push(category.id);
        //     }
        //     // console.log(this.sub_category);
        //     // this.processString(category_id);
        //     this.getSubcategory(this.category_id);

        // },

        // fetch_sub_category_id(){
        //     this.sub_categories.forEach(element => {
        //         // console.log(element.name);
        //         this.sub_category.push(element);
        //     });
        // },

        // getSubcategory(id){
        //     console.log('cat id :',id);
        //      this.fetched_sub_category=[];
        //     this.sub_category.forEach(element=>{
        //         if(element.category_id == id){
        //             if(!this.fetched_sub_category.includes(element.id)){
        //                 console.log(element.id);
        //                 this.fetched_sub_category.push(element.id);
        //             }
        //         }

        //     });
        //         console.log(this.fetched_sub_category);

        // },

        // getSubcategory(id){
        //     if(this.category_id == ){

        //     }
        // },

        // processString(category) {
        //     console.log(category);
        //     category_id = parseInt(category.split(".", 1)[0]);
        //     axios
        //         .get(`/get-selected-sub-categories/${this.category_id}`)
        //         .then(res => {
        //             this.sub_categories = res.data;
        //         })
        //         .catch(err => {
        //             console.log(err);
        //         });
        // },

        // processString(category){
        //     console.log(category);
        // },


        // fetch_sub_category() {
        //     axios.get("/get-sub-category").then(res => {
        //         console.log(res);
        //         this.fetched_sub_category = res.data;
        //     });
        // },

    }
};
</script>
