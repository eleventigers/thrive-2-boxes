maintainer        "eleventigers"
maintainer_email  "phonodelik@gmail.com"
description       "Installs Cairo"
version           "0.0.1"
recipe            "cairo", "Installs Cairo on Linux"

%w{ fedora redhat centos ubuntu debian }.each do |os|
  supports os
end
