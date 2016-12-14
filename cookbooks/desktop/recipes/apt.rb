apt_repository "google-chrome" do
  uri "http://dl.google.com/linux/chrome/deb/"
  distribution "stable"
  components ["main"]
  keyserver "https://dl.google.com/linux/linux_signing_key.pub"
  key "4CCA1EAF"
  action :add
end
