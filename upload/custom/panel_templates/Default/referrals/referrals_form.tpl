{include file='header.tpl'}

<body id="page-top">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    {include file='sidebar.tpl'}

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main content -->
        <div id="content">

            <!-- Topbar -->
            {include file='navbar.tpl'}

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">{$REFERRALS}</h1>
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                        <li class="breadcrumb-item active">{$REFERRALS}</li>
                    </ol>
                </div>

                <!-- Update Notification -->
                {include file='includes/update.tpl'}

                <div class="card shadow mb-4">
                    <div class="card-body">
                        <h5 style="display:inline">{$REFERRAL_TITLE}</h5>
                        <div class="float-md-right">
                            <a href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
                        </div>
                        <hr>

                        <!-- Success and Error Alerts -->
                        {include file='includes/alerts.tpl'}

                        <form role="form" action="" method="post">
                            <div class="form-group">
                                <label for="inputCode">{$CODE}</label>
                                <input type="text" name="code" class="form-control" id="inputCode" placeholder="{$CODE}" value="{$CODE_VALUE}">
                            </div>

                            <div class="form-group">
                                <label for="inputCustomUrl">{$CUSTOM_URL}</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon3">{$FULL_URL}</span>
                                    </div>
                                    <input type="text" name="custom_url" class="form-control" id="inputCustomUrl" placeholder="{$CUSTOM_URL}" value="{$CUSTOM_URL_VALUE}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputUser">User ID (Rewards will go to this user and he user can watch the statistics of this referral)</label>
                                <input type="number" name="user" class="form-control" id="inputUser" placeholder="User ID" value="{$USER_VALUE}">
                            </div>

                            <div class="form-group">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
                            </div>
                        </form>

                        <center><p>Referrals Module by <a href="https://partydragen.com/" target="_blank">Partydragen</a></br>Support on <a href="https://discord.gg/TtH6tpp" target="_blank">Discord</a></p></center>
                    </div>
                </div>

                <!-- Spacing -->
                <div style="height:1rem;"></div>

                <!-- End Page Content -->
            </div>

            <!-- End Main Content -->
        </div>

        {include file='footer.tpl'}

        <!-- End Content Wrapper -->
    </div>

    <!-- End Wrapper -->
</div>

{include file='scripts.tpl'}

</body>
</html>