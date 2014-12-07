module CounterHelper

  def counter(count, icon, label)
    render 'common/counter', count: count, label: label, icon: icon
  end

end
