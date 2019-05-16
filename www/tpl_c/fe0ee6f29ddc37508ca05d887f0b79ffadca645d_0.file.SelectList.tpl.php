<?php
/* Smarty version 3.1.30, created on 2019-05-16 08:50:22
  from "/var/www/reservaespacios/html/booked/tpl/Controls/Attributes/SelectList.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cdd244e56cce7_52841552',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'fe0ee6f29ddc37508ca05d887f0b79ffadca645d' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/Controls/Attributes/SelectList.tpl',
      1 => 1556777046,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5cdd244e56cce7_52841552 (Smarty_Internal_Template $_smarty_tpl) {
?>

<div class="form-group <?php echo $_smarty_tpl->tpl_vars['class']->value;?>
">
	<label class="customAttribute <?php if ($_smarty_tpl->tpl_vars['readonly']->value) {?>readonly<?php } elseif ($_smarty_tpl->tpl_vars['searchmode']->value) {?>search<?php } else { ?>standard<?php }?>" for="<?php echo $_smarty_tpl->tpl_vars['attributeId']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['attribute']->value->Label();?>
</label>
	<?php if ($_smarty_tpl->tpl_vars['readonly']->value) {?>
		<span class="attributeValue <?php echo $_smarty_tpl->tpl_vars['class']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['attribute']->value->Value();?>
</span>
	<?php } else { ?>
		<select id="<?php echo $_smarty_tpl->tpl_vars['attributeId']->value;?>
" name="<?php echo $_smarty_tpl->tpl_vars['attributeName']->value;?>
" class="customAttribute form-control <?php echo $_smarty_tpl->tpl_vars['inputClass']->value;?>
">
			<?php if (!$_smarty_tpl->tpl_vars['attribute']->value->Required() || $_smarty_tpl->tpl_vars['searchmode']->value) {?>
				<option value="">--</option>
			<?php }?>
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['attribute']->value->PossibleValueList(), 'value');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['value']->value) {
?>
				<option value="<?php echo $_smarty_tpl->tpl_vars['value']->value;?>
"
						<?php if ($_smarty_tpl->tpl_vars['attribute']->value->Value() == $_smarty_tpl->tpl_vars['value']->value) {?>selected="selected"<?php }?>><?php echo $_smarty_tpl->tpl_vars['value']->value;?>
</option>
			<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

		</select>
	<?php }?>
</div>
<?php }
}
