module LayoutHelper

  def page_header(title, icon: icon, subtitle: subtitle, &block)

    # set page title
    page_title strip_tags(title)

    content_for :page_header do
      haml_tag :div, class: 'pull-right', &block if block_given?
      haml_tag :h1 do
        haml_concat icon(icon) if icon.present?
        haml_concat title
        haml_tag :small, subtitle if subtitle.present?
      end
    end
  end

  def page_title(title)
    content_for(:page_title) do
      [title, 'SCOOBAR'].flatten.reject(&:blank?).join(' - ')
    end
  end

end
