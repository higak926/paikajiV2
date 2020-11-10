require 'rails_helper'

RSpec.describe User, type: :model do

  before do 
    @user = build(:user)
  end

  describe 'バリデーション' do
    it 'nameとemailどちらも値が設定されていれば、OK' do
      expect(@user.valid?).to eq(true)
    end
  end
end
