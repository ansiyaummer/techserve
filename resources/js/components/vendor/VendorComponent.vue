<template>
    <div class="users">

        <v-container>
          <v-layout row>
                <v-flex xs12 smxs12 >
        <h1 class="subheading black--text text-uppercase">Vendor</h1>

            </v-flex>
                    </v-layout>


            <v-layout row>
                  <v-flex xs12 smxs12 >
              <v-card-title style="padding:0px;">



                  <v-spacer></v-spacer>
                  <v-text-field
                  append-icon="search"
                  single-line
                  v-model="search" style="padding:16px;display:flex;"
                  ></v-text-field>
              </v-card-title>



    </v-flex>

            </v-layout>

            <v-layout>
                <dialog-create-vendor></dialog-create-vendor>
            </v-layout>

            <template>
                <v-data-table  v-bind:headers="headers" :items="vendors" v-bind:search="search" class="elevation-1">
                    <template slot="headerCell" slot-scope="props">
                        <v-tooltip bottom>
                            <span slot="activator">
                                {{ props.header.text }}
                            </span>
                            <span>
                                {{ props.header.text }}
                            </span>
                        </v-tooltip>
                    </template>
                    <template slot="items" slot-scope="props">
                        <td class="text-xs-left">{{ props.item.name }}</td>
                            <td class="text-xs-left">{{ props.item.phone1 }}</td>
                        <td class="text-xs-left">{{ props.item.email1 }}</td>


                        <td class="center">




                            <v-btn flat small fab outline color="red" :href="'/student/delete/'+props.item.id" class="right"@click.prevent="deleteStudent(props.item.id)">
                                <v-icon>delete</v-icon>
                            </v-btn>
                            <v-btn flat small fab outline color="blue" class="right" @click="openEditVendorDialog(props.item)">
                                <v-icon small>edit</v-icon>
                            </v-btn>
                        </td>
                    </template>
                </v-data-table>
            </template>


            <v-layout>
                <dialog-edit-vendor></dialog-edit-vendor>
            </v-layout>

            <v-layout>
                <dialog-delete-vendor></dialog-delete-vendor>
            </v-layout>

            <v-snackbar v-model="snackbar" color="success" bottom right>
                <span>Vendor deleted successfully.</span>
                <v-btn dark flat @click="snackbar = false">Close</v-btn>
            </v-snackbar>
            <v-btn
                bottom
                color="green"
                dark
                fab
                fixed
                right
              @click="openCreateVendorDialog(user)"
              >
                <v-icon>add</v-icon>
              </v-btn>
        </v-container>

    </div>
</template>

<script>

    import CreateUser from './Add'
    import EditUser from './Edit'

    export default {
        name: 'vendor',
        components: {
            'dialog-create-vendor': CreateUser,
            'dialog-edit-vendor': EditUser,

        },
        data() {
            return {

              search: '',
              headers: [
              { text: 'Company Name', value: 'name',align: 'left' },
              { text: 'Phone', value: 'phone1',align: 'left' },
              { text: 'Email', value: 'email1',align: 'left' },

              { text: 'Actions', value: 'actions' ,align: 'middle'},

              ],
              vendors : [],
              vendor : [],
              city:[],
              state:[],



            //  url: 'api/getusers',
              url: '/getvendors',
                pagination: [],
                vendor: {},
                snackbar: false
            }
        },
        created(){
  this.getVendors();
  this.getState();
  this.getCity();

            eventBus.$on('pushUserData', (user) => {
                this.users.unshift(user)
                    this.getVendors();
            })
            eventBus.$on('pushUpdatedUser', (updated) => {
                if (updated == true) {
                  this.getVendors();
                }
            })

        },


        methods: {
            sortBy(prop) {
                this.users.sort( (a,b) => a[prop] < b[prop] ? -1 : 1)
            },

            getState() {
                axios.get('/state-list')
                    .then( (response) => {
                        this.state = (response.data)
                    })
                    .catch( (error) => {
                        console.log(error);
                    });
            },

            getCity() {
                axios.get('/city-list')
                    .then( (response) => {
                        this.city = (response.data)
                    })
                    .catch( (error) => {
                        console.log(error);
                    });
            },


            getVendors : function(){
                axios.get('api/vendor')
                .then(response => this.vendors = response.data)
                .catch(error => console.log(error.response.data));
            },


            deleteStudent: function(id, index){
                swal({
                    title: "Are you sure?",
                    text: "You will not be able to recover this record!",
                    icon: "warning",
                    type: "warning",
                    showCancelButton: true,
                    closeOnConfirm: true,
                    dangerMode: true,
                    closeModal: true,
                })
                .then(willDelete => {
                    if (willDelete) {
                        axios.delete('api/vendor/'+id)
                        .then(res =>{
                            if(res.status == 200){
                                this.getVendors();

                                swal("Deleted!","Vendor Deleted Successfully", "success");

                            }
                        })
                        .catch(error => {
                            if(error.response.status){
                                swal("Oops!", "Seems like we couldn't delete the record", "error")
                            }
                        });
                    }
                });
            },





            openCreateVendorDialog() {
                eventBus.$emit('openCreateVendorDialog', {
                      dialog: true,
                      city : this.city,
                      state : this.state,

                })
            },


            openEditVendorDialog(vendor) {
            eventBus.$emit('openEditVendorDialog', {
                dialog: true,

                vendor  : vendor,
                city : this.city,
                state : this.state,
            })

            },


            makePagination(data) {
                let pagination = {
                    current_page: data.current_page,
                    last_page: data.last_page,
                    next_page_url: data.next_page_url,
                    prev_page_url: data.prev_page_url
                }
                this.pagination = pagination
            },
            fetchPaginateUser(url) {
                this.url = url
                this.getVendors();
            }
        },
        mounted() {
            console.log('User Component mounted.')
        }
    }
</script>

<style scoped>
    .cardborder:nth-child(4n+1){
        border-left: 4px solid green;
    }
    .cardborder:nth-child(4n+2){
        border-left: 4px solid orange;
    }
    .cardborder:nth-child(4n+3){
        border-left: 4px solid teal;
    }
    .cardborder:nth-child(4n+0){
        border-left: 4px solid tomato;
    }
</style>
