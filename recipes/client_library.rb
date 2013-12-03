include_recipe "apt"
include_recipe "php"
include_recipe "composer"
include_recipe "git"
include_recipe "phpunit"

package "php5-curl" do
  action :install
end



git "#{Chef::Config[:file_cache_path]}/balanced-php" do
   repository "https://github.com/balanced/balanced-php.git"
   reference "master"
   action :sync
 end





bash "add_composer_files" do
   cwd "#{Chef::Config[:file_cache_path]}/balanced-php"
   user "root"
   code <<-EOH
    curl -s https://getcomposer.org/installer | php -d detect_unicode=Off
    php composer.phar update
     EOH
   environment 'PREFIX' => "/usr/local"
end



bash "install_httpful_and_restful" do
   cwd "#{Chef::Config[:file_cache_path]}/balanced-php"
   user "root"
   code <<-EOH
     curl -s -L -o httpful.phar https://github.com/downloads/nategood/httpful/httpful.phar
     curl -s -L -o restful.phar https://github.com/bninja/restful/downloads/restful-{VERSION}.phar

     EOH
   environment 'PREFIX' => "/usr/local"
end


bash "run_tests" do
   cwd "#{Chef::Config[:file_cache_path]}/balanced-php"
   user "root"
   code <<-EOH
     phpunit --bootstrap vendor/autoload.php tests/
     EOH
   environment 'PREFIX' => "/usr/local"
end
