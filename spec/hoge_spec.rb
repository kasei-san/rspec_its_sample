require_relative '../lib/hoge'

RSpec.describe Hoge do
  let(:message){ 'hello' }
  subject { Hoge.new(message) }

  # こんな風に書き換えられる
  #it { expect(subject.message).to eq(message) }
  its(:message) { is_expected.to eq(message) }

  # ネストできる
  its('say.hello') { is_expected.to eq('hello') }

  describe '#saids' do
    before do
      @hoge = Hoge.new(message)
      @hoge.say.hello
      @hoge.say.hoo
    end
    subject { @hoge }
    # 複数型なら `are_expected`
    its('saids') { are_expected.to eq(%w[hello hoo]) }

    describe 'array' do
      subject { @hoge.saids }
      # 配列の要素指定
      its([1]) { is_expected.to eq('hoo') }
    end
  end
end
