<template>

	<v-dialog v-model="dialog" max-width="400">
        <v-card>
            <v-card-title class="subheading grey--text text-uppercase">Edit Leave</v-card-title>

			<v-form @submit.prevent="submit">
	            <v-card-text>
	                <v-container py-0>
	                    <v-layout wrap>
												<v-flex xs12>
													 <v-select :items="roles" label="Name" v-model="fields.role" prepend-icon="check_circle_outline"></v-select>
												</v-flex>

												<v-flex xs12>
													<v-menu
																ref="menu"
																v-model="menu"
																:close-on-content-click="false"
																:return-value.sync="date"
																transition="scale-transition"
																offset-y
																min-width="290px"
															>
																<template v-slot:activator="{ on }">
																	<v-text-field
																		v-model="date"
																		label="Picker in menu"
																		prepend-icon="event"
																		readonly
																		v-on="on"
																	></v-text-field>
																</template>
																<v-date-picker v-model="date" no-title scrollable>
																	<v-spacer></v-spacer>
																	<v-btn text color="primary" @click="menu = false">Cancel</v-btn>
																	<v-btn text color="primary" @click="$refs.menu.save(date)">OK</v-btn>
																</v-date-picker>
															</v-menu>

												</v-flex>

												<v-flex xs12>
													 <v-select :items="roles" label="Leave Type" v-model="fields.role" prepend-icon="check_circle_outline"></v-select>
												</v-flex>

												<v-flex xs12>
													 <v-select :items="roles" label="Leave Status" v-model="fields.role" prepend-icon="check_circle_outline"></v-select>
												</v-flex>

												<v-flex xs12>
													<v-textarea
				 prepend-inner-icon="comment"
				 class="mx-2"
				 label="Reason"
				 rows="1"
			 ></v-textarea>
													<div v-if="errors && errors.company" class="caption red--text font-italic mt-1">{{ errors.name[0] }}</div>
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

					roles: [],
					date: new Date().toISOString().substr(0, 10),
			      menu: false,
            }
        },
        created() {
        	eventBus.$on('openEditUserDialog', (data) => {
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
						pushUpdatedUser(updated) {
								eventBus.$emit('pushUpdatedUser',updated)
						}
		 }
    }
</script>
