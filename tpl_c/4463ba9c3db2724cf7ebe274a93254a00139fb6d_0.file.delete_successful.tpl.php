<?php
/* Smarty version 3.1.30, created on 2019-04-25 14:51:40
  from "/var/www/reservaespacios/html/booked/tpl/Ajax/reservation/delete_successful.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cc1ad5cbb2146_39658313',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4463ba9c3db2724cf7ebe274a93254a00139fb6d' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/Ajax/reservation/delete_successful.tpl',
      1 => 1549397010,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5cc1ad5cbb2146_39658313 (Smarty_Internal_Template $_smarty_tpl) {
?>

<div>
	<div id="reservation-response-image">
		<span class="fa fa-check fa-5x success"></span>
	</div>

	<div id="deleted-message" class="reservation-message"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ReservationRemoved'),$_smarty_tpl);?>
</div>

	<input type="button" id="btnSaveSuccessful" value="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Close'),$_smarty_tpl);?>
" class="btn btn-success" />
</div><?php }
}
