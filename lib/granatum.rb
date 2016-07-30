require 'granatum/version'
require 'httparty'
require 'uri'

module Granatum

  module API

    class Connection

      include HTTParty

      attr_accessor :token

      def initialize(token = nil)
        @token = token
        @url = 'https://api.granatum.com.br/v1/'
      end 

      def entry(data = {})
        method = 'lancamentos'
        url = "#{@url}#{method}?access_token=#{@token}"
        
        send_post(url ,data)
      end

      def customer(data = {})
        method = 'clientes'
        url = "#{@url}#{method}?access_token=#{@token}"

        send_post(url, data)
      end

      def customer_by_cpf(cpf)
        method = 'clientes'
        url = "#{@url}#{method}?access_token=#{@token}&documento=#{cpf}"

        send_get(url)
      end

      
      private

      def send_post(url, data)
        begin
          response = self.class.post(url, body: URI.encode_www_form(data), headers: {'Content-Type': 'application/x-www-form-urlencoded'})

          response.parsed_response

        rescue Exception => e
          puts e
        end
      end

      def send_get(url)
        begin
          response = self.class.get(url)

          response.parsed_response

        rescue Exception => e
          puts e
        end
      end

    end

  end

end
