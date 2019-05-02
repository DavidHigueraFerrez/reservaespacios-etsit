<?php
/* Smarty version 3.1.30, created on 2019-04-29 23:39:00
  from "/var/www/reservaespacios/html/booked/tpl/Admin/Resources/manage_resources_capacity.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cc76ef4329749_68549785',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '2744c70510171764cd3325959f3f904ef231dd00' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/Admin/Resources/manage_resources_capacity.tpl',
      1 => 1549397010,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5cc76ef4329749_68549785 (Smarty_Internal_Template $_smarty_tpl) {
?>

<div class="maxParticipants"
	 data-value="<?php echo $_smarty_tpl->tpl_vars['resource']->value->GetMaxParticipants();?>
">
	<?php if ($_smarty_tpl->tpl_vars['resource']->value->HasMaxParticipants()) {?>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ResourceCapacity','args'=>$_smarty_tpl->tpl_vars['resource']->value->GetMaxParticipants()),$_smarty_tpl);?>

	<?php } else { ?>
		<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ResourceCapacityNone'),$_smarty_tpl);?>

	<?php }?>
</div><?php }
}
