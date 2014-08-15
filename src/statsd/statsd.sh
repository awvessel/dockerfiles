#!/bin/bash
passport file templates/statsd/config.js /etc/statsd.js
/opt/statsd/bin/statsd /etc/statsd.js
