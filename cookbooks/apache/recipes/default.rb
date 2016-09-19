#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node["patform"] == "ubuntu"
	execute "apt-get update -y" do 
end 

package "apache2" do 
	package_name node["apache"]["package"]
end 

node["apache"]["sites"].each do |sitename, data|
  document_root = "/content/sites/#{sitename}"
  directory document_root do 
	mode "0755" 
	recursive true 
  end

if node["platform"] == "ubuntu"
	template_location = "/etc/apache2/sites-enabled/#{sitename}.conf"
elsif node["platform"] == "centos"
	template_location = "/etc/httpd/conf.d/#{sitename}.conf"
end 


template "/etc/httpd/conf.d/#{sitename}.conf" do 
	source "vhost.erb"
	mode "0644"
	variables(
 		:document_root => document_root,
		:port => data["port"],
		:domain => data["domain"]
	)
end



end 


service "httpd" do 
	service_name node["apache"]["package"]
	action [:enable, :start]
end

end
