<div class="header header-auto-show header-fixed header-logo-center">
    <a href="/" class="header-title">Daily Expense</a>
    <a href="#" class="header-icon menu-toggle header-icon-1">
        <i class="fas fa-bars"></i>
    </a>
</div>

<div id="footer-bar" class="footer-bar-6">
    <router-link :to="{ name: 'adminGiveMoney'}"><i class="fa fa-plus"></i><span>Give Money</span></router-link>
    <router-link :to="{ name: 'adminExpenseList'}"><i class="fa fa-list-ul"></i><span>Expense List</span></router-link>
    <router-link :to="{ name: 'adminDashboard'}" class="circle-nav active-nav home_btn">
        <i class="fa fa-home"></i><span>Home</span>
        <strong><u></u></strong>
        <em></em>
    </router-link>
    <router-link :to="{ name: 'adminContact'}"><i class="fa fa-image"></i><span>Contact</span></router-link>
    <a href="#" class="menu-toggle"><i class="fa fa-bars"></i><span>Menu</span></a>
</div>

<div class="page-title page-title-fixed">
    <h1>Daily Expense</h1>
    <a href="#" class="page-title-icon menu-toggle shadow-xl bg-theme color-theme">
        <i class="fa fa-bars"></i>
    </a>
</div>
<div class="page-title-clear"></div>

<div id="menu-main" class="menu menu-box-left rounded-0" data-menu-width="280">
    <div class="card rounded-0 bg-6" data-card-height="150" style="height: 150px;">
        <div class="card-top">
            <a href="#" class="close-menu float-end me-2 text-center mt-3 icon-40 notch-clear"><i class="fa fa-times color-white"></i></a>
        </div>
        <div class="card-bottom">
            <h1 class="color-white ps-3 mb-n1 font-28">Daily Expense</h1>
            <h1 class="color-white ps-3 mb-n1 font-20">{{ Auth::user()->username }}</h1>
            <p class="mb-2 ps-3 font-12 color-white opacity-50">Welcome to expense management</p>
        </div>
        <div class="card-overlay bg-gradient"></div>
    </div>
    <div class="mt-4"></div>
    <h6 class="menu-divider">MENU</h6>
    <div class="list-group list-custom-small list-menu">
        <router-link :to="{ name: 'adminDashboard'}">
            <i class="fa fa-home gradient-red color-white"></i>
            <span>Home</span>
            <i class="fa fa-angle-right"></i>
        </router-link>

        <router-link :to="{ name: 'adminProfile'}">
            <i class="fa fa-user gradient-blue color-white"></i>
            <span>Profile</span>
            <i class="fa fa-angle-right"></i>
        </router-link>

        <router-link :to="{ name: 'adminProfile'}">
            <i class="fa fa-users gradient-brown color-white"></i>
            <span>Create Labour</span>
            <i class="fa fa-angle-right"></i>
        </router-link>

        <router-link :to="{ name: 'adminProfile'}">
            <i class="fa fa-users gradient-brown color-white"></i>
            <span>Create Manager</span>
            <i class="fa fa-angle-right"></i>
        </router-link>

        <router-link :to="{ name: 'adminProfile'}">
            <i class="fa fa-list gradient-brown color-white"></i>
            <span>Exopense History</span>
            <i class="fa fa-angle-right"></i>
        </router-link>

        <router-link :to="{ name: 'adminGiveMoney'}">
            <i class="fa fa-file gradient-blue color-white"></i>
            <span>Give Money</span> <i class="fa fa-angle-right"></i>
        </router-link>

        <router-link :to="{ name: 'adminExpenseList'}">
            <i class="fa fa-file gradient-blue color-white"></i>
            <span>Expense Lists</span> <i class="fa fa-angle-right"></i>
        </router-link>

        {{-- <a href="#">
            <i class="fa fa-file gradient-brown color-white"></i>
            <span>Pending Lists</span> <i class="fa fa-angle-right"></i>
        </a> --}}

        <router-link :to="{ name: 'adminNotification'}">
            <i class="fa fa-bell gradient-magenta color-white"></i>
            <span>Notification</span> <i class="fa fa-angle-right"></i>
        </router-link>

        {{-- <router-link :to="{ name: 'adminContact'}">
            <i class="fa fa-envelope gradient-teal color-white"></i>
            <span>Contact</span> <i class="fa fa-angle-right"></i>
        </router-link> --}}

        <a  href="{{ route('logout') }}"
            onclick="event.preventDefault(); confirm('sure!!') && document.getElementById('logout-form').submit();">
            <i class="fa fa-sign-out gradient-grass color-white"></i>
            <span>Log Out</span> <i class="fa fa-angle-right"></i>
        </a>
    </div>

</div>

<div class="menu-hider"></div>
