require 'rails_helper'

RSpec.feature "User creates new Artist" do
  scenario "when user fills stuff in, and clicks new artist" do
    visit('/artists')
    click_on "New Artist"

    artist_name = 'Imhotep'
    artist_image_path = "http://i.dailymail.co.uk/i/pix/2014/02/20/article-2564321-1BAFAC0B00000578-133_634x361.jpg"

    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path

    click_on "Create Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
    expect(current_path).to eq(artists_path)
  end
end

#As a user
# When I visit the artists index
# And I click "New artist"
# And I fill in the name
# And I fill in an image path
# And I click "Create Artist"
# Then I should see the artist name and image on the page
