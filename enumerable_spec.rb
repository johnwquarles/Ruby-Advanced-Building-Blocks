require_relative "enumerable.rb"

describe "enumerable" do
  
  before :each do
    @array = [1,2,3,4,5]
  end
  
  describe "#my_each" do
    
    context "when no block given" do
      it "returns the argument given" do
        expect(@array.my_each).to eql @array
      end
    end
    
    context "when block given" do
      it "manipulates each element like it's supposed to" do
        new = []
        @array.my_each {|num| new << num * 2}
        expect(new).to eql [2,4,6,8,10]
      end
    end
  end

  describe "#my_select" do
    context "when no block given" do
      it "returns the argument given" do
        expect(@array.my_select).to eql @array
      end
    end
    
    context "when block given" do
      it "returns arrays like it's supposed to (includes elements for which the block is true; ignores the rest)" do
        test_array = @array.my_select {|num| num.odd?}
        supposed_to_be = [1,3,5]
        expect(test_array).to eql supposed_to_be
      end
    end
  end

  describe "#my_all?" do
    
    context "when no block given" do
      it "returns false if something in the collection it's acting upon evaluates to false" do
        expect([true, true, false].my_all?).to eql false
      end
      
      it "returns true when everything in the collection it's acting upon evaluates to true" do
        expect([true, true, true].my_all?).to eql true
      end
    end
  
    context "when block given" do
      it "returns false if something in the collection, when evaluated by the block, evaluates to false" do
        expect(@array.my_all? {|num| num != 5}).to eql false
      end
    
      it "returns true if everything in the collection, when evaluated by the block, evaluates to true" do
        expect(@array.my_all? {|num| num != 6}).to eql true
      end
    end
  end

  describe "#my_none?" do
    
    context "when no block given" do
      it "returns true when everything in the collection it's acting upon evaluates to false" do
        expect([false, false, false].my_none?).to eql true
      end
      
      it "returns false when something in the collection it's acting upon evaluates to true" do
        expect([false, false, true].my_none?).to eql false
      end
    end
    
    context "when block given" do
      it "returns true if everything in the collection, when evaluated by the block, evaluates to false" do
        expect(@array.my_none? {|num| num == 6}).to eql true
      end
      
      it "returns false if anything in the collection, when evaluated by the block, evaluates to true" do
        expect(@array.my_none? {|num| num == 5}).to eql false
      end
    end
  end
  
  describe "#my_map" do
    
    before :all do
      @times_three_proc = Proc.new {|num| num * 3}
    end
    
    context "when no proc or block provided" do
      it "returns the object without changing anything" do
        expect(@array.my_map).to eql @array
      end
    end
  
    context "when proc provided" do
      it "returns a map consisting of the original array's elements properly mapped according to the proc" do
        expect(@array.my_map(@times_three_proc)).to eql [3,6,9,12,15]
      end
    end
  
    context "when block provided" do
      it "returns a map consisting of the original array's elements properly mapped according to the block" do
        expect(@array.my_map {|num| num * 2}).to eql [2,4,6,8,10]
      end
    end
    
    context "when block and proc provided" do
      it "returns a map consisting of the original array's element mapped according to both" do
        expect(@array.my_map(@times_three_proc) {|num| num * 2}).to eql [6, 12, 18, 24, 30]
      end
    end
  end

  describe "#my_count" do
    
    context "when no block or find argument provided" do
      it "returns self.length" do
        expect(@array.my_count).to eql @array.length
      end
    end
  
    context "when a block is provided" do
      it "counts the elements in self that return true when evaluated by the block" do
        expect(@array.my_count {|num| num.odd?}).to eql 3
      end
    end
    
    context "when a find argument is provided" do
      it "counts the element in self that equal the find argument" do
        expect(@array.my_count(1)).to eql 1
      end
    end
    
    context "when both a block and find argument are provided" do
      it "ignores the block and defaults to just searching for the find argument" do
        expect(@array.my_count(1) {|num| num.even?}).to eql 1
      end
    end
  end

end