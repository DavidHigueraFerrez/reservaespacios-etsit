<?php
/* Smarty version 3.1.30, created on 2019-04-29 23:42:33
  from "/var/www/reservaespacios/html/booked/tpl/json_data.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cc76fc9220998_70779900',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8170b837e5ebb387b134c085d9afa1fe3f73499f' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/json_data.tpl',
      1 => 1549397012,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5cc76fc9220998_70779900 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php if ($_smarty_tpl->tpl_vars['data']->value != '') {
echo $_smarty_tpl->tpl_vars['data']->value;?>

<?php }
if ($_smarty_tpl->tpl_vars['error']->value != '') {
echo $_smarty_tpl->tpl_vars['error']->value;?>

<?php }
}
}
