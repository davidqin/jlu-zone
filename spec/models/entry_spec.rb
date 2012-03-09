require 'spec_helper'

describe Entry do

  let(:category) { Factory(:category) }
  let(:entry) { Factory(:entry, :category_number => category.number) }
  describe 'Validates' do
    it 'should fail saving without a name' do
      entry                 = Entry.new
      entry.name            = ""
      entry.fonder          = Factory(:user)
      entry.category_number = category.number
      entry.save.should     == false
    end

    it 'should fail saving uniqueness a name' do
      new_entry = Factory.build(:entry, :name => entry.name, :category_number => category.number)
      new_entry.save.should == false
    end
  end

  describe 'create' do
    it 'should have no version after a entry created' do
      entry.versions.should == []
    end
  end

  describe 'upadte' do
    it 'should have a new version after a entry updated' do
      new_content = "example"
      old_content = entry.content

      entry.new_version_editor  = Factory :user
      entry.new_version_content = old_content

      entry.update_attribute(:content, new_content)
      
      entry.versions.should_not           == []
      entry.content.should                == new_content
      entry.versions.first.content.should == old_content
    end
  end
end
 