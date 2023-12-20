module UsersHelper
  def avatar_or_default_for(user, options = { variant: :medium, class_name: '' })
    user.avatar.attached? ? image_tag(user.avatar.variant(options), class: options[:class_name]) : generate_avatar_placeholder(user, options)
  end

  private

  SIZE_THUMB = '50px'
  SIZE_DEFAULT = '100px'

  def generate_avatar_placeholder(user, options)
    variant = options[:variant]
    initials = user.initials
    class_name = options[:class_name]

    size = case variant
           when :thumb then SIZE_THUMB
           else SIZE_DEFAULT
           end

    class_names = [
      "inline-flex",
      "items-center",
      "justify-center",
      "h-[#{size}]",
      "w-[#{size}]",
      "text-sm",
      "font-semibold",
      "leading-none",
      "rounded-full",
      "border",
      "border-accent-dark",
      "text-accent-dark",
      "dark:border-accent",
      "dark:text-accent",
      "hover:bg-accent-dark",
      "hover:text-background-dark",
      "hover:border-background-dark",
      "hover:dark:bg-accent",
      "hover:dark:text-background",
      "hover:dark:border-background",
      class_name
    ]

    content_tag(:span, initials, class: class_names.join(' '))
  end
end