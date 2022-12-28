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
                        <h3 style="display:inline;">{$REFERRALS}</h3>
                        <span class="float-md-right"><a href="{$NEW_REFERRAL_LINK}" class="btn btn-primary">{$NEW_REFERRAL}</a></span>
                        <hr>

                        <!-- Success and Error Alerts -->
                        {include file='includes/alerts.tpl'}
                        
                        <form role="form" action="" method="post">
                            <div class="form-group">
                                <label for="inputCreditsRegistration">Reward referral owner for validated registrations with Store Credits</label>
                                <input type="number" name="credits_registration" class="form-control" id="inputCreditsRegistration" step="0.01" min="0.00" value="{$CREDITS_REGISTRATION_VALUE}">
                            </div>

                            <div class="form-group">
                                <label for="inputCreditsSale">Reward referral owner with a percentage if referral user buy something from the store</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon3">%</span>
                                    </div>
                                    <input type="number" name="credits_sale" class="form-control" id="inputCreditsSale" step="0.01" min="0.00" value="{$CREDITS_SALE_VALUE}">
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
                            </div>
                        </form>
                        
                        <hr>
                        
                        {if isset($REFERRALS_LIST)}
                            <div class="table-responsive">
                                <table class="table table-borderless table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Code</th>
                                            <th>User</th>
                                            <th>Views</th>
                                            <th>Total Registrations</th>
                                            <th>Active Users (7 Days)</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach from=$REFERRALS_LIST item=referral}
                                        <tr>
                                            <td>{$referral.id}</td>
                                            <td><code>{$referral.code}</code></td>
                                            <td>{$referral.username}</td>
                                            <td>{$referral.views}</td>
                                            <td>{$referral.total_registrations}</td>
                                            <td>{$referral.active_users}</td>
                                            <td>
                                                <div class="float-md-right">
                                                    <a class="btn btn-warning btn-sm" href="{$referral.edit_link}"><i class="fas fa-edit fa-fw"></i></a>
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="showDeleteModal('{$referral.id}')"><i class="fas fa-trash fa-fw"></i></button>
                                                </div>
                                            </td>
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        {else}
                            {$NO_REFERRALS}
                        {/if}
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
    
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$CONFIRM_DELETE_NEWSLETTER}
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="deleteId" value="">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                    <button type="button" onclick="deleteNewsletter()" class="btn btn-primary">{$YES}</button>
                </div>
             </div>
        </div>
    </div>

    <!-- End Wrapper -->
</div>

{include file='scripts.tpl'}

<script type="text/javascript">
    function showDeleteModal(id) {
        $('#deleteId').attr('value', id);
         $('#deleteModal').modal().show();
    }

    function deleteNewsletter() {
        const id = $('#deleteId').attr('value');
        if (id) {
            const response = $.post("{$DELETE_LINK}", { id, action: 'delete', token: "{$TOKEN}" });
            response.done(function () { window.location.reload(); });
        }
    }
</script>

</body>
</html>