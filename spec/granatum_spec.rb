require 'spec_helper'

RSpec.describe "Granatum" do

  before(:all) do
    @token = "token"
  end

  let ( :valid_customer ) { { nome: 'teste', documento: '24749752762' } }
  let ( :valid_entry ) { { descricao: 'teste', conta_id: '51070', categoria_id: '480917', valor: '10.00', data_vencimento: '2016-07-30' } }
  let ( :valid_cpf ) { '87626523202' }

  it 'create customer successfully' do
    VCR.use_cassette('response_valid_customer') do
      granatum_api = Granatum::API::Connection.new(@token)
      response = granatum_api.customer(valid_customer)

      expect(response).to be_a Hash
      expect(response['nome']).to eq('teste')
    end
  end

  it 'create entry successfully' do
    VCR.use_cassette('response_valid_entry') do
      granatum_api = Granatum::API::Connection.new(@token)
      response = granatum_api.entry(valid_entry)

      expect(response).to be_a Hash
      expect(response['descricao']).to eq('teste')
    end
  end

  it 'search customer by cpf successfully' do
    VCR.use_cassette('response_customer') do
      granatum_api = Granatum::API::Connection.new('8c953409a379289cd99ba22ccbfef9e996d9457ebead020b2ada10bd58367172')
      response = granatum_api.customer_by_cpf(valid_cpf)

      expect(response).to be_a Array
      expect(response.first['nome']).to eq('teste')
    end
  end

end