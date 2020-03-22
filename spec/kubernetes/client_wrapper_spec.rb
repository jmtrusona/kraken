# frozen_string_literal: true

require 'kubernetes/client_wrapper'

RSpec.describe Kubernetes::ClientWrapper do
  let(:client) { double }
  let(:api) { double }
  let(:resource) { double }

  subject { Kubernetes::ClientWrapper.new(client) }

  it 'delegates find_pods_by_label to the initialized client' do
    expect(client).to receive(:api).with('v1')
                                   .and_return(api)

    expect(api).to receive(:resource).with('pods', { namespace: 'uat' })
                                     .and_return(resource)

    expect(resource).to receive(:list).with({ labelSelector: { app: 'taco' } })
                                      .and_return(double)

    subject.find_pods_by_label('taco')
  end
end
