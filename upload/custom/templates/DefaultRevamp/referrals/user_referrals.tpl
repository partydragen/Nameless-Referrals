{include file='header.tpl'}
{include file='navbar.tpl'}

<h2 class="ui header">
    {$TITLE}
</h2>

{if isset($SUCCESS)}
    <div class="ui success icon message">
        <i class="check icon"></i>
        <div class="content">
            {$SUCCESS}
        </div>
    </div>
{/if}

{if isset($ERRORS)}
    <div class="ui negative icon message">
        <i class="x icon"></i>
        <div class="content">
            {foreach from=$ERRORS item=error}
                {$error}<br />
            {/foreach}
        </div>
    </div>
{/if}

<div class="ui stackable grid" id="user">
    <div class="ui centered row">
        <div class="ui six wide tablet four wide computer column">
            {include file='user/navigation.tpl'}
        </div>
        <div class="ui ten wide tablet twelve wide computer column">
            <div class="ui segment">
                <h3 class="ui header">{$REFERRALS}</h3>

                {nocache}
                    {if isset($REFERRALS_LIST)}
                        <table class="ui fixed single line selectable unstackable small padded res table">
                            <thead>
                                <tr>
                                    <th width="60%">{$REFERRAL_LINK}</th>
                                    <th width="20%">{$VIEWS}</th>
                                    <th width="20%">{$REGISTRATIONS}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$REFERRALS_LIST item=referral}
                                    <tr>
                                        <td width="80%">{$referral.full_link}</td>
                                        <td width="10%">{$referral.views}</td>
                                        <td width="10%">{$referral.total_registrations}</td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    {else}
                        <div class="ui info message">
                            <div class="content">
                                <center>
                                    {$NO_REFERRAL}</br>
                                    <form class="ui form" action="" method="post" id="create-referral">
                                        <input type="hidden" name="action" value="create_referral">
                                        <input type="hidden" name="token" value="{$TOKEN}">
                                        <input type="submit" value="{$NEW_REFERRAL}" class="ui mini blue button">
                                    </form>
                                </center>
                            </div>
                        </div>
                    {/if}
                {/nocache}
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}