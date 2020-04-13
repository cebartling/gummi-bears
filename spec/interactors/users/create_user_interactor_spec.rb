require 'rails_helper'

RSpec.describe Users::CreateUserInteractor do
  let(:first_name) { 'Christopher' }
  let(:last_name) { 'Bartling' }
  let(:username) { 'xbartlingx' }

  subject(:context) { Users::CreateUserInteractor.call(
    first_name: first_name,
    last_name: last_name,
    username: username
  ) }

  describe ".call" do
    context "when given valid parameters" do
      let(:user) { FactoryBot.build(:user) }

      before(:each) do
        allow(User).to receive(:create).and_return(user)
      end

      it "succeeds" do
        expect(context).to be_a_success
      end

      it "provides the user" do
        expect(context.user).to eq(user)
      end
    end

    context "when given invalid parameters" do
      let(:first_name) { nil }
      let(:last_name) { nil }
      let(:username) { nil }

      before do
        allow(User).to receive(:create).and_return(nil)
      end

      it "fails" do
        expect(context).to be_a_failure
      end

      it "provides a failure message" do
        expect(context.message).to be_present
      end
    end
  end
end
