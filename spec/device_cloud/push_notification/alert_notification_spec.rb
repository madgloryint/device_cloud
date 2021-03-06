require 'spec_helper'

describe DeviceCloud::PushNotification::AlertNotification do
  describe "#handle!" do
    let(:data) do
      {
        'id' => 1234,
        'device_id' => 'm:1392301029',
        'type' => 'some type',
        'queued_dt' => '2013-06-24T14:52:55.421Z',
        'value' => {'this' => 'is a value'}
      }
    end
    let(:file_data) { OpenStruct.new(data: data, full_path: '/foo/bar/baz.json') }

    subject { DeviceCloud::PushNotification::AlertNotification.new file_data }

    it "should call the DeviceCloud.alert_notification_handler with self" do
      handled_alert = nil
      DeviceCloud.alert_notification_handler = ->(alert) { handled_alert = alert }

      subject.handle!
      expect(handled_alert).to eq subject
    end
  end
end