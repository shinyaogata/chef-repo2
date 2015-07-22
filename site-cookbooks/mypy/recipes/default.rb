#
# Cookbook Name:: mypy
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - 


%w(gcc openssl-devel bzip2-devel expat-devel gdbm-devel readline-devel sqlite-devel).each do |pkg|
  yum_package pkg do
    action :install
  end
end
 
cookbook_file "/tmp/Python-3.4.3.tar.xz" do
  source "Python-3.4.3.tar.xz"
  mode 0644
end
  
bash "install python" do
  cwd "/tmp"
  code <<-EOH
    tar Jxvf /tmp/Python-3.4.3.tar.xz
    cd /tmp/Python-3.4.3
    ./configure --prefix=/opt/python3
    make
    make install
    echo export PATH=/opt/python3/bin/:\$PATH >> ~/.bashrc
    source ~/.bashrc
  EOH
end


#libraries
cookbook_file "/tmp/pandas-0.16.2.tar.gz" do
    source "pandas-0.16.2.tar.gz"
    mode 0644
end

bash "install pandas" do
    cwd "/tmp"
    code <<-EOH
    tar xvfz /tmp/pandas-0.16.2.tar.gz
    cd /tmp/pandas-0.16.2
    python3 setup.py
    EOH
end

cookbook_file "/tmp/numpy-1.9.2.tar.gz" do
    source "numpy-1.9.2.tar.gz"
    mode 0644
end

bash "install numpy" do
    cwd "/tmp"
    code <<-EOH
    tar xvfz /tmp/numpy-1.9.2.tar.gz
    cd /tmp/numpy-1.9.2
    python3 setup.py
    EOH
end

