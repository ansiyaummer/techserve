<template>
    <v-container>
        <v-layout row>
            <v-flex xs12 smxs12 >
                <h1 class="subheading black--text text-uppercase">Leave</h1>
                <v-card-title style="padding:0px;">



                    <v-spacer></v-spacer>
                    <v-text-field
                    append-icon="search"
                    single-line
                    v-model="search" style="padding:16px;display:flex;"
                    ></v-text-field>
                </v-card-title>
                <template>
                    <v-data-table  v-bind:headers="headers" :items="leaves" v-bind:search="search" class="elevation-1">
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
                            <td class="text-xs-left">{{ props.item.username }}</td>
                              <td class="text-xs-left">{{ props.item.leave_date }}</td>
                            <td class="text-xs-left">{{ props.item.leave_type }}</td>

                            <td class="text-xs-left">
                          <v-chip  style="color:#fff;"  :color="check(props.item.leave_stage)">
                          {{ props.item.leave_stage }}
                         </v-chip>
                            </td>

                           <td class="text-xs-left">{{ props.item.des }}</td>
                            <td class="text-xs-left">
                                <!-- <v-btn class="primary" small :href="'/student/edit/'+props.item.id">Edit</v-btn> -->
                                <v-btn flat small fab outline color="blue"  class="center" @click="openEditUserDialog(user)">
                                <v-icon small>edit</v-icon>
                                </v-btn>

                                <v-btn flat small fab outline color="green"  class="center" @click.prevent="Approve(props.item.id)">
                                    <v-icon>thumb_up</v-icon>
                                </v-btn>

                                <v-btn flat small fab outline color="red"  class="center" @click.prevent="Reject(props.item.id)">
                                    <v-icon>thumb_down</v-icon>
                                </v-btn>


                            </td>
                        </template>
                    </v-data-table>
                </template>

            </v-flex>
        </v-layout>
        <v-layout>
            <dialog-create-user></dialog-create-user>
        </v-layout>
        <v-layout>
            <dialog-edit-user></dialog-edit-user>
        </v-layout>
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
</template>
<script>
import swal from 'sweetalert'
import CreateUser from './Add'
import EditUser from './Edit'
export default {
      name: 'Leave',
  components: {
      'dialog-create-user': CreateUser,
       'dialog-edit-user': EditUser,


  },
    data () {



        return {
            search: '',
            users: [],
            user: {},
            headers: [
            { text: 'Name', value: 'username',align: 'left' },
            { text: 'Leave Date', value: 'leave_date',align: 'left' },
            { text: 'Leave Type', value: 'leave_type',align: 'left' },
            { text: 'Leave Status', value: 'leave_stage',align: 'left' },

            { text: 'Reason', value: 'des',align: 'left' },

            { text: 'Actions', value: 'actions' ,align: 'center'},

            ],
            leaves : [],
        };
    },
    created: function() {
        this.getleaves();
    },
    methods: {
      check : function(item) {


  if (item == 'Rejected') return 'red'
  else if (item == 'Pending') return 'orange'
  else return 'green'
},
        getleaves : function(){
            axios.get('api/leave')
            .then(response => this.leaves = response.data)
            .catch(error => console.log(error.response.data));
        },

        Approve :  function(){
           alert("yes");
             this.getleaves();
        },

        Reject :  function(){
           alert("No");
             this.getleaves();
        },

        deleteLeave: function(id, index){
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
                    axios.delete('api/leave/'+id)
                    .then(res =>{
                        if(res.status == 200){
                            this.getleaves();

                            swal("Deleted!","Leave Deleted Successfully", "success");

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
    }
}
</script>
