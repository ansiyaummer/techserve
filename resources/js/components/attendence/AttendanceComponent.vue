<template>
    <v-container>
        <v-layout row>
            <v-flex xs12 smxs12 >
                <v-card-title style="padding:0px;">
                 <div v-show="this.$session.get('signIn')!=1">
                    <v-btn small flat outline color="green" @click="checkin()">
                        <v-icon left small>add_circle</v-icon>
                        <span class="caption">Sign in</span>
                    </v-btn>
                  </div>
                   <div v-show="this.$session.get('signIn')!=0">
                    <v-btn small flat outline color="green" @click="checkout()">
                        <v-icon left small>add_circle</v-icon>
                        <span class="caption">Sign Out</span>
                    </v-btn>
                  </div>
{{ this.$session.getAll()}}
                    <v-spacer></v-spacer>
                    <v-text-field
                    append-icon="search"
                    single-line
                    v-model="search" style="padding:16px;display:flex;"
                    ></v-text-field>
                </v-card-title>
                <template>
                                  <v-data-table  v-bind:headers="headers" :items="attendance" v-bind:search="search" class="elevation-1">
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
                                          <td class="text-xs-left">{{ props.item.in_time }}</td>
                                          <td class="text-xs-left">{{ props.item.out_time }}</td>
                                            <td class="text-xs-left">{{ props.item.workhour }}</td>
                                          <td class="text-xs-left">{{ props.item.date }}</td>



                                          <td class="text-xs-left">
                                              <!-- <v-btn class="primary" small :href="'/student/edit/'+props.item.id">Edit</v-btn> -->
                                              <v-btn flat small fab outline color="red" :href="'/student/delete/'+props.item.id" class="right"@click.prevent="deleteLeave(props.item.id)">
                                                  <v-icon>delete</v-icon>
                                              </v-btn>
                                              <v-btn flat small fab outline color="blue" class="right" :to="'/student/edit/'+props.item.id">
                                                  <v-icon small>edit</v-icon>
                                              </v-btn>
                                          </td>
                                      </template>
                                  </v-data-table>
                              </template>


            </v-flex>
        </v-layout>
    </v-container>
</template>



<script>
import swal from 'sweetalert';
  export default {

    data () {
          return {
              search: '',
              headers: [
              { text: 'Name', value: 'username',align: 'left' },
              { text: 'Check In', value: 'checkin',align: 'left' },
              { text: 'Check Out', value: 'Checkout',align: 'left' },
              { text: 'Work Hour', value: 'Work',align: 'left' },
              { text: 'Date', value: 'date',align: 'left' },
              { text: 'Actions', value: 'actions' ,align: 'left'},

              ],
              attendance : [ ],
              signIn:false,
              signOut:false,
              session_id:'',


          };
      },
      created: function() {
          this.getAttendance();

      },
    methods: {


  checkin: function()
  {

    axios.post('api/checkin', {

    })
    .then((response) => {
      this.$session.start()
      this.$session.set('signIn',1)
      this.getAttendance();
      swal("You Are Sign In","success");
    }, (error) => {
      console.log(error);
    });
  },

  checkout :function()
  {
    axios.post('checkout/',
  {
    session_id : this.$session.id()
  })
                      .then(function (resp) {
                        this.getAttendance();
                        swal("You Are Sign Out","success");
                      })
                      .catch(function (resp) {
        console.log(error);

                      });
  },


   getAttendance: function(){
       axios.get('api/attendance')
       .then(response => this.attendance = response.data)
       .catch(error => console.log(error.response.data));
   },

  signInDialog: function (event) {
swal("You Are Sign In","success");
},

  signOutDialog: function (event) {
swal("You are Sign Out","success");
}



}
}
</script>
