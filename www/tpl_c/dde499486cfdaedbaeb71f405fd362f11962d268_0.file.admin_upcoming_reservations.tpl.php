<?php
/* Smarty version 3.1.30, created on 2019-05-27 09:51:43
  from "/var/www/reservaespacios/html/booked/tpl/Dashboard/admin_upcoming_reservations.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cebb32f3c5285_77107986',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'dde499486cfdaedbaeb71f405fd362f11962d268' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/Dashboard/admin_upcoming_reservations.tpl',
      1 => 1557996914,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:Dashboard/dashboard_reservation.tpl' => 4,
  ),
),false)) {
function content_5cebb32f3c5285_77107986 (Smarty_Internal_Template $_smarty_tpl) {
?>


<div class="dashboard upcomingReservationsDashboard" id="adminUpcomingReservationsDashboard">
    <div class="dashboardHeader">
        <div class="pull-left"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>"AllUpcomingReservations"),$_smarty_tpl);?>
 <span class="badge"><?php echo $_smarty_tpl->tpl_vars['Total']->value;?>
</span></div>
        <div class="pull-right">
            <a href="#" title="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'ShowHide'),$_smarty_tpl);?>
 <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>"AllUpcomingReservations"),$_smarty_tpl);?>
">
                <i class="glyphicon"></i>
                <span class="no-show">Expand/Collapse</span>
            </a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="dashboardContents">
        <?php $_smarty_tpl->_assignInScope('colspan', "5");
?>
        <?php if ($_smarty_tpl->tpl_vars['Total']->value > 0) {?>
            <div>
                <div class="timespan">
                    <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>"Today"),$_smarty_tpl);?>
 (<?php echo count($_smarty_tpl->tpl_vars['TodaysReservations']->value);?>
)
                </div>
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['TodaysReservations']->value, 'reservation');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['reservation']->value) {
?>
                    <?php $_smarty_tpl->_subTemplateRender("file:Dashboard/dashboard_reservation.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('reservation'=>$_smarty_tpl->tpl_vars['reservation']->value), 0, true);
?>

                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>


                <div class="timespan">
                    <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>"Tomorrow"),$_smarty_tpl);?>
 (<?php echo count($_smarty_tpl->tpl_vars['TomorrowsReservations']->value);?>
)
                </div>
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['TomorrowsReservations']->value, 'reservation');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['reservation']->value) {
?>
                    <?php $_smarty_tpl->_subTemplateRender("file:Dashboard/dashboard_reservation.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('reservation'=>$_smarty_tpl->tpl_vars['reservation']->value), 0, true);
?>

                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>


                <div class="timespan">
                    <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>"LaterThisWeek"),$_smarty_tpl);?>
 (<?php echo count($_smarty_tpl->tpl_vars['ThisWeeksReservations']->value);?>
)
                </div>
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['ThisWeeksReservations']->value, 'reservation');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['reservation']->value) {
?>
                    <?php $_smarty_tpl->_subTemplateRender("file:Dashboard/dashboard_reservation.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('reservation'=>$_smarty_tpl->tpl_vars['reservation']->value), 0, true);
?>

                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>


                <div class="timespan">
                    <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>"NextWeek"),$_smarty_tpl);?>
 (<?php echo count($_smarty_tpl->tpl_vars['NextWeeksReservations']->value);?>
)
                </div>
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['NextWeeksReservations']->value, 'reservation');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['reservation']->value) {
?>
                    <?php $_smarty_tpl->_subTemplateRender("file:Dashboard/dashboard_reservation.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('reservation'=>$_smarty_tpl->tpl_vars['reservation']->value), 0, true);
?>

                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

            </div>
        <?php } else { ?>
            <div class="noresults"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>"AllNoUpcomingReservations"),$_smarty_tpl);?>
</div>
        <?php }?>
    </div>
</div>
<?php }
}
