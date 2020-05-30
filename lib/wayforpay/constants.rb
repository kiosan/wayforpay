require 'uri'

module Wayforpay
  module Constants
    URL = URI.parse('https://api.wayforpay.com/api').freeze

    HOLD_ENCRYPT_FIELDS = %i[merchantAccount merchantDomainName orderReference orderDate amount currency productName productCount productPrice].freeze
    REFUND_ENCRYPT_FIELDS = %i[merchantAccount orderReference amount currency].freeze
    SETTLE_ENCRYPT_FIELDS = %i[merchantAccount orderReference amount currency].freeze
    VERIFY_ENCRYPT_FIELDS = %i[merchantAccount merchantDomainName orderReference amount currency].freeze
    CREATE_INVOICE_ENCRYPT_FIELDS = %i[merchantAccount merchantDomainName orderReference orderDate amount currency productName productCount productPrice].freeze
    REMOVE_INVOICE_FIELDS = %i[merchantAccount orderReference].freeze
    ACCEPT_INVOICE_PAYMENT_ENCRYPT_FIELDS = %i[orderReference status time].freeze
    GET_CLIENT_ENCRYPT_FIELDS = %i[merchantAccount recToken card].freeze

    HOLD_ATTRS = {
      transactionType: 'CHARGE',
      authorizationType: 'SimpleSignature',
      merchantTransactionType: 'AUTH',
      merchantTransactionSecureType: 'NON3DS',
      apiVersion: 1
    }.freeze

    REFUND_ATTRS = {
      transactionType: 'REFUND',
      apiVersion: 1
    }.freeze

    SETTLE_ATTRS = {
      transactionType: 'SETTLE',
      apiVersion: 1
    }.freeze

    VERIFY_ATTRS = {
      transactionType: 'VERIFY',
      apiVersion: 1
    }.freeze

    CREATE_INVOICE_ATTRS = {
      transactionType: 'CREATE_INVOICE',
      authorizationType: 'SimpleSignature',
      merchantTransactionType: 'AUTH',
      merchantTransactionSecureType: 'NON3DS',
      apiVersion: 1
    }.freeze

    REMOVE_INVOICE_ATTRS = {
      transactionType: 'REMOVE_INVOICE',
      apiVersion: 1
    }

    ACCEPT_INVOICE_PAYMENT_ATTRS = {
      status:'accept'
    }.freeze

    GET_CLIENT_ATTRS = {
      transactionType: 'GET_CLIENT',
      apiVersion: 1
    }

    def self.hold_params
      HOLD_ATTRS.merge(
        merchantAccount: Wayforpay.merchant_account,
        merchantDomainName: Wayforpay.merchant_domain_name
      )
    end

    def self.refund_params
      REFUND_ATTRS.merge(merchantAccount: Wayforpay.merchant_account)
    end

    def self.settle_params
      SETTLE_ATTRS.merge(merchantAccount: Wayforpay.merchant_account)
    end

    def self.verify_params
      VERIFY_ATTRS.merge(
        merchantAccount: Wayforpay.merchant_account,
        merchantDomainName: Wayforpay.merchant_domain_name
      )
    end

    def self.create_invoice_params
      CREATE_INVOICE_ATTRS.merge(
        merchantAccount: Wayforpay.merchant_account,
        merchantDomainName: Wayforpay.merchant_domain_name
      )
    end
    def self.remove_invoice_params
      REMOVE_INVOICE_ATTRS.merge(
        merchantAccount: Wayforpay.merchant_account,
      )
    end

    def self.accept_invoice_payment_params
      ACCEPT_INVOICE_PAYMENT_ATTRS
    end

    def self.get_client_params
      GET_CLIENT_ATTRS.merge(merchantAccount: Wayforpay.merchant_account)
    end
  end
end
