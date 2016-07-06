<?php
require_once __DIR__.'/../vendor/autoload.php';

use Dakatsuka\MonologFluentHandler\FluentHandler;
use Monolog\Logger;

// Global settings
setlocale(LC_ALL, 'ja_JP.UTF-8');
date_default_timezone_set('Asia/Tokyo');

$logger = new Logger('example');
$logger->pushHandler(new FluentHandler());

$logger->debug('fluent', ['message' => 'foo bar']);
