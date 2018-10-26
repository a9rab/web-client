let mix = require('laravel-mix');

// Assets compile
mix.js('app/resources/scripts/index.js', 'javascripts').extract(['vue', 'vuex', 'axios'])
    .sass('app/resources/styles/main.scss', 'stylesheets')
    .setPublicPath('vendor/assets')
