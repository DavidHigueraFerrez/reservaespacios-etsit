<?php
/* Smarty version 3.1.30, created on 2019-04-25 14:51:39
  from "/var/www/reservaespacios/html/booked/lang/es/ReservationDeleted.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cc1ad5b3aa738_30640427',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '56792d4b32f891c8a3666c2e79ed55661e250aba' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/lang/es/ReservationDeleted.tpl',
      1 => 1549396944,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5cc1ad5b3aa738_30640427 (Smarty_Internal_Template $_smarty_tpl) {
?>

Detalles de la Reserva:
<br/>
<br/>

Usuario: <?php echo $_smarty_tpl->tpl_vars['UserName']->value;?>
<br/>
Inicio: <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['formatdate'][0][0]->FormatDate(array('date'=>$_smarty_tpl->tpl_vars['StartDate']->value,'key'=>'reservation_email'),$_smarty_tpl);?>
<br/>
Fin: <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['formatdate'][0][0]->FormatDate(array('date'=>$_smarty_tpl->tpl_vars['EndDate']->value,'key'=>'reservation_email'),$_smarty_tpl);?>
<br/>
<?php if (count($_smarty_tpl->tpl_vars['ResourceNames']->value) > 1) {?>
    Recursos:
    <br/>
    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['ResourceNames']->value, 'resourceName');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['resourceName']->value) {
?>
        <?php echo $_smarty_tpl->tpl_vars['resourceName']->value;?>

        <br/>
    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

<?php } else { ?>
    Recurso: <?php echo $_smarty_tpl->tpl_vars['ResourceName']->value;?>

    <br/>
<?php }?>

<?php if ($_smarty_tpl->tpl_vars['ResourceImage']->value) {?>
    <div class="resource-image"><img src="<?php echo $_smarty_tpl->tpl_vars['ScriptUrl']->value;?>
/<?php echo $_smarty_tpl->tpl_vars['ResourceImage']->value;?>
"/></div>
<?php }?>

Título: <?php echo $_smarty_tpl->tpl_vars['Title']->value;?>
<br/>
Descripción: <?php echo nl2br($_smarty_tpl->tpl_vars['Description']->value);?>
<br/>
<?php echo nl2br($_smarty_tpl->tpl_vars['DeleteReason']->value);?>
<br/>


<?php if (count($_smarty_tpl->tpl_vars['RepeatDates']->value) > 0) {?>
    <br/>
    Se han eliminado las siguientes fechas:
    <br/>
<?php }?>

<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['RepeatDates']->value, 'date', false, NULL, 'dates', array (
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['date']->value) {
?>
    <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['formatdate'][0][0]->FormatDate(array('date'=>$_smarty_tpl->tpl_vars['date']->value),$_smarty_tpl);?>

    <br/>
<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>


<?php if (count($_smarty_tpl->tpl_vars['Accessories']->value) > 0) {?>
    <br/>
    Accesorios:
    <br/>
    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['Accessories']->value, 'accessory');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['accessory']->value) {
?>
        (<?php echo $_smarty_tpl->tpl_vars['accessory']->value->QuantityReserved;?>
) <?php echo $_smarty_tpl->tpl_vars['accessory']->value->Name;?>

        <br/>
    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

<?php }?>

<br/>
<br/>
<a href="<?php echo $_smarty_tpl->tpl_vars['ScriptUrl']->value;?>
">Iniciar sesión en Booked Scheduler</a><?php }
}
