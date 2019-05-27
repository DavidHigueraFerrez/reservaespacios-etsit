<?php
$conf['settings']['cas.version'] = '3.0';
$conf['settings']['cas.server.hostname'] = 'appsrv.etsit.upm.es/cas-upm/';
$conf['settings']['cas.port'] = '443';
$conf['settings']['cas.server.uri'] = '';
$conf['settings']['cas.change.session.id'] = 'false';
$conf['settings']['email.suffix'] = '@yourdomain.com';
$conf['settings']['cas_logout_servers'] = 'appsrv.etsit.upm.es/cas-upm/logout';
$conf['settings']['cas.certificates'] = '';
$conf['settings']['cas.attribute.mapping'] = 'givenName=givenName,surName=surname,email=mail,groups=Role';
$conf['settings']['cas.debug.enabled'] = 'false';
$conf['settings']['cas.debug.file'] = '/tmp/phpcas.log';
?>
