require 'bundler/setup'
require 'benchmark'
require 'active_support/all'

BENCHMARKS = {}
RUNS = 100_000

Dir.chdir(__dir__)
Dir.glob("runners/*.rb").sort.each { |r| load r }

BENCHMARKS.each do |label, callback|
  result = callback.call
  if result != "Hello World!"
    $stderr.puts "Unexpected result for #{label} benchmark: #{result.inspect}"
    exit 1
  end
end

puts "", "Single-Threaded Performance", ""
Benchmark.bmbm do |x|
  BENCHMARKS.each do |label, block|
    x.report(label) { RUNS.times { block.call } }
  end
end

objects = {}
Thread.abort_on_exception = true

puts "", "Multi-Threaded Performance", ""
Benchmark.bmbm do |x|
  BENCHMARKS.each do |label, block|
    x.report(label) do
      before = GC.stat[:total_allocated_objects]
      GC.start
      GC.disable
      RUNS.times { Thread.new(&block).value }
      objects[label] = GC.stat[:total_allocated_objects] - before
      GC.enable
    end
  end
end

puts "", "Allocated Objects (per render with interpolation):"
objects.except(:dummy).each do |label, amount|
  amount -= objects[:dummy]
  puts "#{label.to_s.ljust(14)} #{amount/RUNS}"
end
