module Refinery
  module Objects
    class ObjectsController < ::ApplicationController

      before_filter :find_all_objects
      before_filter :find_page

      def index
        present(@page)
      end

      def show
        @object = Object.find(params[:id])
        present(@page)
      end
      
    protected

      def find_all_objects
        @objects = Object.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/objects").first
      end

    end
  end
end
