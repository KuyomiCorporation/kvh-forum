# frozen_string_literal: true

class SiteCategorySerializer < BasicCategorySerializer
  attributes :allowed_tags,
             :allowed_tag_groups,
             :allow_global_tags,
             :read_only_banner,
             :form_template_ids

  has_many :category_required_tag_groups, key: :required_tag_groups, embed: :objects

  def form_template_ids
    object.form_template_ids.sort
  end

  def include_allowed_tags?
    SiteSetting.tagging_enabled
  end

  def allowed_tags
    object.tags.pluck(:name)
  end

  def include_allowed_tag_groups?
    SiteSetting.tagging_enabled
  end

  def allowed_tag_groups
    object.tag_groups.pluck(:name)
  end

  def include_allow_global_tags?
    SiteSetting.tagging_enabled
  end

  def include_required_tag_groups?
    SiteSetting.tagging_enabled
  end

  def notification_level
    return if !scope || scope.anonymous?

    CategoryUser.where(user_id: scope.user.id, category_id: object.id).pick(:notification_level) ||
      CategoryUser.default_notification_level
  end

  def permission
    return if !scope || scope.anonymous?

    if scope.is_admin? || Category.topic_create_allowed(scope).include?(object.id)
      CategoryGroup.permission_types[:full]
    end
  end
end
