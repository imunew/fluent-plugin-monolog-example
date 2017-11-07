<?php
require_once __DIR__.'/../vendor/autoload.php';

use Monolog\Handler\StreamHandler;
use Monolog\Logger;

$logger = new Logger('example');
$logger->pushHandler(new StreamHandler(__DIR__.'/../var/log/example_stream.log', Logger::DEBUG, true, 0777));

$logger->debug('stream', ['message' => 'foo bar']);
