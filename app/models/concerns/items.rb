module Items
  def name
    object.payload&.[]('name')
  end

  def email
    object.payload&.[]('email')
  end
end
