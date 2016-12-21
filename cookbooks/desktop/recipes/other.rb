# SDL2 libs
%w(libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev).each do |name|
  package name do
    action :upgrade
  end
end

# Curses
%w(libncurses5-dev libncursesw5-dev).each do |name|
  package name
end
