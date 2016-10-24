class CommandController < ApplicationController
  def cmd
    @result = params[:cmd]

    if @result == "on"
      %x[/home/map7/hacking/smart_switch/my_code/switch_cli.rb 1]
    end

    if @result == "off"
      %x[/home/map7/hacking/smart_switch/my_code/switch_cli.rb 2]
    end
  end
end
