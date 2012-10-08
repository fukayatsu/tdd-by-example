require 'user'

describe User do
  describe '#admin?' do
    before { @admin_user = User.new(role: 'admin') }

    subject { @admin_user }
    it { should be_admin }
  end
end