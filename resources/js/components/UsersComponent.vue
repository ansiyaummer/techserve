<template>
    <div class="users">
      <v-tabs
      dark
   background-color="primary"
   grow
      >
      <v-tab ripple>
        Users
      </v-tab>
      <v-tab ripple>
      Technicians
      </v-tab>

          			  <v-tab-item>
        <v-container>

            <v-layout wrap class="mb-3">

                <v-tooltip top>
                    <v-btn small flat color="grey" @click="sortBy('name')" slot="activator">
                        <v-icon left small>sort</v-icon>
                        <span class="caption">Name</span>
                    </v-btn>
                    <span>sort user by name.</span>
                </v-tooltip>

                <v-tooltip top>
                    <v-btn small flat color="grey" @click="sortBy('email')" slot="activator">
                        <v-icon left small>sort</v-icon>
                        <span class="caption">Email</span>
                    </v-btn>
                    <span>sort user by email.</span>
                </v-tooltip>

                <v-spacer></v-spacer>



            </v-layout>

            <v-layout>
                <dialog-create-user></dialog-create-user>
            </v-layout>

            <v-card flat v-for="user in users" :key="user.id" class="cardborder">
                <v-layout row wrap class="pa-3">
                    <v-flex xs12 md3>
                        <div class="caption grey--text">Name</div>
                        <div>{{ user.name }}</div>
                    </v-flex>
                    <v-flex xs12 md3>
                        <div class="caption grey--text">Email</div>
                        <div>{{ user.email }}</div>
                    </v-flex>
                    <v-flex xs12 md2>
                        <div class="caption grey--text">Created</div>
                        <div>{{ user.created_at | moment("MMMM Do YYYY") }}</div>
                    </v-flex>
                    <v-flex xs12 md2>
                        <div class="pt-2">
                            <v-chip v-for="role in user.roles" :key="role.id"
                                color="green lighten-1" text-color="white" small>
                                {{ role.name }}
                            </v-chip>
                        </div>
                    </v-flex>
                    <v-flex xs12 md2>
                        <v-btn flat small fab outline color="red" class="right" @click="deleteUser(user)">
                            <v-icon>delete</v-icon>
                        </v-btn>
                        <v-btn flat small fab outline color="blue" class="right" @click="openEditUserDialog(user)">
                            <v-icon small>edit</v-icon>
                        </v-btn>
                    </v-flex>
                </v-layout>
                <v-divider></v-divider>
            </v-card>

            <div class="text-xs-center mt-3">
                <v-card flat>
                    <v-btn small flat @click="fetchPaginateUser(pagination.prev_page_url)" :disabled="!pagination.prev_page_url">Prev</v-btn>
                    <v-btn small flat disabled v-text="`page ${pagination.current_page} of ${pagination.last_page}`"></v-btn>
                    <v-btn small flat @click="fetchPaginateUser(pagination.next_page_url)" :disabled="!pagination.next_page_url">Next</v-btn>
                </v-card>
            </div>


            <v-layout>
                <dialog-edit-user></dialog-edit-user>
            </v-layout>

            <v-layout>
                <dialog-delete-user></dialog-delete-user>
            </v-layout>

            <v-snackbar v-model="snackbar" color="success" bottom right>
                <span>User deleted successfully.</span>
                <v-btn dark flat @click="snackbar = false">Close</v-btn>
            </v-snackbar>
            <v-btn
                bottom
                color="green"
                dark
                fab
                fixed
                right
            @click="openCreateUserDialog"
              >
                <v-icon>add</v-icon>
              </v-btn>
        </v-container>
				</v-tab-item>

			<v-tab-item>
      <v-card flat v-for="technician in technicians" :key="technician.id" class="cardborder">
          <v-layout row wrap class="pa-3">
              <v-flex xs12 md3>
                  <div class="caption grey--text">Name</div>
                  <div>{{ technician.name }}</div>
              </v-flex>
              <v-flex xs12 md3>
                  <div class="caption grey--text">Email</div>
                  <div>{{ technician.email }}</div>
              </v-flex>


              <v-flex xs12 md2>

                  <v-btn flat small fab outline color="blue" class="right" @click="openEditUserDialog(technician)">
                      <v-icon small>edit</v-icon>
                  </v-btn>
              </v-flex>
          </v-layout>
          <v-divider></v-divider>
      </v-card>
        			</v-tab-item>
	</v-tabs>

    </div>
</template>

<script>

    import CreateUser from './dialogs/CreateUser'
    import EditUser from './dialogs/EditUser'
    import DeleteUser from './dialogs/DeleteUser'

    export default {
        name: 'users',
        components: {
            'dialog-create-user': CreateUser,
            'dialog-edit-user': EditUser,
            'dialog-delete-user': DeleteUser
        },
        data() {
            return {
                users: [],
                user: {},
                technicians:[],
                technician:{},
            //  url: 'api/getusers',
          url: '/getusers',
          technicians :'/getTechnicians',
                pagination: [],
                roles: [],

                snackbar: false
            }
        },
        created(){
            this.getUsers()
            this.getRoles()
            this.getTechnicians()

            eventBus.$on('pushUserData', (user) => {
                this.users.unshift(user)
            })
            eventBus.$on('pushUpdatedUser', (updated) => {
                if (updated == true) {
                    this.getUsers()
                }
            })
            eventBus.$on('updateDeletedUser', (deleted) => {
                if (deleted === true) {
                    this.snackbar = true
                    this.getUsers()
                }
            })
        },
        methods: {
            sortBy(prop) {
                this.users.sort( (a,b) => a[prop] < b[prop] ? -1 : 1)
            },
            getUsers(){
                let vm = this
                axios.get(this.url)
                    .then( (response) => {
                        this.users = (response.data.data)
                        vm.makePagination(response.data)
                    })
                    .catch( (error) => {
                        console.log(error);
                    });
            },

            getTechnicians(){

                axios.get('/getTechnicians')
                    .then( (response) => {
                        this.technicians = (response.data.data)
                        alert(this.technicians.name)

                    })
                    .catch( (error) => {
                        console.log(error);
                    });
            },

            getRoles() {
                axios.get('/role-list')
                    .then( (response) => {
                        this.roles = (response.data)
                    })
                    .catch( (error) => {
                        console.log(error);
                    });
            },
            openCreateUserDialog() {
                eventBus.$emit('openCreateUserDialog', {
                    dialog: true,
                    roles : this.roles
                })
            },
            openEditUserDialog(user) {
                eventBus.$emit('openEditUserDialog', {
                    dialog: true,
                    user  : user,
                    roles : this.roles
                })
            },
            deleteUser(user) {
                if (user.id) {
                    eventBus.$emit('openDeleteUserDialog', {
                        dialog: true,
                        user: user
                    })
                }
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
