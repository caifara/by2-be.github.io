# Resources

Bootstrap sass port
http://alademann.github.io/sass-bootstrap/

Themes
http://bootswatch.com/

Themes converted to sass
https://github.com/maxim/bootswatch-rails

Just in case we need to convert less to sass again, these were the steps taken:

* take the script from here https://raw2.github.com/maxim/bootswatch-rails/master/converter and curl it to /lib
* curl the two less files from bootswatch.com readable theme
* run the ruby script over them `ruby lib/less2sass.rb orig result`
* hunt for this line, change transparent to white 

     $navbar-inverse-bg:                         white !default;
