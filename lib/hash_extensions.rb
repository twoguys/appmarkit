class Hash
  def to_struct(struct_name)
    snake_keys = self.keys.collect { |k| k.snake_case.to_sym }
    Struct.new(struct_name, *snake_keys).new(*values)
  end
end