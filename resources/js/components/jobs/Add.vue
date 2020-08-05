<template>

	<v-dialog v-model="dialog" max-width="900">
        <v-card>
            <v-card-title class="subheading grey--text text-uppercase">Add New Job</v-card-title>

			<v-form @submit.prevent="submit">

			<v-card-text>
					<v-container py-0>
							<h4>BASIC DETAILS</h4>
							<v-layout wrap>

								<v-flex xs4>
									<v-text-field label="Customer Name" v-model="fields.name" prepend-icon="check_circle_outline" hide-details required></v-text-field>
									<div v-if="errors && errors.company" class="caption red--text font-italic mt-1">{{ errors.name[0] }}</div>
								</v-flex>
								<v-flex xs4>
									<v-select :items="roles" label="Contract Type" v-model="fields.role" prepend-icon="check_circle_outline"></v-select>
									<div v-if="errors && errors.person" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
								</v-flex>
								<v-flex xs4>
									 <v-text-field label="Mobile" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
									 <div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
								 </v-flex>


						</v-layout>
				</v-container>
							</v-card-text>
			<v-card-text>
				<v-container py-0>
						<h4>JOB DETAILS</h4>
						<v-layout wrap>

							<v-flex xs6>
								<v-select :items="roles" label="Job Type" v-model="fields.role" prepend-icon="check_circle_outline"></v-select>
								<div v-if="errors && errors.company" class="caption red--text font-italic mt-1">{{ errors.name[0] }}</div>
							</v-flex>
							<v-flex xs6>

	<v-select :items="roles" label="Priority" v-model="fields.role" prepend-icon="check_circle_outline"></v-select>
								<div v-if="errors && errors.person" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
							</v-flex>
							<v-flex xs6>
								 <v-text-field label="Category" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
								 <div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
							 </v-flex>

							 <v-flex xs6>
									<v-text-field label="Sub Category" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
									<div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
								</v-flex>


								<v-flex xs6>
				 					<v-text-field label="Problem" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
				 					<div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
				 				</v-flex>

								<v-flex xs6>
									<v-text-field label="Problem Description" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
									<div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
								</v-flex>

					</v-layout>
			</v-container>

			</v-card-text>

			<v-card-text>
				<v-container py-0>
						<h4>Technician Details</h4>
						<v-layout wrap>
						<v-flex xs4>
							<v-select :items="roles" label="Assign To" v-model="fields.role" prepend-icon="check_circle_outline"></v-select>
							<div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
						</v-flex>

						<v-flex xs4>
							<v-text-field label="Assistants" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
							<div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
						</v-flex>

												<v-flex xs4>
													<v-text-field label="Assistant Time Duration" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
													<div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
												</v-flex>

						<v-flex xs4>
							<v-text-field label="Appointment Time" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
							<div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
						</v-flex>

						<v-flex xs4>
							<v-text-field label="Charge" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
							<div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
						</v-flex>
						</v-layout>
				</v-container>

				</v-card-text>


				<v-card-text>
					<v-container py-0>
							<h4>General Details</h4>
							<v-layout wrap>

										<v-flex xs6>
	<v-select :items="roles" label="Accessories" v-model="fields.role" prepend-icon="check_circle_outline"></v-select>
                    </v-flex>
				<v-flex xs6>
	<v-text-field label="Price" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
       </v-flex>

							</v-layout>
					</v-container>

					</v-card-text>

					<v-card-text>
						<v-container py-0>
								<h4>Address Details</h4>
								<v-layout wrap>

								<v-flex xs6>
									<v-text-field label="Address *" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
									<div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
								</v-flex>

								<v-flex xs6>
									<v-select :items="roles" label="State" v-model="fields.role" prepend-icon="check_circle_outline"></v-select>
									<div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
								</v-flex>

								<v-flex xs6>
									<v-text-field label="Street" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
									<div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
								</v-flex>


								<v-flex xs6>
							<v-select :items="roles" label="Status" v-model="fields.role" prepend-icon="check_circle_outline"></v-select>
									<div v-if="errors && errors.email1" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
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
				loading: false,

            }
        },
        created() {
        	eventBus.$on('openCreateUserDialog', (data) => {
				this.dialog = data.dialog


        	})
        },
		methods: {
		    submit() {

		    },
		    closeDialog() {
		    	this.dialog = false
		    	this.errors = {}
		    },
            pushUserData(userData) {
                eventBus.$emit('pushUserData',userData)
            }
		 },
    }
</script>
