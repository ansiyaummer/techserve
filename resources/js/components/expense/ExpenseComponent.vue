<template>
    <v-container>
        <v-layout row>

            <v-flex xs12 smxs12 >
                  <h1 class="subheading black--text text-uppercase">Expense</h1>
                <v-card-title style="padding:0px;">

                    <v-spacer></v-spacer>
                    <v-text-field
                    append-icon="search"
                    single-line
                    v-model="search" style="padding:16px;display:flex;"
                    ></v-text-field>
                </v-card-title>
                <template>
                    <v-data-table  v-bind:headers="headers" :items="expenses" v-bind:search="search" class="elevation-1">
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
                            <td class="text-xs-left">{{ props.item.price }}</td>
                            <td class="text-xs-left">{{ props.item.expense_type }}</td>
                            <td class="text-xs-left">
                              <v-img
                                                 :src="props.item.photo"
                                                 :lazy-src="props.item.photo"
                                                 aspect-ratio="1"
                                                 class="grey lighten-2"
                                               >
                                               </v-img>
                            </td>
                           <td class="text-xs-left">{{ props.item.user }}</td>
                            <td class="text-xs-left">
                                <!-- <v-btn class="primary" small :href="'/student/edit/'+props.item.id">Edit</v-btn> -->



                                <v-btn flat small fab outline color="red" :href="'/student/delete/'+props.item.id" class="right"@click.prevent="deleteExpense(props.item.id)">
                                    <v-icon>delete</v-icon>
                                </v-btn>
                                <v-btn flat small fab outline color="blue" class="right"  @click="openEditUserDialog(user)">
                                    <v-icon small>edit</v-icon>
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
  name:'expense',
  components: {
      'dialog-create-user': CreateUser,
       'dialog-edit-user': EditUser,

  },
    data () {
        return {
              file: '',
            search: '',
            headers: [
            { text: 'Name', value: 'name',align: 'left' },
            { text: 'Price', value: 'price',align: 'left' },
            { text: 'Expense type', value: 'expense_type',align: 'left' },
            { text: 'Attachment', value: 'photo',align: 'left' },
            { text: 'User', value: 'user',align: 'left' },

            { text: 'Actions', value: 'actions' ,align: 'left'},

            ],
            expenses : [ ],
            expense : [ ],
            url: '/getexpenses',
              pagination: [],
              expense: {},
              snackbar: false

        };
    },
    created: function() {
        this.getExpenses();
    },
    methods: {
        getExpenses : function(){
            axios.get('api/expense')
            .then(response => this.expenses = response.data)
            .catch(error => console.log(error.response.data));
        },
        deleteExpense: function(id, index){
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
                    axios.delete('api/expense/'+id)
                    .then(res =>{
                        if(res.status == 200){
                            this.getExpense();

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
                  expenseType : this.expenses,
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
