#!/bin/bash

sudo rm -r /var/www/html
sudo cp -r ../quickstart-php /var/www/html
sudo chmod -R 777 /var/www/html/