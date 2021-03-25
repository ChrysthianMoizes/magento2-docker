#!/bin/sh

chmod -R 777 magento2/

cd magento2/

php -dmemory_limit=6G bin/magento setup:static-content:deploy pt_BR -f

cd ..

chmod -R 777 magento2/

mkdir -p magento2/app/i18n/magento2translations/

cp -avr language_pt_br/ magento2/app/i18n/magento2translations/

chmod -R 777 magento2/

cd magento2/

php bin/magento cache:flush

a2enmod rewrite

service apachectl restart
