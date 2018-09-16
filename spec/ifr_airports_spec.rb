describe "IfrAirports::CLI" do

  describe "#call" do
    
   it "Does some cool stuff" do
      allow(cli).to receive(:gets).and_return("CO")

      expect($stdout).to receive(:puts).with("IFR Airports")
      expect($stdout).to receive(:puts).with("Please provide a State name to search (or 'exit')")

      cli.call
    end
    
  end
end