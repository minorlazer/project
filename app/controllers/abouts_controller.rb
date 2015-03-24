class AboutsController < ApplicationController
  def self.controller_path
    "pages"
  end
  def about
    @about = About.first
  end
end
