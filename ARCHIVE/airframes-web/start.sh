#!/bin/sh

cd /var/www/airframes && bundle exec hanami server --host=0.0.0.0 --port=2300
