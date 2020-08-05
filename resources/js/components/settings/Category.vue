<template>
  <div v-if="$can('admin-settings')">
    <div class="users">

      <v-container>
            <h1 class="subheading grey--text text-uppercase">Category</h1>
      </v-container>
        <v-container>

            <v-layout wrap class="mb-3">

                <v-spacer></v-spacer>

                <v-btn small flat outline color="green" @click="openCreateUserDialog">
                    <v-icon left small>add_circle</v-icon>
                    <span class="caption">Create</span>
                </v-btn>

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



                    <v-flex xs12 md4>
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

        </v-container>

    </div>
    </div>
    <div v-else>
            <v-container>
    You dont have access to view this area
          </v-container>
    </div>
</template>

<script>

    import CreateUser from './dialogs/CreateCategory'
    import EditUser from './dialogs/EditCategory'
    import DeleteUser from './dialogs/DeleteCategory'

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
            //  url: 'api/getusers',
          url: '/getCategory',
                pagination: [],
                roles: [],
                user: {},
                snackbar: false
            }
        },
        created(){
            this.getUsers()


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
