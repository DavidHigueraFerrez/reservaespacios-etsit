<?php
/* Smarty version 3.1.30, created on 2019-04-30 12:11:02
  from "/var/www/reservaespacios/html/booked/tpl/Reports/chart.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5cc81f36f316b5_14623090',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'c9ef7ab7a9a1b30165a5d27c7c347c9b9cf18df3' => 
    array (
      0 => '/var/www/reservaespacios/html/booked/tpl/Reports/chart.tpl',
      1 => 1549397012,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5cc81f36f316b5_14623090 (Smarty_Internal_Template $_smarty_tpl) {
?>

<div class="clear"></div>
<div id="chart-indicator" style="display:none; text-align: center;">
	<h3><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0][0]->SmartyTranslate(array('key'=>'Working'),$_smarty_tpl);?>
</h3>
<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['html_image'][0][0]->PrintImage(array('src'=>"admin-ajax-indicator.gif"),$_smarty_tpl);?>

</div>

<div id="chartdiv" style="display:none;margin:auto;height:400px;width:80%"></div>

<!--[if lt IE 9]><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['jsfile'][0][0]->IncludeJavascriptFile(array('src'=>"js/jqplot/excanvas.js"),$_smarty_tpl);?>
<![endif]-->
<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['jsfile'][0][0]->IncludeJavascriptFile(array('src'=>"js/jqplot/jquery.jqplot.min.js"),$_smarty_tpl);?>

<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['jsfile'][0][0]->IncludeJavascriptFile(array('src'=>"js/jqplot/plugins/jqplot.barRenderer.min.js"),$_smarty_tpl);?>

<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['jsfile'][0][0]->IncludeJavascriptFile(array('src'=>"js/jqplot/plugins/jqplot.categoryAxisRenderer.min.js"),$_smarty_tpl);?>

<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['jsfile'][0][0]->IncludeJavascriptFile(array('src'=>"js/jqplot/plugins/jqplot.canvasAxisTickRenderer.min.js"),$_smarty_tpl);?>

<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['jsfile'][0][0]->IncludeJavascriptFile(array('src'=>"js/jqplot/plugins/jqplot.canvasTextRenderer.min.js"),$_smarty_tpl);?>

<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['jsfile'][0][0]->IncludeJavascriptFile(array('src'=>"js/jqplot/plugins/jqplot.pointLabels.min.js"),$_smarty_tpl);?>

<?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['jsfile'][0][0]->IncludeJavascriptFile(array('src'=>"js/jqplot/plugins/jqplot.dateAxisRenderer.min.js"),$_smarty_tpl);
}
}