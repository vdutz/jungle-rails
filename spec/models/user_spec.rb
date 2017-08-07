require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations:' do
    # validation tests/examples here

    before :each do
      @user = User.new(
        name: "Jack",
        email: "jack@REACHER.com",
        password: "jack",
        password_confirmation: "jack"
      )
    end

    it 'should save succesfully if all required fields are present' do
      expect(@user.save).to eq(true)
    end

    it 'should not save if name is not present' do
      @user.name = nil
      @user.save
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end

    it 'should not save if password is not present' do
      @user.password = nil
      @user.save
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'should not save if password is under 3 characters' do
      @user.password = "hi"
      @user.password_confirmation = "hi"
      @user.save
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 3 characters)"
    end

    it 'should not save if password_confirmation is not present' do
      @user.password_confirmation = nil
      @user.save
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it 'should not save if password and password_confirmation do not match' do
      @user.password_confirmation = "jack-different"
      @user.save
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'should not save if email is not present' do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'should not save if email is not unique' do
      @user.save
      @user2 = User.new(
        name: "Jack2",
        email: "JACK@reacher.COM",
        password: "jack2",
        password_confirmation: "jack2"
      )
      @user2.save
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end

    context '.authenticate_with_credentials' do

      it 'should authenticate if email and passwords match records' do
        @user.save
        expect(User.authenticate_with_credentials("jack@REACHER.com", "jack")).to eq(@user)
      end

      it 'should authenticate even if entered email has leading and trailing whitespace' do
        @user.save
        expect(User.authenticate_with_credentials(" jack@REACHER.com ", "jack")).to eq(@user)
      end

      it 'should authenticate regardless of the case that the entered email is written in' do
        @user.save
        expect(User.authenticate_with_credentials(" jaCK@reachER.coM ", "jack")).to eq(@user)
      end

      it 'should not authenticate if email does not match records' do
        @user.save
        expect(User.authenticate_with_credentials("jack@reach.com", "jack")).to eq(nil)
      end

      it 'should not authenticate if password does not match records' do
        @user.save
        expect(User.authenticate_with_credentials("jack@reacher.com", "jacket")).to eq(nil)
      end

    end

  end
end

# create_table "users", force: :cascade do |t|
#   t.string   "name"
#   t.string   "email"
#   t.string   "password_digest"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
# end