require "spec_helper"
require "ostruct"
require "chef-workstation/target_host"

RSpec.describe ChefWorkstation::TargetHost do
  let(:host) { "mock://example.com" }
  let(:sudo) { true }
  let(:logger) { nil }
  subject(:subject) { ChefWorkstation::TargetHost.new(host, sudo: sudo, logger: logger) }

  context "#run_command!" do
    let(:backend) { double("backend") }
    let(:exit_status) { 0 }
    let(:result) { RemoteExecResult.new(exit_status, "", "an error occurred") }

    before do
      allow(subject).to receive(:backend).and_return(backend)
      allow(backend).to receive(:run_command).and_return(result)
    end
    context "when no error occurs" do
      let(:exit_status) { 0 }
      it "returns the result" do
        expect(subject.run_command!("valid")).to eq result
      end
    end

    context "when an error occurs" do
      let(:exit_status) { 1 }
      it "raises a RemoteExecutionFailed error" do
        expect { subject.run_command!("invalid") }.to raise_error ChefWorkstation::TargetHost::RemoteExecutionFailed
      end
    end
  end
end
