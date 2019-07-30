RSpec.describe Api::V1::Issues::CreateService, type: :service do
  describe '#call' do
    let(:invalid_issue) { { 'issue' => { 'title' => 'First issut' } } }
    let(:valid_issue) do
      {
        'action' => 'create',
        'issue' =>
        { 'title' => 'First issut', 'number' => '1' }
      }
    end
    context 'return issue errors' do
      it 'when pass a invalid issue/event' do
        issue = Api::V1::Issues::CreateService.new(invalid_issue).call
        expect(issue.success).to be_falsey
        expect(issue.errors).not_to be_nil
      end
    end

    context 'return success' do
      it 'when passing a not existent valid issue/event' do
        issue = Api::V1::Issues::CreateService.new(valid_issue).call
        expect(issue.success).to be_truthy
      end
      it 'when passing a existent issue/event' do
        Api::V1::Issues::CreateService.new(valid_issue).call
        issue = Api::V1::Issues::CreateService.new(valid_issue).call
        expect(issue.success).to be_truthy
        expect(Issue.count).to be(1)
        expect(Event.count).to be(2)
      end
    end
  end
end
