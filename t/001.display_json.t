# vi:set ft=perl ts=4 sw=4 et fdm=marker:

use Test::Nginx::Socket;

plan tests => repeat_each(2) * blocks() * 2;
no_shuffle();
run_tests();

__DATA__

=== TEST 1: /status/format/json
--- http_config
    vhost_traffic_status_zone;
--- config
    location /status {
        vhost_traffic_status_display;
        vhost_traffic_status_display_format json;
    }
--- request
GET /status/format/json
--- response_headers_like
Content-Type: application/json



=== TEST 2: /status
--- http_config
    vhost_traffic_status_zone;
--- config
    location /status {
        vhost_traffic_status_display;
        vhost_traffic_status_display_format json;
    }
--- request
GET /status
--- response_headers_like
Content-Type: application/json
