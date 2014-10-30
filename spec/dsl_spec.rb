require 'pry'
require 'spec_helper'
require './dsl'
require './application_controller.rb'
require './concrete_controller'

describe ConcreteController do
  let(:controller) { ConcreteController.new }

  it 'has the value from ApplicationController' do
    expect(controller.dsl_item_values).to include 'controller item'
  end

  it 'has the value from ConcreteController' do
    expect(controller.dsl_item_values).to include 'concrete item'
  end
end
