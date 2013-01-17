require 'test_helper'

describe WorkflowSequelAdapter do
  describe User do
    before do
      @user = User.create(email: 'user@example.com', password: 'password')
    end

    it 'starts in active state' do
      @user.state.must_equal 'active'
    end

    describe 'in the inactive state' do
      it 'transitions to the inactive state via the deactivate event' do
        @user.can_deactivate?.must_equal true
        @user.deactivate!
        @user.state.must_equal 'inactive'
      end

      it 'cannot be activated if already active' do
        @user.can_activate?.must_equal false
      end
    end

    describe 'in the inactive state' do
      before do
        @user.deactivate!
      end

      it 'transitions to the active state via the activate event' do
        @user.can_activate?.must_equal true
        @user.activate!
        @user.state.must_equal 'active'
      end

      it 'cannot be deactivated if already inactive' do
        @user.can_deactivate?.must_equal false
      end
    end
  end
end