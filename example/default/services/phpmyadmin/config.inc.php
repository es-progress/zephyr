<?php

$i = 0;
$i++;
$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['AllowRoot'] = false;

$cfg['blowfish_secret'] = '{{ blowfish_secret }}';
$cfg['ServerDefault'] = 1;

$cfg['UploadDir'] = '{{ destination }}/upload';
$cfg['SaveDir'] = '{{ destination }}/save';
$cfg['TempDir'] = '{{ destination }}/tmp';
