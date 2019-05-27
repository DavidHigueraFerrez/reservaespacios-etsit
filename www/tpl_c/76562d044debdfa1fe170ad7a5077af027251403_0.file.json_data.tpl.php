<?php
/* Smarty version 3.1.30, created on 2019-05-27 09:49:31
  from "/var/www/reservaespacios/html/booked/tpl/json_data.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cebb2ab3cc083_36304900',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '76562d044debdfa1fe170ad7a5077af027251403' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/json_data.tpl',
      1 => 1557996914,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5cebb2ab3cc083_36304900 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php if ($_smarty_tpl->tpl_vars['data']->value != '') {
echo $_smarty_tpl->tpl_vars['data']->value;?>

<?php }
if ($_smarty_tpl->tpl_vars['error']->value != '') {
echo $_smarty_tpl->tpl_vars['error']->value;?>

<?php }
}
}
