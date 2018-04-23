class Float
  def money_patch()
     (self * 20).ceil.to_f / 20.0
  end
end
