RSpec.describe IfrAirports do
 
  it 'instantiates an instance of CLI' do
    cli = IfrAirports::CLI.new
    
    allow($stdout).to receive(:puts)
   
    allow(cli).to receive(:gets).and_return("CO")


    run_file("./bin/ifr-airports")
  end


end
