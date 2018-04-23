require_relative "../receipt"

describe Receipt do
   context "Calculate sales taxes" do

      it "should not charge any tax for local book" do
        receipt = Receipt.new([[1, "book", 12.49]])
        expect(receipt.sales_taxes).to eq 0
      end

      it "should not charge any tax for local food" do
        receipt = Receipt.new([[1, "chocolate bar", 0.85]])
        expect(receipt.sales_taxes).to eq 0
      end

      it "should not charge any tax for local medicine" do
        receipt = Receipt.new([[1, "packet of headache pills", 9.75]])
        expect(receipt.sales_taxes).to eq 0
      end

      it "should charge 10% sales tax for local product" do
        receipt = Receipt.new([[1, "music cd", 14.99]])
        expect(receipt.sales_taxes).to eq 1.50
      end

      it "should charge 5% import tax for imported food" do
        receipt = Receipt.new([[1, "imported box of chocolates", 10.00]])
        expect(receipt.sales_taxes).to eq 0.50
      end

      it "should charge 15% salexs tax + import tax for imported product" do
        receipt = Receipt.new([[1, "imported bottle of perfume", 47.50]])
        expect(receipt.sales_taxes).to eq 7.15
      end

   end
end
