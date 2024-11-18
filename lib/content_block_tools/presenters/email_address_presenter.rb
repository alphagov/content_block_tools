module ContentBlockTools
  module Presenters
    class EmailAddressPresenter < BasePresenter
    private

      def content
        content_block.details[:email_address]
      end
    end
  end
end
