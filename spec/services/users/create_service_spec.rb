describe Users::CreateService do
  subject { described_class }

  context 'valid parameters' do
    specify { expect { subject.call('user', 'user@example.com', 'password') }.to change(User, :count).from(0).to(1) }

    it 'assigns user' do
      result = subject.call('user', 'user@example.com', 'password')

      expect(result.user).to be_kind_of(User)
    end
  end

  context 'invalid parameters' do
    specify { expect { subject.call('user', 'user@example.com', '') }.not_to change(User, :count) }

    it 'assigns user' do
      result = subject.call('user', 'user@example.com', '')

      expect(result.user).to be_kind_of(User)
    end
  end
end
