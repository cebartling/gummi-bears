require 'rails_helper'

RSpec.describe Metrics::CreateMetricInteractor do
  let(:name) { '5 Day Simple Moving Average' }

  subject(:context) { Metrics::CreateMetricInteractor.call(name: name) }

  describe '.call' do
    context 'when given valid parameters' do
      let(:metric) { FactoryBot.build(:metric) }

      context 'when metric does not already exist' do
        before(:each) do
          allow(Metric).to receive(:create!).and_return(metric)
        end

        it 'succeeds' do
          expect(context).to be_a_success
        end

        it 'provides the newly created metric' do
          expect(context.metric).to eq(metric)
        end
      end

      context 'when metric previously exists' do
        before(:each) do
          allow(Metric).to receive(:find_by).with(name: name).and_return(metric)
        end

        it 'succeeds' do
          expect(context).to be_a_success
        end

        it "provides the existing metric" do
          expect(context.metric).to eq(metric)
        end
      end
    end

    context 'when given invalid parameters' do
      let(:metric) { FactoryBot.build(:metric) }


      context 'when unable to create the user/metric association' do
        before(:each) do
          allow(Metric).to receive(:create!).with(name: name).and_raise('an error occurred')
        end

        it 'fails' do
          expect(context).to be_a_failure
        end

        it 'provides a failure message' do
          expect(context.message).to be_present
        end

        it 'provides an error array with one message' do
          expect(context.errors.length).to eq(1)
        end
      end
    end
  end
end