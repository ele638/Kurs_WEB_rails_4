class SearchController < ApplicationController
  def search
    @search = MyItem.search(params)
  end
end
