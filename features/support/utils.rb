class String
  def to_integer(default)
    Integer(self)
  rescue ArgumentError
    default
  end
end