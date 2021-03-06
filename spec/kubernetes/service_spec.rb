# frozen_string_literal: true

require 'kubernetes/service'

RSpec.describe Kraken::Kubernetes::Service do
  context '#find_pods_by_label' do
    let(:kubernetes_client) { double }
    let(:api) { double }
    let(:resource) { double }

    subject { Kraken::Kubernetes::Service.new(kubernetes_client) }

    it 'delegates find_pods_by_label to the initialized client' do
      expect(kubernetes_client).to receive(:api).with('v1')
                                                .and_return(api)

      expect(api).to receive(:resource).with('pods', { namespace: 'uat' })
                                       .and_return(resource)

      expect(resource).to receive(:list).with({ labelSelector: { app: 'taco' } })
                                        .and_return([double_pod('taco-abc-123')])

      subject.find_pods_by_label('taco')
    end
  end

  private

  def double_pod(name = 'pod-abc-123', status = 'Running')
    fake_pod = double

    fake_medata = double
    expect(fake_pod).to receive(:metadata).and_return(fake_medata)
    expect(fake_medata).to receive(:name).and_return(name)

    fake_status = double
    expect(fake_pod).to receive(:status).and_return(fake_status)
    expect(fake_status).to receive(:phase).and_return(status)

    fake_pod
  end
end
