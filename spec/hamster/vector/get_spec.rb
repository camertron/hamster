require 'spec_helper'

require 'hamster/vector'

describe Hamster::Vector do

  [:get, :[], :at].each do |method|

    describe "##{method}" do

      describe "when empty" do

        before do
          @vector = Hamster.vector
        end

        it "always returns nil" do
          (-10..10).each do |i|
            @vector.get(i).should be_nil
          end
        end

      end

      describe "when not empty" do

        before do
          @vector = Hamster.vector(*(1..1025))
        end

        describe "with a positive index" do

          describe "within the absolute bounds of the vector" do

            it "returns the value at the specified index from the head" do
              (0..(@vector.size - 1)).each do |i|
                @vector.get(i).should == i + 1
              end
            end

          end

          describe "outside the absolute bounds of the vector" do

            it "returns nil" do
              @vector.get(1025).should be_nil
            end

          end

        end

        describe "with a negative index" do

          describe "within the absolute bounds of the vector" do

            it "returns the value at the specified index from the tail" do
              (-1025..-1).each do |i|
                @vector.get(i).should == 1025 + i + 1
              end
            end

          end

          describe "outside the absolute bounds of the vector" do

            it "returns nil" do
              @vector.get(-@vector.size.next).should be_nil
            end

          end

        end

      end

    end

  end

end