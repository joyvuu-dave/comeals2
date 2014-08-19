class ActiveAdmin::Views::Pages::Base < Arbre::HTML::Document
  private

  # Renders the content for the footer
  def build_footer
    div id: 'footer' do
      para "#{link_to('Source', 'https://github.com/joyvuu-dave/comeals2')}".html_safe
    end
  end
end
