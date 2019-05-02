<?php
/* Smarty version 3.1.30, created on 2019-04-29 23:40:27
  from "/var/www/reservaespacios/html/booked/tpl/Ajax/reservation/save_successful.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cc76f4b80e468_78227780',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '679c053d600a18e8485d0a0ecfc4760ba88ecf5b' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/Ajax/reservation/save_successful.tpl',
      1 => 1556360880,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5cc76f4b80e468_78227780 (Smarty_Internal_Template $_smarty_tpl) {
?>


<div id="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['divId']->value)===null||$tmp==='' ? 'reservation-created' : $tmp);?>
" class="reservationResponseMessage">
	<div id="reservation-response-image">
	<?php if ($_smarty_tpl->tpl_vars['RequiresApproval']->value) {?>
		<span class="fa fa-warning fa-5x warning"></span>
	<?php } else { ?>
		<span class="fa fa-check fa-5x success"></span>
	<?php }?>
	</div>
	
	<?php if ($_smarty_tpl->tpl_vars['RequiresApproval']->value) {?>
	
	<div id="created-message" class="reservation-message">¡Tu solicitud de reserva se ha creado correctamente!</div>
        <div id="reference-number"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'YourReferenceNumber','args'=>$_smarty_tpl->tpl_vars['ReferenceNumber']->value),$_smarty_tpl);?>
</div>

        <div class="dates" style="font-size:20px">
                <span class="bold"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Dates'),$_smarty_tpl);?>
:</span>
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['Instances']->value, 'instance', false, NULL, 'date_list', array (
  'last' => true,
  'iteration' => true,
  'total' => true,
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['instance']->value) {
$_smarty_tpl->tpl_vars['__smarty_foreach_date_list']->value['iteration']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_date_list']->value['last'] = $_smarty_tpl->tpl_vars['__smarty_foreach_date_list']->value['iteration'] == $_smarty_tpl->tpl_vars['__smarty_foreach_date_list']->value['total'];
?>
                        <span class="date"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['format_date'][0][0]->FormatDate(array('date'=>$_smarty_tpl->tpl_vars['instance']->value->StartDate(),'timezone'=>$_smarty_tpl->tpl_vars['Timezone']->value),$_smarty_tpl);
if (!(isset($_smarty_tpl->tpl_vars['__smarty_foreach_date_list']->value['last']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_date_list']->value['last'] : null)) {?>, <?php }?></span>
                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        </div>

        <div class="resources" style="font-size:20px">
                <span class="bold"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Resources'),$_smarty_tpl);?>
:</span>
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['Resources']->value, 'resource', false, NULL, 'resource_list', array (
  'last' => true,
  'iteration' => true,
  'total' => true,
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['resource']->value) {
$_smarty_tpl->tpl_vars['__smarty_foreach_resource_list']->value['iteration']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_resource_list']->value['last'] = $_smarty_tpl->tpl_vars['__smarty_foreach_resource_list']->value['iteration'] == $_smarty_tpl->tpl_vars['__smarty_foreach_resource_list']->value['total'];
?>
                        <span class="resource"><?php echo $_smarty_tpl->tpl_vars['resource']->value->GetName();
if (!(isset($_smarty_tpl->tpl_vars['__smarty_foreach_resource_list']->value['last']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_resource_list']->value['last'] : null)) {?>, <?php }?></span>
                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        </div>	

	<?php } else { ?>
	
	
	<div id="created-message" class="reservation-message"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>(($tmp = @$_smarty_tpl->tpl_vars['messageKey']->value)===null||$tmp==='' ? "ReservationCreated" : $tmp)),$_smarty_tpl);?>
</div>
	<div id="reference-number"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'YourReferenceNumber','args'=>$_smarty_tpl->tpl_vars['ReferenceNumber']->value),$_smarty_tpl);?>
</div>

	<div class="dates">
		<span class="bold"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Dates'),$_smarty_tpl);?>
:</span>
		<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['Instances']->value, 'instance', false, NULL, 'date_list', array (
  'last' => true,
  'iteration' => true,
  'total' => true,
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['instance']->value) {
$_smarty_tpl->tpl_vars['__smarty_foreach_date_list']->value['iteration']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_date_list']->value['last'] = $_smarty_tpl->tpl_vars['__smarty_foreach_date_list']->value['iteration'] == $_smarty_tpl->tpl_vars['__smarty_foreach_date_list']->value['total'];
?>
			<span class="date"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['format_date'][0][0]->FormatDate(array('date'=>$_smarty_tpl->tpl_vars['instance']->value->StartDate(),'timezone'=>$_smarty_tpl->tpl_vars['Timezone']->value),$_smarty_tpl);
if (!(isset($_smarty_tpl->tpl_vars['__smarty_foreach_date_list']->value['last']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_date_list']->value['last'] : null)) {?>, <?php }?></span>
		<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

	</div>

	<div class="resources">
		<span class="bold"><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Resources'),$_smarty_tpl);?>
:</span>
		<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['Resources']->value, 'resource', false, NULL, 'resource_list', array (
  'last' => true,
  'iteration' => true,
  'total' => true,
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['resource']->value) {
$_smarty_tpl->tpl_vars['__smarty_foreach_resource_list']->value['iteration']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_resource_list']->value['last'] = $_smarty_tpl->tpl_vars['__smarty_foreach_resource_list']->value['iteration'] == $_smarty_tpl->tpl_vars['__smarty_foreach_resource_list']->value['total'];
?>
			<span class="resource"><?php echo $_smarty_tpl->tpl_vars['resource']->value->GetName();
if (!(isset($_smarty_tpl->tpl_vars['__smarty_foreach_resource_list']->value['last']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_resource_list']->value['last'] : null)) {?>, <?php }?></span>
		<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

	</div>
	
	<?php }?>	
	
	<?php if ($_smarty_tpl->tpl_vars['RequiresApproval']->value) {?>
		<div id="approval-message" class="reservation-message">Esta solicitud de reserva quedará pendiente hasta que sea aprobada.</div>
	<?php }?>

	<input type="button" id="btnSaveSuccessful" value="<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Close'),$_smarty_tpl);?>
" class="btn btn-success" />
</div>
<?php }
}
