# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Objects" do
    describe "Admin" do
      describe "objects" do
        login_refinery_user

        describe "objects list" do
          before(:each) do
            FactoryGirl.create(:object, :title => "UniqueTitleOne")
            FactoryGirl.create(:object, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.objects_admin_objects_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.objects_admin_objects_path

            click_link "Add New Object"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Objects::Object.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Objects::Object.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:object, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.objects_admin_objects_path

              click_link "Add New Object"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Objects::Object.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:object, :title => "A title") }

          it "should succeed" do
            visit refinery.objects_admin_objects_path

            within ".actions" do
              click_link "Edit this object"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:object, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.objects_admin_objects_path

            click_link "Remove this object forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Objects::Object.count.should == 0
          end
        end

      end
    end
  end
end
