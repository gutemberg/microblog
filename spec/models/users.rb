require 'spec_helper'
require 'app/models/user'

describe User do
  it { should belong_to :profile }
end