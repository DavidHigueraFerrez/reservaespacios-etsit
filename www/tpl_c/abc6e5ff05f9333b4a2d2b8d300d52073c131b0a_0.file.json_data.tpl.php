<?php
/* Smarty version 3.1.30, created on 2019-05-13 14:28:29
  from "/var/www/reservaespacios/html/booked/tpl/json_data.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cd97f0d47dbb8_42045751',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'abc6e5ff05f9333b4a2d2b8d300d52073c131b0a' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/json_data.tpl',
      1 => 1556777046,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5cd97f0d47dbb8_42045751 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php if ($_smarty_tpl->tpl_vars['data']->value != '') {
echo $_smarty_tpl->tpl_vars['data']->value;?>

<?php }
if ($_smarty_tpl->tpl_vars['error']->value != '') {
echo $_smarty_tpl->tpl_vars['error']->value;?>

<?php }
}
}
