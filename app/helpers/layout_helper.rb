module LayoutHelper

  def page_header(title, icon: icon, subtitle: subtitle, &block)
    capture_haml do
      haml_tag :div, class: 'page-header' do
        haml_tag :div, class: 'pull-right', &block if block_given?
        haml_tag :h2 do
          haml_concat icon(icon) if icon.present?
          haml_concat title
          haml_tag :small, subtitle, class: 'text-muted' if subtitle.present?
        end
      end
    end
  end

end
