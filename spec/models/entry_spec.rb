require 'spec_helper'

describe Entry do

  let(:category) { FactoryGirl.create(:entry_category) }
  let(:entry) { FactoryGirl.create(:entry, :category_number => category.number) }
  describe 'Validates' do
    it 'should fail saving without a name' do
      entry                 = Entry.new
      entry.name            = ""
      entry.fonder          = FactoryGirl.create(:user)
      entry.last_editor     = FactoryGirl.create(:user)
      entry.category_number = category.number
      entry.save.should     == false
    end

    it 'should fail saving uniqueness a name' do
      new_entry = FactoryGirl.build(:entry, :name => entry.name, :category_number => category.number)
      new_entry.save.should == false
    end
  end

  describe 'create' do
    it 'should have a version after a entry created' do
      entry.versions.length.should == 1
    end
  end

  describe 'upadte' do
    it 'should have a new version after a entry updated' do
      new_content = "example"
      old_content = entry.content

      entry.update_attribute(:content, new_content)
      
      entry.content.should                     == new_content
      entry.versions.last.reify.content.should == old_content
    end
  end
end
 