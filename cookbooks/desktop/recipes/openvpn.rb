package 'openvpn'

template "/etc/systemd/system/vpn@lp.service" do
  mode "0755"
  source "vpn_lp.service.erb"
end
