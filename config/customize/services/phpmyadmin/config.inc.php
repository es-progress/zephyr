<?php
/*
 * ES-Ubuntu
 *
 * PHPMyAdmin
 * Local config
 */

/* Servers configuration */
$i = 0;

/* Server: localhost [1] */
$i++;
$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['AllowRoot'] = false;

/* User used to manipulate with storage */
$cfg['Servers'][$i]['controluser'] = '{{ pma_user_name }}';
$cfg['Servers'][$i]['controlpass'] = '{{ pma_user_pass }}';

/* Storage database and tables */
$cfg['Servers'][$i]['pmadb'] = 'phpmyadmin';
$cfg['Servers'][$i]['bookmarktable'] = 'pma__bookmark';
$cfg['Servers'][$i]['relation'] = 'pma__relation';
$cfg['Servers'][$i]['table_info'] = 'pma__table_info';
$cfg['Servers'][$i]['table_coords'] = 'pma__table_coords';
$cfg['Servers'][$i]['pdf_pages'] = 'pma__pdf_pages';
$cfg['Servers'][$i]['column_info'] = 'pma__column_info';
$cfg['Servers'][$i]['history'] = 'pma__history';
$cfg['Servers'][$i]['recent'] = 'pma__recent';
$cfg['Servers'][$i]['favorite'] = 'pma__favorite';
$cfg['Servers'][$i]['table_uiprefs'] = 'pma__table_uiprefs';
$cfg['Servers'][$i]['users'] = 'pma__users';
$cfg['Servers'][$i]['usergroups'] = 'pma__usergroups';
$cfg['Servers'][$i]['navigationhiding'] = 'pma__navigationhiding';
$cfg['Servers'][$i]['central_columns'] = 'pma__central_columns';
$cfg['Servers'][$i]['designer_settings'] = 'pma__designer_settings';
$cfg['Servers'][$i]['savedsearches'] = 'pma__savedsearches';
$cfg['Servers'][$i]['export_templates'] = 'pma__export_templates';
$cfg['Servers'][$i]['tracking'] = 'pma__tracking';
$cfg['Servers'][$i]['userconfig'] = 'pma__userconfig';

/* End of servers configuration */

// AES passphrase
$cfg['blowfish_secret'] = '{{ blowfish_secret }}';
// Default server
$cfg['ServerDefault'] = 1;

/* Authentication */
$cfg['AuthLog'] = 'syslog';
$cfg['AuthLogSuccess'] = true;
$cfg['LoginCookieValidity'] = 2000000;

/* UI */
$cfg['SendErrorReports'] = 'never';
$cfg['ConsoleEnterExecutes'] = true;
$cfg['HideStructureActions'] = false;
$cfg['ShowAll'] = true;
$cfg['MaxRows'] = 250;
$cfg['MaxNavigationItems'] = 70;
$cfg['RetainQueryBox'] = true;
$cfg['FirstDayOfCalendar'] = 1;
$cfg['InsertRows'] = 1;

/* Title */
$cfg['TitleDefault'] = '@HTTP_HOST@ | PHPMyAdmin';
$cfg['TitleTable'] = '@DATABASE@ - @TABLE@ | @HTTP_HOST@ | PHPMyAdmin';
$cfg['TitleDatabase'] = '@DATABASE@| @HTTP_HOST@ | PHPMyAdmin';
$cfg['TitleServer'] = '@HTTP_HOST@ | PHPMyAdmin';

/* Console */
$cfg['Console']['EnterExecutes'] = true;
$cfg['Console']['DarkTheme'] = true;
$cfg['Console']['Height'] = 292;

/* Directories */
$cfg['UploadDir'] = '{{ destination }}/upload';
$cfg['SaveDir'] = '{{ destination }}/save';
$cfg['TempDir'] = '{{ destination }}/tmp';
