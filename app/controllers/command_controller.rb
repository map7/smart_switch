class CommandController < ApplicationController
  def cmd
    @result = params[:cmd]

    port = Serial.new '/dev/ttyUSB0', 38400

    if @result == 'a'
      port.write('1')
      port.write('3')
      flash[:notice] = "All devices are ON"
    elsif @result == 'x'
      port.write('2')
      port.write('4')
      flash[:notice] = "All devices are OFF"
    elsif @result.to_i > 0 and @result.to_i <= 4
      port.write(@result)
      case @result.to_i
      when 1
        flash[:notice] = "Switch 1 is ON"
      when 2
        flash[:notice] = "Switch 1 is OFF"
      when 3
        flash[:notice] = "Switch 2 is ON"
      when 4
        flash[:notice] = "Switch 2 is OFF"
      end
    end

    redirect_to :buttons
  end
end
