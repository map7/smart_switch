class Button < ActiveRecord::Base

  def on
    port = Serial.new '/dev/smart_switch', 38400
    port.write(on_command)
    update_attribute(:power_status, true)
  end

  def off
    port = Serial.new '/dev/smart_switch', 38400
    port.write(off_command)
    update_attribute(:power_status, false)
  end

  def toggle
    if power_status
      off
    else
      on      
    end
  end
end
