<template>
    <div class="users">

        <v-container>
          <v-layout row>
                <v-flex xs12 smxs12 >
        <h1 class="subheading black--text text-uppercase">Bills</h1>

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
                <dialog-create-user></dialog-create-user>
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
                        <td class="text-xs-left">Direct</td>

  <td class="text-xs-left">INvoice No</td>
                        <td class="text-xs-left">




  <v-btn class="ma-2" color="success" dark>View
          <v-icon dark right>mdi-checkbox-marked-circle</v-icon>
        </v-btn>

                        </td>
                    </template>
                </v-data-table>
            </template>


            <v-layout>
                <dialog-edit-user></dialog-edit-user>
            </v-layout>

            <v-layout>
                <dialog-delete-user></dialog-delete-user>
            </v-layout>

            <v-snackbar v-model="snackbar" color="success" bottom right>
                <span>Vendor deleted successfully.</span>
                <v-btn dark flat @click="snackbar = false">Close</v-btn>
            </v-snackbar>

        </v-container>

    </div>
</template>

<script>

  //  import CreateUser from './Add'
  //  import EditUser from './Edit'

    export default {
        name: 'users',
        components: {
          //  'dialog-create-user': CreateUser,
          //  'dialog-edit-user': EditUser,

        },
        data() {
            return {

              search: '',
              headers: [
              { text: 'Customer Name', value: 'name',align: 'left' },
              { text: 'Submitted', value: 'phone1',align: 'left' },
              { text: 'Contract Type', value: 'email1',align: 'left' },
              { text: 'INV No', value: 'email1',align: 'left' },
              { text: 'Actions', value: 'actions' ,align: 'left'},

              ],
              vendors : [ ],


                users: [],
            //  url: 'api/getusers',

                pagination: [],

                snackbar: false
            }
        },
        created(){
  this.getVendors();

            eventBus.$on('pushUserData', (user) => {
                this.users.unshift(user)
            })
            eventBus.$on('pushUpdatedUser', (updated) => {
                if (updated == true) {
                    this.getUsers()
                }
            })

        },
        methods: {
            sortBy(prop) {
                this.users.sort( (a,b) => a[prop] < b[prop] ? -1 : 1)
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



            openCreateUserDialog() {
                eventBus.$emit('openCreateUserDialog', {
                    dialog: true,

                })
            },
            openEditUserDialog(user) {
                eventBus.$emit('openEditUserDialog', {
                    dialog: true,


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
                this.getUsers()
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
