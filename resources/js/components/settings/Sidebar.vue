<template>
    <div class="settings-sidebar">
<div v-if="$can('admin-settings')">
        <v-container>
        <v-list class="pa-0 list-items" dense>
            <v-list-tile
                v-for="item in admin"
                :key="item.title"
                router-link :to="item.route"
            >
                <v-list-tile-action>
                    <v-icon>{{ item.icon }}</v-icon>
                </v-list-tile-action>

                <v-list-tile-content>
                    <v-list-tile-title class="body-2">{{ item.title }}</v-list-tile-title>
                </v-list-tile-content>

            </v-list-tile>
        </v-list>
        </v-container>
</div>
<div v-else >
        <v-container>
        <v-list class="pa-0 list-items" dense>
            <v-list-tile
                v-for="item in other"
                :key="item.title"
                router-link :to="item.route"
            >
                <v-list-tile-action>
                    <v-icon>{{ item.icon }}</v-icon>
                </v-list-tile-action>

                <v-list-tile-content>
                    <v-list-tile-title class="body-2">{{ item.title }}</v-list-tile-title>
                </v-list-tile-content>

            </v-list-tile>
        </v-list>
        </v-container>

</div>


    </div>
</template>

<script>
    export default {
        name: 'settings-sidebar',
        data () {
            return {
                admin: [
                    {
                        title: 'Profile',
                        icon: 'person',
                        route: '/settings/profile'
                    },
                /*    {
                        title: 'Upload Gallery',
                        icon: 'cloud_upload',
                        route: '/settings/upload-gallery'
                    },
                    */
                    {
                        title: 'Skill',
                        icon: 'settings',
                        route: '/settings/Skill'
                    },
                    {
                        title: 'Category',
                        icon: 'settings',
                        route: '/settings/Category'
                    },

                    {
                        title: 'Sub Category',
                        icon: 'settings',
                        route: '/settings/Sub-category'
                    },

                    {
                        title: 'Tools',
                        icon: 'settings',
                        route: '/settings/Tools'
                    },

                    {
                        title: 'Accessories',
                        icon: 'settings',
                        route: '/settings/Accessories'
                    },

                    {
                        title: 'Expense Type',
                        icon: 'settings',
                        route: '/settings/Expensetype'
                    },
                ],

                other: [
                    {
                        title: 'Profile',
                        icon: 'person',
                        route: '/settings/profile'
                    },

                ]
            }
        }
    }
</script>

<style lang="scss" scoped>
    .list-items {
        border-top: 1px solid #e1e1e1;
        border-right: 1px solid #e1e1e1;
    }
    .list-items > div {
        border-bottom: 1px solid #e1e1e1;
    }

    .list-items > div:nth-child(3n) {
        border-left: 3px solid teal;
    }
    .list-items > div:nth-child(3n+1) {
        border-left: 3px solid tomato;
    }
    .list-items > div:nth-child(3n+2) {
        border-left: 3px solid green;
    }
</style>
