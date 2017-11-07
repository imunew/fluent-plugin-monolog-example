<?php
require_once __DIR__.'/../vendor/autoload.php';

use Dakatsuka\MonologFluentHandler\FluentHandler;
use Monolog\Logger;

$logger = new Logger('example');
$logger->pushHandler(new FluentHandler());

$logger->debug('fluent', ['message' => 'foo bar']);
