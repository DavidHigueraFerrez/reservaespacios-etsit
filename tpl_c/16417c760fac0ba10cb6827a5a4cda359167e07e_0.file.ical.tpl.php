<?php
/* Smarty version 3.1.30, created on 2019-04-29 23:42:31
  from "/var/www/reservaespacios/html/booked/tpl/Export/ical.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cc76fc78681c5_48283047',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '16417c760fac0ba10cb6827a5a4cda359167e07e' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/Export/ical.tpl',
      1 => 1549397012,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5cc76fc78681c5_48283047 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_modifier_regex_replace')) require_once '/var/www/reservaespacios/html/booked/lib/external/Smarty/plugins/modifier.regex_replace.php';
?>
BEGIN:VCALENDAR
VERSION:2.0
METHOD:REQUEST
PRODID:-//BookedScheduler//NONSGML <?php echo $_smarty_tpl->tpl_vars['bookedVersion']->value;?>
//EN
<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['Reservations']->value, 'reservation');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['reservation']->value) {
?>
BEGIN:VEVENT
CLASS:PUBLIC
CREATED:<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['formatdate'][0][0]->FormatDate(array('date'=>$_smarty_tpl->tpl_vars['reservation']->value->DateCreated,'key'=>'ical'),$_smarty_tpl);?>

DESCRIPTION:<?php echo smarty_modifier_regex_replace($_smarty_tpl->tpl_vars['reservation']->value->Description,"/\r\n|\n|\r/m","\n ");?>

DTSTAMP:<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['formatdate'][0][0]->FormatDate(array('date'=>$_smarty_tpl->tpl_vars['reservation']->value->DateCreated,'key'=>'ical'),$_smarty_tpl);?>

DTSTART:<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['formatdate'][0][0]->FormatDate(array('date'=>$_smarty_tpl->tpl_vars['reservation']->value->DateStart,'key'=>'ical'),$_smarty_tpl);?>

DTEND:<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['formatdate'][0][0]->FormatDate(array('date'=>$_smarty_tpl->tpl_vars['reservation']->value->DateEnd,'key'=>'ical'),$_smarty_tpl);?>

LAST-MODIFIED:<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['formatdate'][0][0]->FormatDate(array('date'=>$_smarty_tpl->tpl_vars['reservation']->value->LastModified,'key'=>'ical'),$_smarty_tpl);?>

LOCATION:<?php echo $_smarty_tpl->tpl_vars['reservation']->value->Location;?>

ORGANIZER;CN=<?php echo $_smarty_tpl->tpl_vars['reservation']->value->Organizer;?>
:MAILTO:<?php echo $_smarty_tpl->tpl_vars['reservation']->value->OrganizerEmail;?>

STATUS:<?php if ($_smarty_tpl->tpl_vars['reservation']->value->IsPending) {?>TENTATIVE<?php } else { ?>CONFIRMED
<?php }
if ($_smarty_tpl->tpl_vars['reservation']->value->RecurRule != '') {?>
RRULE:<?php echo $_smarty_tpl->tpl_vars['reservation']->value->RecurRule;?>

<?php }?>
SUMMARY:<?php echo $_smarty_tpl->tpl_vars['reservation']->value->Summary;?>

UID:<?php echo $_smarty_tpl->tpl_vars['reservation']->value->ReferenceNumber;?>
&<?php echo $_smarty_tpl->tpl_vars['UID']->value;?>

SEQUENCE:0
URL:<?php echo $_smarty_tpl->tpl_vars['reservation']->value->ReservationUrl;?>

X-MICROSOFT-CDO-BUSYSTATUS:BUSY
<?php if ($_smarty_tpl->tpl_vars['reservation']->value->StartReminder != null) {?>
BEGIN:VALARM
TRIGGER;RELATED=START:-PT<?php echo $_smarty_tpl->tpl_vars['reservation']->value->StartReminder->MinutesPrior();?>
M
ACTION:DISPLAY
DESCRIPTION:<?php echo $_smarty_tpl->tpl_vars['reservation']->value->Description;?>

END:VALARM
<?php }
if ($_smarty_tpl->tpl_vars['reservation']->value->EndReminder != null) {?>
BEGIN:VALARM
TRIGGER;RELATED=END:-PT<?php echo $_smarty_tpl->tpl_vars['reservation']->value->EndReminder->MinutesPrior();?>
M
ACTION:DISPLAY
DESCRIPTION:<?php echo $_smarty_tpl->tpl_vars['reservation']->value->Summary;?>

END:VALARM
<?php }?>
END:VEVENT
<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

END:VCALENDAR<?php }
}
