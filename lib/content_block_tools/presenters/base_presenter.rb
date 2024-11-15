module ContentBlockTools
  module Presenters
    class BasePresenter
      include ActionView::Helpers::TagHelper

      # The default HTML tag to wrap the presented response in - can be overridden in a subclass
      BASE_TAG_TYPE = :span

      # Returns a new presenter object
      #
      # @param [{ContentBlockTools::ContentBlock}] content_block  A content block object
      #
      # @return [{ContentBlockTools::Presenters::BasePresenter}]
      def initialize(content_block)
        @content_block = content_block
      end

      # Returns a HTML representation of the content block wrapped in a base tag with
      # a class and data attributes
      # Calls the {#content} method, which can be overridden in a subclass
      #
      # @return [string] A HTML representation of the content block
      def render
        content_tag(
          BASE_TAG_TYPE,
          content,
          class: %W[content-embed content-embed__#{content_block.document_type}],
          data: {
            content_block: "",
            document_type: content_block.document_type,
            content_id: content_block.content_id,
          },
        )
      end

    private

      # The default representation of the content block - this can be overridden in a subclass
      #
      # @return [string] A representation of the content block to be wrapped in the base_tag in
      # {#content}
      def content
        content_block.title
      end

      attr_reader :content_block
    end
  end
end