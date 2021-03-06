require_relative '../helper'

describe 'Rails', type: :feature do
  it 'will convert .inky views' do
    visit "/inky/simple"

    expect_same_html page.html, <<-HTML
      <!DOCTYPE html>
      <html><body>
      <table class=" container" align="center"><tbody><tr><td>Simplistic example</td></tr></tbody></table>
      </body></html>
    HTML
  end

  it "won't convert non .inky view" do
    visit "/inky/non_inky"

    expect_same_html page.html, <<-HTML
      <!DOCTYPE html>
      <html><body>
        <container/>
      </body></html>
    HTML
  end

  it "works for a partial convert non .inky view" do
    visit "/inky/non_inky?partial=inky_partial"

    expect_same_html page.html, <<-HTML
      <!DOCTYPE html>
      <html><body>
        <container>
          <table class="button"><tr><td>
            <table><tr><td><a href="bar">Click me</a></td></tr></table>
          </td></tr></table>
        </container>
      </body></html>
    HTML
  end

  it "works for an .inky layout" do
    visit "/inky/layout"

    expect_same_html page.html, <<-HTML
      <!DOCTYPE html>
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
          <title>inky : layout</title>
        </head>
        <body>
          <table class="container" align="center">
            <tbody><tr><td>
              Using inky layout
            </td></tr></tbody>
          </table>
        </body>
      </html>
    HTML
  end
end
