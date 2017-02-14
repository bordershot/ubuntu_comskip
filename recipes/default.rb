#
# Cookbook Name:: ubuntu_comskip
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

apt_update 'apt_update' do
  action :update
end

package ['git', 'build-essential', 'libargtable2-dev', 'libavformat-dev', 'libsdl1.2-dev', 'autoconf', 'libtool', 'ffmpeg', 'bc']

directory '/opt/comskip'
directory '/opt/post-process'

git '/opt/comchap' do
  repository 'https://github.com/BrettSheleski/comchap.git'
end

git '/opt/comskip' do
  repository 'https://github.com/erikkaashoek/Comskip.git'
end

bash 'build_comskip' do
  cwd '/opt/comskip'
  code <<-EOH
    ./autogen.sh && ./configure && make
  EOH
  not_if { ::File.exist?('/opt/comskip/comskip') }
end

cookbook_file '/opt/post-process/comskip.ini'
cookbook_file '/opt/post-process/post-process.sh' do
  mode '0755'
end
