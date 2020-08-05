<template>

	<v-dialog v-model="dialog" max-width="400">
        <v-card>
            <v-card-title class="subheading grey--text text-uppercase">Add New Expense</v-card-title>

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

												 <v-text-field label="Select Image" @click='pickFile' v-model='imageName' prepend-icon='attach_file'></v-text-field>
												 <input type="file" style="display: none" ref="image" accept="image/*" @change="onFilePicked">

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
							imageName: '',
							imageUrl: '',
							imageFile: '',
            	fields: {},
				errors: {},
				loading: false,
				expenseType:[]

            }
        },
        created() {
        	eventBus.$on('openCreateUserDialog', (data) => {
			   	this.dialog = data.dialog

					let expensetype = []
					data.expenseType.map( (item) => { expensetype.push(item['name']) })
					this.expenseType = expensetype


        	})

        },
		methods: {
		pickFile () {
					 this.$refs.image.click ()
			 },
			 onFilePicked (e) {
			const files = e.target.files
			if(files[0] !== undefined) {
				this.imageName = files[0].name
				if(this.imageName.lastIndexOf('.') <= 0) {
					return
				}
				const fr = new FileReader ()
				fr.readAsDataURL(files[0])
				fr.addEventListener('load', () => {

					this.imageFile = files[0] // this is an image file that can be sent to server...
				})
			} else {
				this.imageName = ''
				this.imageFile = ''

			}
		},
		    submit() {
				if (true) {
						this.loading = true
						this.errors = {}
						axios.post('/storexpense', this.fields).then(response => {
							this.fields = {}
							this.loading = false
							this.pushUserData(response.data)
							this.getExpense();
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
            }
		 },
    }
</script>
