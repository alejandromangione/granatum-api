# Granatum API

Gem to connect on Granatum API

## Installation

Add this line to your application's Gemfile:

gem 'granatum-api'

And then execute:

$ bundle

Or install it yourself as:

```
$ gem install granatum-api to
```

## Usage

```
# cria uma conexão 
granatum_api = Granatum::API::Connection.new("8c953409a379289cd99ba22ccbfef9e996d9457ebead020b2ada10bd58367172")

# verificar um cliente pelo cpf
response = granatum_api.customer_by_cpf('07880447709')

response.first['id'] unless response.empty?
=> 123456
```


## To-Do
- Implementar os demais métodos
- Adicionar mais testes

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
