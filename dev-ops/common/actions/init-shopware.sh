#!/usr/bin/env bash
#DESCRIPTION: initialization of shopware

bin/console cache:clear --env=prod
bin/console cache:clear --env=dev
bin/console cache:clear --env=test

bin/console database:migrate --all
bin/console database:migrate-destructive --all

bin/console plugin:refresh

bin/console rest:user:create admin --password=shopware

php bin/console sales-channel:create --id=20080911ffff4fffafffffff19830531
php bin/console sales-channel:create:storefront --url=__APP_URL__
