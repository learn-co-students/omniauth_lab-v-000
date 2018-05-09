module SessionsHelper

	def deserialize(value, session = nil)
    value.is_a?(String) ? JSON.parse(value) : value
  end
end
