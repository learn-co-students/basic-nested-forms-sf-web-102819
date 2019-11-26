class PeopleController < ApplicationController
  def new
    @person = Person.new
    # add two empty addresses to fill out.
    # we use .build here because we have a collection
    # we want to build addresses instances that the person instance owns

    # why are passing in these attributes?????????
    # ANSWER:
    # we pass in these attr, so that they are prefilled
    @person.addresses.build(address_type: "work")
    @person.addresses.build(address_type: "home")
  end

  def create    
    Person.create(person_params)
    redirect_to people_path
  end

  def index
    @people = Person.all
  end

  private

  # need to modify person_params to accept the new attributes from address
  # why do we have addresses_attributes arr????
  # ANSWER:
  # it's rails convention when we have a nested forms to have collection_attributes: arr
  def person_params
    params.require(:person).permit(:name, addresses_attributes: [
      :street_address_1,
      :street_address_2,
      :city,
      :state,
      :zipcode,
      :address_type
    ])
  end
end
