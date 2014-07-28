#
# Cookbook Name:: ceph
# Attributes:: radosgw
#
# Copyright 2011, DreamHost Web Hosting
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['ceph']['radosgw']['rgw_addr'] = '*'
default['ceph']['radosgw']['rgw_port'] = 8080

default["ceph"]["radosgw"]["path"] = "/var/www"

if node['platform'] == "suse"
  default["ceph"]["radosgw"]["path"] = "/srv/www/ceph-radosgw"
end

default['ceph']['radosgw']['nss_directory'] = "/var/lib/ceph/nss"

case node['platform']
  when 'ubuntu'
    default['ceph']['radosgw']['service_name']  = 'radosgw-all-starter'
  when 'debian'
    default['ceph']['radosgw']['service_name']  = 'radosgw'
  else
    default['ceph']['radosgw']['service_name']  = 'ceph-radosgw'
end

case node['platform_family']
  when 'debian'
    packages = ['radosgw']
    packages += ['radosgw-dbg'] if node['ceph']['install_debug']
    default['ceph']['radosgw']['packages'] = packages
  when 'rhel', 'fedora', 'suse'
    default['ceph']['radosgw']['packages'] = ['ceph-radosgw']
  else
    default['ceph']['radosgw']['packages'] = []
end