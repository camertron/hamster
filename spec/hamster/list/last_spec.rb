require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

require 'hamster/list'

describe Hamster::List do

  describe "#last" do

    [
      [[], nil],
      [["A"], ["A"]],
      [["A", "B", "C"], "C"],
    ].each do |values, expected|

      describe "on #{values.inspect}" do

        before do
          original = Hamster.list(*values)
          pending do
            @result = original.last
          end
        end

        it "returns #{expected.inspect}" do
          @result.should == Hamster.list(*expected)
        end

      end

    end

  end

end