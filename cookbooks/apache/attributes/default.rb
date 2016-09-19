
default["apache"]["sites"]["anil3"] = {"site_title" => "website coming soon", "port" => 80, "domain" => "ak650887-sju-edu5.mylabserver.com" }

default["apache"]["sites"]["anil3b"] = {"site_title" => "website coming soon", "port" => 80, "domain" => "ak650887-sju-edu5b.mylabserver.com" }

default["apache"]["sites"]["anil6a"] = {"site_title" => "website coming soon", "port" => 80, "domain" => "ak650887-sju-edu6.mylabserver.com" }

case node["platform"]
when "centos"
	default["node"]["package"] = "httpd"
when "ubuntu"
	default["node"]["package"] = "apache2"
end 

