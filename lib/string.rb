class String
  def convert_to_camel_case
    self.split('_').map {|w| w.capitalize}.join
  end
end