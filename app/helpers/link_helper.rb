module LinkHelper
  def action_links_for(model, *actions)
    actions ||= [:edit, :delete]
    render partial: 'common/actions', locals: { model: model, actions: actions }
  end
end
