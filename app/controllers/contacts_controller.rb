class ContactsController < ApplicationController
  def self.controller_path
    "pages"
  end
  def contact
    @contact = Contact.first
  end
end
