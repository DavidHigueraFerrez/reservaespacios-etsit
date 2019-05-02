<?php
/* Smarty version 3.1.30, created on 2019-04-27 12:30:46
  from "/var/www/reservaespacios/html/booked/tpl/Ajax/reservation/update_successful.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cc42f56c3dd17_38604242',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'c9300db355b5de5248e392ee40e35f95072ef4af' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/Ajax/reservation/update_successful.tpl',
      1 => 1549397010,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:Ajax/reservation/save_successful.tpl' => 1,
  ),
),false)) {
function content_5cc42f56c3dd17_38604242 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php $_smarty_tpl->_subTemplateRender("file:Ajax/reservation/save_successful.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('divId'=>"reservation-updated",'messageKey'=>"ReservationUpdated"), 0, false);
}
}
