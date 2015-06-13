GroupBy Quickstart Webapp
================

[![version](https://img.shields.io/github/release/groupby/quickstart-php.svg)](https://github.com/groupby/quickstart-php/releases/latest)
![downloads](https://img.shields.io/github/downloads/groupby/quickstart-php/latest/total.svg)
![license](https://img.shields.io/github/license/groupby/quickstart-php.svg)

#### Requirements

To run this application on your machine, you need at least:

* >= PHP 5.3.9
* Apache Web Server with mod rewrite enabled
* Latest Phalcon Framework extension installed/enabled. See [here](http://docs.phalconphp.com/en/latest/reference/install.html) for installation instructions.

### Setup

1. Copy all files to `/var/www/html` (make sure to include dotfiles)
1. Change permissions for the files using `sudo chmod -R 777 /var/www/html/*`
1. In your apache configuration, set `AllowOverrides` to `All` within the tag `<Directory "/var/www/html">`
1. Restart apache
