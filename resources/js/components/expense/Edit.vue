<template>

	<v-dialog v-model="dialog" max-width="400">
        <v-card>
            <v-card-title class="subheading grey--text text-uppercase">Edit Expense</v-card-title>

			<v-form @submit.prevent="submit">
	            <v-card-text>
								<v-container py-0>
										<v-layout wrap>

											<v-flex xs6>
												<v-text-field label="Name" v-model="fields.name" prepend-icon="check_circle_outline" hide-details required></v-text-field>
												<div v-if="errors && errors.company" class="caption red--text font-italic mt-1">{{ errors.name[0] }}</div>
											</v-flex>
											<v-flex xs6>
												<v-text-field label="Price" v-model="fields.email" prepend-icon="check_circle_outline" hide-details required></v-text-field>
												<div v-if="errors && errors.person" class="caption red--text font-italic mt-1">{{ errors.email[0] }}</div>
											</v-flex>

											 <v-flex xs6>
												 <v-text-field label="Upload a File" @click="" v-model="uploadFileName" prepend-icon="attach_file"></v-text-field>
												 <input type="file" ref="file" @change="" style="display:none;">
											 </v-flex>

											 <v-flex xs6>
											 <v-select :items="expenseType" label="Expense Type" v-model="fields.expenseType" prepend-icon="check_circle_outline"></v-select>
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
				uploadFileName:[],
				expenseType:[]

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
		 },
    }
</script>
