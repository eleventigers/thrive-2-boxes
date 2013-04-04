packages = value_for_platform(
    "ubuntu" => {
        "default" => ["pkg-config", "libpixman-1-dev", "libcairo2-dev", "libpng12-dev", "libfreetype6-dev", "libfontconfig1-dev", "python-ldap", "python-cairo"]
        # Could not resolve valgrind so I took it off - not sure if we need it.
        # "default" => ["pkg-config", "valgrind", "libpixman-1-dev", "libcairo2-dev", "libpng12-dev", "libfreetype6-dev", "libfontconfig1-dev", "python-ldap", "python-cairo"]
    },
    "scientific" => {
        "default" => ["pkgconfig", "valgrind-devel", "libpng-devel", "freetype-devel", "fontconfig-devel", "pycairo-devel", "bitmap-fonts"]
    },
    ["redhat", "centos"] => {
        "6.0" => ["pycairo-devel"],
        "default" => ["pkgconfig", "valgrind-devel", "libpng-devel", "freetype-devel", "fontconfig-devel"]
    }
)

packages.each do |dev_pkg|
  package dev_pkg
end

case node["platform"]
  when "redhat", "centos"
    case node["platform_version"].to_i
      when 5
        include_recipe "chef-graphite::cairo_source"
    end
end