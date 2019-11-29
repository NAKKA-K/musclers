module DateHelper
  def created_date(created_date)
    created_date.strftime('%Y/%m/%d %H:%M')
  end

  def updated_date(updated_date)
    updated_date.strftime('%Y/%m/%d %H:%M')
  end
end