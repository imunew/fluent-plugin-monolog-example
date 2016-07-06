<?php
require_once __DIR__.'/../vendor/autoload.php';

use Monolog\Handler\StreamHandler;
use Monolog\Logger;

// Global settings
setlocale(LC_ALL, 'ja_JP.UTF-8');
date_default_timezone_set('Asia/Tokyo');

$logger = new Logger('example');
$logger->pushHandler(new StreamHandler(__DIR__.'/../var/log/example_stream.log', Logger::DEBUG, true, 0777));

$logger->debug('stream', ['message' => 'foo bar']);
