<?php
/* Smarty version 3.1.30, created on 2019-04-29 23:41:22
  from "/var/www/reservaespacios/html/booked/tpl/Reservation/approve.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cc76f82458637_55319957',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '19d29145ff188189a0851ff8d075f306389c7bbf' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/Reservation/approve.tpl',
      1 => 1549397012,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:Reservation/view.tpl' => 1,
    'file:globalheader.tpl' => 1,
  ),
),false)) {
function content_5cc76f82458637_55319957 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>



<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_12314681365cc76f824295f4_63170190', 'header');
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_15486092705cc76f8242c7f1_36833293', 'reservationHeader');
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_17082186595cc76f82448273_69279455', 'deleteButtons');
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_12071388375cc76f82454f62_40181810', 'submitButtons');
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_3258148405cc76f82457d56_84580642', "ajaxMessage");
$_smarty_tpl->inheritance->endChild();
$_smarty_tpl->_subTemplateRender("file:Reservation/view.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 2, false);
}
/* {block 'header'} */
class Block_12314681365cc76f824295f4_63170190 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<?php $_smarty_tpl->_subTemplateRender("file:globalheader.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('TitleKey'=>'EditReservationHeading'), 0, false);
?>

<?php
}
}
/* {/block 'header'} */
/* {block 'reservationHeader'} */
class Block_15486092705cc76f8242c7f1_36833293 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>"EditReservationHeading"),$_smarty_tpl);?>

<?php
}
}
/* {/block 'reservationHeader'} */
/* {block 'deleteButtons'} */
class Block_17082186595cc76f82448273_69279455 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div class="btn-group">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'More'),$_smarty_tpl);?>
 <span class="caret"></span>
		</button>

		<ul class="dropdown-menu" role="menu">
			<li>
				<?php ob_start();
echo Pages::CALENDAR_EXPORT;
$_prefixVariable1=ob_get_clean();
ob_start();
echo QueryStringKeys::REFERENCE_NUMBER;
$_prefixVariable2=ob_get_clean();
$_smarty_tpl->_assignInScope('icsUrl', ((string)$_smarty_tpl->tpl_vars['Path']->value)."export/".$_prefixVariable1."?".$_prefixVariable2."=".((string)$_smarty_tpl->tpl_vars['ReferenceNumber']->value));
?>
				<a href="<?php echo $_smarty_tpl->tpl_vars['icsUrl']->value;?>
" download="<?php echo $_smarty_tpl->tpl_vars['icsUrl']->value;?>
">
					<span class="fa fa-calendar"></span>
					<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'AddToOutlook'),$_smarty_tpl);?>
</a>
			</li>
			<li><a href="#" class="btnPrint">
					<span class="fa fa-print"></span>
					<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Print'),$_smarty_tpl);?>
</a>
			</li>
		</ul>
	</div>

    <div id="deleteButtonPrompt" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="updateButtonsLabel"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Reject'),$_smarty_tpl);?>
</h4>
                </div>
                <div class="modal-body">
                    <div><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'DeleteReminderWarning'),$_smarty_tpl);?>
</div>
                    <div>
                        <label for="deleteReason"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Reason'),$_smarty_tpl);?>
 (<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Optional'),$_smarty_tpl);?>
)</label>
                        <textarea id="deleteReason" class="form-control"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['cancel_button'][0][0]->CancelButton(array('id'=>"cancelDelete",'class'=>"cancel"),$_smarty_tpl);?>

                    <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['delete_button'][0][0]->DeleteButton(array('id'=>"confirmDelete",'class'=>"delete save",'key'=>'Reject'),$_smarty_tpl);?>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="updateButtons" tabindex="-1" role="dialog" aria-labelledby="updateButtonsLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="updateButtonsLabel"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ApplyUpdatesTo'),$_smarty_tpl);?>
</h4>
                </div>
                <div class="modal-body">
                    <div id="deleteRecurringButtons" class="no-show margin-bottom-15">
                        <div><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'DeleteReminderWarning'),$_smarty_tpl);?>
</div>
                        <div>
                            <label for="deleteReasonRecurring"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Reason'),$_smarty_tpl);?>
 (<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Optional'),$_smarty_tpl);?>
)</label>
                            <textarea id="deleteReasonRecurring" class="form-control"></textarea>
                        </div>
                    </div>
                    <button type="button" class="btn btn-success save btnUpdateThisInstance">
                        <span class="fa fa-check"></span>
                        <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ThisInstance'),$_smarty_tpl);?>

                    </button>
                    <button type="button" class="btn btn-success save btnUpdateAllInstances">
                        <span class="fa fa-check-square"></span>
                        <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'AllInstances'),$_smarty_tpl);?>

                    </button>
                    <button type="button" class="btn btn-success save btnUpdateFutureInstances">
                        <span class="fa fa-check-square-o"></span>
                        <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'FutureInstances'),$_smarty_tpl);?>

                    </button>
                    <button type="button" class="btn btn-default">
                        <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Cancel'),$_smarty_tpl);?>

                    </button>
                </div>
            </div>
        </div>
    </div>

<?php
}
}
/* {/block 'deleteButtons'} */
/* {block 'submitButtons'} */
class Block_12071388375cc76f82454f62_40181810 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<a href="<?php echo $_smarty_tpl->tpl_vars['SCRIPT_NAME']->value;?>
?<?php echo QueryStringKeys::REFERENCE_NUMBER;?>
=<?php echo $_smarty_tpl->tpl_vars['ReferenceNumber']->value;?>
&update=1&<?php echo QueryStringKeys::REDIRECT;?>
=<?php echo rawurlencode($_smarty_tpl->tpl_vars['ReturnUrl']->value);?>
" class="btn btn-default" id="btnApprovalUpdate">
		<span class=""></span>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Update'),$_smarty_tpl);?>

	</a>
    <button type="button" class="btn btn-danger <?php if ($_smarty_tpl->tpl_vars['IsRecurring']->value) {?>delete prompt<?php } else { ?>triggerDeletePrompt delete prompt-single<?php }?>">
        <span class="fa fa-remove"></span>
        <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Reject'),$_smarty_tpl);?>

    </button>
    <button type="button" class="btn btn-success" id="btnApprove">
		<span class="glyphicon glyphicon-ok-circle"></span>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Approve'),$_smarty_tpl);?>

	</button>
<?php
}
}
/* {/block 'submitButtons'} */
/* {block "ajaxMessage"} */
class Block_3258148405cc76f82457d56_84580642 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'UpdatingReservation'),$_smarty_tpl);?>
...
	<br/>
<?php
}
}
/* {/block "ajaxMessage"} */
}
