require_relative '../assignment_2.rb'

RSpec.describe "enumerable methods" do
  describe "#my_each" do
    it "load array" do
      expect([1,2,3].my_each{|el| el}).to eql([1,2,3])
    end
  end

  describe "#my_select" do
    it "find elements > 5" do
      expect([1,2,3,4,5,6,7,8,9].my_select {|el| el > 5}).to eql([6,7,8,9])
    end

    describe "#my_all" do
      it "show all elements are > 5" do
        expect([6,7,8,9].my_all? {|el| el > 5}).to eql(true)
      end
    end

    describe "#my_all" do
      it "show not all elements are > 5" do
        expect([5, 6,7,8,9].my_all? {|el| el > 5}).to eql(false)
      end
    end

    describe "#my_any" do
      it "show at least 1 element > 5" do
        expect([1,2,3,4,5,6].my_any? {|el| el > 5}).to eql(true)
      end
    end

    describe "#my_any" do
      it "show no element > 5" do
        expect([1,2,3,4,5].my_any? {|el| el > 5}).to eql(false)
      end
    end

  end
end
