<template>

	<v-dialog v-model="dialog" max-width="400">
        <v-card>
            <v-card-title class="subheading grey--text text-uppercase">Edit Accessories</v-card-title>

			<v-form @submit.prevent="submit">
	            <v-card-text>
	                <v-container py-0>
	                    <v-layout wrap>

	                  		<v-flex xs12>
	                    		<v-text-field label="Name" v-model="fields.name" prepend-icon="build" hide-details required></v-text-field>
	                    		<div v-if="errors && errors.name" class="caption red--text font-italic mt-1">{{ errors.name[0] }}</div>
	                  		</v-flex>
												<v-flex xs12>
													 <v-text-field label="Name" v-model="fields.price" prepend-icon="attach_money" hide-details required></v-text-field>
													 <div v-if="errors && errors.name" class="caption red--text font-italic mt-1">{{ errors.name[0] }}</div>
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
				loading: false
            }
        },
        created() {
        	eventBus.$on('openEditUserDialog', (data) => {
        		this.dialog = data.dialog
        		this.fields.id = data.user.id
        		this.fields.name = data.user.name
						this.fields.price = data.user.price

        	})
        },
		methods: {
		    submit() {
			    if (this.fields.id) {
			        this.loading = true
			        this.errors = {}
			        axios.put('/updateaccessories', this.fields).then(response => {
			          this.fields = {}
			          this.loading = false
			          this.pushUpdatedUser(response.data)
			          this.dialog = false
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
            pushUpdatedUser(updated) {
                eventBus.$emit('pushUpdatedUser',updated)
            }
		 },
    }
</script>
