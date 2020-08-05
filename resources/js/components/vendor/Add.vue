<template>

	<v-dialog v-model="dialog" max-width="900">
        <v-card>
            <v-card-title class="subheading grey--text text-uppercase">Add New Vendor</v-card-title>

			<v-form @submit.prevent="submit">
	            <v-card-text>
	                <v-container py-0>
	                    <v-layout wrap>

	                  		<v-flex xs6>
	                    		<v-text-field label="Company Name" v-model="fields.company" prepend-icon="check_circle_outline" hide-details required></v-text-field>
	                    		<div v-if="errors && errors.company" class="caption red--text font-italic mt-1">{{ errors.company[0] }}</div>
	                  		</v-flex>
												<v-flex xs6>
													<v-text-field label="Person Name" v-model="fields.person" prepend-icon="check_circle_outline" hide-details required></v-text-field>
													<div v-if="errors && errors.person" class="caption red--text font-italic mt-1">{{ errors.person[0] }}</div>
												</v-flex>
												<v-flex xs6>
													 <v-text-field label="Contact Email 1" v-model="fields.email1" prepend-icon="check_circle_outline" hide-details required></v-text-field>
													 <div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email1[0] }}</div>
												 </v-flex>
												 <v-flex xs6>
 													 <v-text-field label="Contact Email 2" v-model="fields.email2" prepend-icon="check_circle_outline" hide-details required></v-text-field>
 													 <div v-if="errors && errors.email2" class="caption red--text font-italic mt-1">{{ errors.email2[0] }}</div>
 												 </v-flex>
												 <v-flex xs6>
													 <v-text-field label="Contact Phone 1" v-model="fields.phone1" prepend-icon="check_circle_outline" hide-details required></v-text-field>
													 <div v-if="errors && errors.phone1" class="caption red--text font-italic mt-1">{{ errors.phone1[0] }}</div>
												 </v-flex>

												 <v-flex xs6>
														<v-text-field label="Contact Phone 2" v-model="fields.phone2" prepend-icon="check_circle_outline" hide-details required></v-text-field>
														<div v-if="errors && errors.phone2" class="caption red--text font-italic mt-1">{{ errors.phone2[0] }}</div>
													</v-flex>

													<v-flex xs6>
														 <v-text-field label="Street 1" v-model="fields.street1" prepend-icon="check_circle_outline" hide-details required></v-text-field>
														 <div v-if="errors && errors.street1" class="caption red--text font-italic mt-1">{{ errors.street1[0] }}</div>
													 </v-flex>

													 <v-flex xs6>
															<v-text-field label="Street 2" v-model="fields.street2" prepend-icon="check_circle_outline" hide-details required></v-text-field>
															<div v-if="errors && errors.street2" class="caption red--text font-italic mt-1">{{ errors.street2[0] }}</div>
														</v-flex>


														<v-flex xs6>
												 			<v-text-field label="About Company" v-model="fields.about" prepend-icon="check_circle_outline" hide-details required></v-text-field>
												 			<div v-if="errors && errors.about" class="caption red--text font-italic mt-1">{{ errors.about[0] }}</div>
												 		</v-flex>


															<v-flex xs6>
																 <v-text-field label="zip" v-model="fields.zip" prepend-icon="check_circle_outline" hide-details required></v-text-field>
																 <div v-if="errors && errors.zip" class="caption red--text font-italic mt-1">{{ errors.zip[0] }}</div>
															 </v-flex>


															 <v-flex xs6>
														 	 <v-select :items="state" label="State" v-model="fields.state" prepend-icon="check_circle_outline" @change="selectCity(fields.state)"></v-select>
														  </v-flex>


																	<v-flex xs6>
																	 <v-select :items="city" label="City" v-model="fields.city" prepend-icon="check_circle_outline"></v-select>
																 </v-flex>


	                  </v-layout>
	              </v-container>
	            </v-card-text>

	            <v-card-actions>
	                <v-spacer></v-spacer>

	                <v-btn color="red" flat="flat" @click="closeDialog">
	                    Close
	                </v-btn>

	                <v-btn color="green" flat="flat" :loading="loading" @click="submit">
	                    Save
	                </v-btn>
	            </v-card-actions>
            </v-form>

        </v-card>
    </v-dialog>

</template>

<script>
    export default {


        data() {
            return {
            	dialog: false,
            	fields: {},
				errors: {},
				roles:[],
				loading: false,
				city: [],
				state:[]
            }
        },


        created() {
        	eventBus.$on('openCreateVendorDialog', (data) => {
				  this.dialog = data.dialog

					let cityname = []
					data.city.map( (item) => { cityname.push(item['name']) })
					this.city = cityname

					let statename = []
					data.state.map( (item) => { statename.push(item['name']) })
					this.state = statename


        	})
        },


		methods: {

		    submit()
				{

    if (true) {
				this.loading = true
				this.errors = {}
				axios.post('/storevendor', this.fields).then(response => {
					this.fields = {}
					this.loading = false
					this.pushUserData(response.data)
					this.getVendors();
				}).catch(error => {
						this.loading = false
						if (error.response.status === 422) {
							this.errors = error.response.data.errors || {}
						}
				})

}
				},

		    closeDialog() {
		    	this.dialog = false
		    	this.errors = {}
		    },
            pushUserData(userData) {
                eventBus.$emit('pushUserData',userData)
            },


		 },



    }
</script>
