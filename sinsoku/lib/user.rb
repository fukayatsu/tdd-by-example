class User
  def initialize(option)
    @role = option[:role]
  end

  def admin?
    @role == 'admin'
  end
end