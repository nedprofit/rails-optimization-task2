require 'rspec-benchmark'
require 'rspec'
require_relative '../task-2'

RSpec.configure do |config|
  config.include RSpec::Benchmark::Matchers
end

describe 'work' do
  it 'allocates less than n bytes in memory  ' do
    expect { work('data/data_100000_lines.txt') }.to perform_allocation(42000).bytes
  end
end

describe 'performance' do
  it 'work n ms' do
    expect {
      work("data/data_20000_lines.txt")
    }.to perform_under(800).ms.warmup(2).times.sample(5).times
  end
end
