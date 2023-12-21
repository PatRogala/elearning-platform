module UsersHelper
  def avatar_or_default_for(user, options = { variant: :medium, class_name: "" })
    if user.avatar.attached?
      image_tag(user.avatar,
                class: options[:class_name])
    else
      generate_avatar_placeholder(user, options)
    end
  end

  private

  SIZE_THUMB = "50px".freeze
  SIZE_DEFAULT = "100px".freeze

  def generate_avatar_placeholder(user, options)
    variant = options[:variant]
    initials = user.initials
    class_name = options[:class_name]

    size = determine_size(variant)
    class_names = build_class_names(size, class_name)

    content_tag(:span, initials, class: class_names.join(" "))
  end

  def determine_size(variant)
    case variant
    when :thumb then SIZE_THUMB
    else SIZE_DEFAULT
    end
  end

  def build_class_names(size, class_name)
    base_classes(size) + hover_classes + [class_name]
  end

  def base_classes(size)
    flex_classes + size_classes(size) + text_classes + border_classes
  end

  def flex_classes
    %w[inline-flex items-center justify-center]
  end

  def size_classes(size)
    ["h-[#{size}]", "w-[#{size}]"]
  end

  def text_classes
    ["text-sm", "font-semibold", "leading-none", "text-accent-dark", "dark:text-accent"]
  end

  def border_classes
    ["rounded-full", "border", "border-accent-dark", "dark:border-accent"]
  end

  def hover_classes
    [
      "hover:bg-accent-dark",
      "hover:text-background-dark",
      "hover:border-background-dark",
      "hover:dark:bg-accent",
      "hover:dark:text-background",
      "hover:dark:border-background",
    ]
  end
end
