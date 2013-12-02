include_recipe "apt"
include_recipe "php"
include_recipe "composer"
include_recipe "git"

package "php5-curl" do
  action :install
end


git "#{Chef::Config[:file_cache_path]}/balanced-php" do
   repository "https://github.com/balanced/balanced-php.git"

   action :sync
 end

# bash "install_composer" do
#    cwd "#{Chef::Config[:file_cache_path]}/balanced-php"
#    user "root"
#    code <<-EOH
#      php composer.phar update
#      EOH
#    environment 'PREFIX' => "/usr/local"
# end

