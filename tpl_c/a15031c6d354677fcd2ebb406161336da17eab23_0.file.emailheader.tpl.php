<?php
/* Smarty version 3.1.30, created on 2019-04-29 23:42:31
  from "/var/www/reservaespacios/html/booked/tpl/Email/emailheader.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cc76fc7878757_53453746',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a15031c6d354677fcd2ebb406161336da17eab23' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/Email/emailheader.tpl',
      1 => 1556110825,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5cc76fc7878757_53453746 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php echo '<?xml ';?>
version="1.0" encoding="<?php echo $_smarty_tpl->tpl_vars['Charset']->value;?>
"<?php echo '?>';?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=<?php echo $_smarty_tpl->tpl_vars['Charset']->value;?>
" />
		<style type="text/css">
			* { margin:30px; padding:0; }

			body {
			    font: 13px Helvetica, "Lucida Grande", Verdana, Arial, sans-serif;
			    background-color: #fefefe;
			    margin: 30px;
			    color: #333333;
			    height: 100%;
			}

			div.resource-image img
			{
			    padding-bottom:25px;
			    max-height:200px;
			    max-width:200px;
			}

		</style>
	</head>
	<img src="https://portal.etsit.upm.es/pdi/reserva-espacios/images/logo-escuela-mail.png" style="max-height:200px;
                            max-width:200px;" class="resource-image">
	 <h3>Aplicacion de Reserva de Espacios de la ETSIT</h3>
	<br>
	<body>
	
<?php }
}
