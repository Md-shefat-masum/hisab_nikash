import admin from "./components/admin/admin.vue";
import adminContact from "./components/admin/contact.vue";
import adminDashboard from "./components/admin/dashboard.vue";
// admin
import giveMoney from "./components/admin/giveMoney.vue";
import allProject from "./components/admin/allProject.vue";
import createProject from "./components/admin/createProject.vue";
import createLabour from "./components/admin/createLabour.vue";
import createManager from "./components/admin/createManager.vue";
import updateGiveMoney from "./components/admin/updateGiveMoney.vue";
import adminExpenseList from "./components/admin/adminExpenseList.vue";
import adminNotification from "./components/admin/notification.vue";
//employee
import addExpense from "./components/employee/addExpense.vue";
import contact from "./components/employee/contact.vue";
import employeeDashboard from "./components/employee/dashboard.vue";
import employee from "./components/employee/employee.vue";
import expenseList from "./components/employee/expenseList.vue";
import notification from "./components/employee/notification.vue";
import profile from "./components/employee/profile.vue";
import userUpdateExpense from "./components/employee/userUpdateExpense.vue";

const routes = [

        {
            path: '/employee',
            component: employee,
            children: [
                { path: '',name:'employeeDashboard', component: employeeDashboard },
                { path: 'add-expense',name:'addExpense', component: addExpense },
                { path: 'update-expense/:id',name:'userUpdateExpense', component: userUpdateExpense },
                { path: 'expense-list',name:'userExpenseList', component: expenseList },
                { path: 'contact',name:'employeeContact', component: contact },
                { path: 'notification',name:'employeeNotificaion', component: notification },
                { path: 'profile',name:'employeeProfile', component: profile },
            ]
        },

        {
            path: '/admin',
            component: admin,
            children: [
                { path: '',name:'adminDashboard', component: adminDashboard },
                { path: 'give-money',name:'adminGiveMoney', component: giveMoney },
                { path: 'update-given-money/:id',name:'updateAdminGiveMoney', component: updateGiveMoney },
                { path: 'expense-list',name:'adminExpenseList', component: adminExpenseList },
                { path: 'contact',name:'adminContact', component: adminContact },
                { path: 'notification',name:'adminNotification', component: adminNotification },
                { path: 'profile',name:'adminProfile', component: profile },

                { path: 'all-project',name:'adminAllProject', component: allProject },
                { path: 'create-project',name:'adminCreateProject', component: createProject },
                { path: 'create-manpower',name:'adminCreateLabour', component: createLabour },
                { path: 'create-manager',name:'adminCreateManager', component: createManager },
            ]
        }
]

export default routes;
