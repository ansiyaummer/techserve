import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import DashboardComponent from '../components/DashboardComponent.vue'

import AttendanceComponent from '../components/attendence/AttendanceComponent.vue'
import ExpenseComponent from '../components/expense/ExpenseComponent.vue'
import LeaveComponent from '../components/leave/LeaveComponent.vue'

import VendorComponent from '../components/vendor/VendorComponent.vue'
import AddVendorComponent from '../components/vendor/Add.vue'

import WorkComponent from '../components/work/WorkComponent.vue'
import JobsComponent from '../components/jobs/JobsComponent.vue'

import UsersComponent from '../components/UsersComponent.vue'
import RolePermissionList from '../components/RolePermissionList.vue'
import ChatComponent from '../components/ChatComponent.vue'
import SettingsComponent from '../components/SettingsComponent.vue'
import GeneralSettings from '../components/settings/GeneralSettings.vue'
import UserProfile from '../components/settings/UserProfile.vue'
import UploadGallery from '../components/settings/UploadGallery.vue'
import Skill from '../components/settings/Skill.vue'
import Category from '../components/settings/Category.vue'
import Subcategory from '../components/settings/Subcategory.vue'
import ExpenseType from '../components/settings/Expensetype.vue'
import Accessories from '../components/settings/Accessories.vue'
import Tools from '../components/settings/Tools.vue'


const router = new VueRouter({
    mode: 'history',
    routes: [{
            path: '/home',
            name: 'dashboard',
            component: DashboardComponent,
        },

        {
                path: '/expense',
                name: 'expense',
                component: ExpenseComponent,
            },

            {
                    path: '/work',
                    name: 'work',
                    component: WorkComponent,
                },

                {
                        path: '/jobs',
                        name: 'jobs',
                        component: JobsComponent,
                    },

            {
                    path: '/attendance',
                    name: 'attendance',
                    component: AttendanceComponent,
                },

                {
                        path: '/leave',
                        name: 'leave',
                        component: LeaveComponent,
                    },

                    {
                            path: '/vendor',
                            name: 'vendor',
                            component: VendorComponent,
                        },
                       {
                        path: '/vendor/add',
                        name: 'addvendor',
                        component:  AddVendorComponent,
                      },

        {
            path: '/users',
            name: 'users',
            component: UsersComponent,
        },
        {
            path: '/roles-permissions',
            name: 'roles-permissions',
            component: RolePermissionList,
        },
        {
            path: '/chat',
            name: 'chat',
            component: ChatComponent,
        },
        {
            path: '/settings',
            name: 'settings',
            component: SettingsComponent,
            children: [{
                    path: 'profile',
                    name: 'userprofile',
                    component: UserProfile
                },
                {
                    path: 'upload-gallery',
                    name: 'upload-gallery',
                    component: UploadGallery
                },
                {
                    path: 'skill',
                    name: 'skill',
                    component: Skill
                },
                {
                    path: 'category',
                    name: 'category',
                    component: Category
                },

                {
                    path: 'Sub-category',
                    name: 'subcategory',
                    component: Subcategory
                },

                {
                    path: 'tools',
                    name: 'tools',
                    component: Tools
                },

                {
                    path: 'Accessories',
                    name: 'Accessories',
                    component: Accessories
                },

                {
                    path: 'Expensetype',
                    name: 'Expense Type',
                    component: ExpenseType
                },


            ]
        },
    ],
})

export default router
