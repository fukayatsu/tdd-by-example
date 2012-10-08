require 'user'

describe User do
  describe '#admin?' do
    it { should be_admin }
  end
end