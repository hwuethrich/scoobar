module FlashHelper

  def alert_class_for_flash(flash_type)
    case flash_type.to_sym
      when :success
        "alert-success"
      when :danger
        "alert-danger"
      when :alert
        "alert-warning"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

end
