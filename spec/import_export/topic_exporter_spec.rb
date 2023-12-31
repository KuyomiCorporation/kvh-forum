# frozen_string_literal: true

require "import_export"

RSpec.describe ImportExport::TopicExporter do
  before { STDOUT.stubs(:write) }

  fab!(:user)
  fab!(:topic) { Fabricate(:topic, user: user) }
  fab!(:post) { Fabricate(:post, topic: topic, user: user) }

  describe ".perform" do
    it "export a single topic" do
      data = ImportExport::TopicExporter.new([topic.id]).perform.export_data

      expect(data[:categories].blank?).to eq(true)
      expect(data[:groups].blank?).to eq(true)
      expect(data[:topics].count).to eq(1)
      expect(data[:users].count).to eq(1)
    end

    it "export multiple topics" do
      topic2 = Fabricate(:topic, user: user)
      _post2 = Fabricate(:post, user: user, topic: topic2)
      data = ImportExport::TopicExporter.new([topic.id, topic2.id]).perform.export_data

      expect(data[:categories].blank?).to eq(true)
      expect(data[:groups].blank?).to eq(true)
      expect(data[:topics].count).to eq(2)
      expect(data[:users].map { |u| u[:id] }).to match_array([user.id])
    end
  end
end
