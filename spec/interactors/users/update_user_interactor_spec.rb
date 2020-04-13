require 'rails_helper'

RSpec.describe Users::UpdateUserInteractor do
  let(:id) { SecureRandom.uuid }
  let(:first_name) { 'Christopher' }
  let(:last_name) { 'Bartling' }
  let(:user) { FactoryBot.build(:user) }

  subject(:context) { Users::UpdateUserInteractor.call(
    id: id,
    first_name: first_name,
    last_name: last_name,
  ) }

  describe ".call" do
    context "when given valid parameters" do
      before(:each) do
        allow(User).to receive(:find).with(id).and_return(user)
        allow(user).to receive(:update).and_return(true)
      end

      it "succeeds" do
        expect(context).to be_a_success
      end

      it "provides the user" do
        expect(context.user).to eq(user)
      end
    end

    context "when update fails" do
      before(:each) do
        allow(User).to receive(:find).with(id).and_return(user)
        allow(user).to receive(:update).and_return(false)
      end

      it "fails" do
        expect(context).to be_a_failure
      end

      it "provides a failure message" do
        expect(context.message).to be_present
      end
    end

    context "when find by id fails" do
      before(:each) do
        allow(User).to receive(:find).with(id).and_return(nil)
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
