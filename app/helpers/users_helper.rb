module UsersHelper
  def avatar_or_default_for(user, options = { variant: :medium, class_name: '' })
    if user.avatar.attached?
      image_tag user.avatar.variant(options), class: options[:class_name]
    else
      generate_avatar_placeholder(options[:variant] , user.initials, options[:class_name])
    end
  end

  private

  def generate_avatar_placeholder(variant, initials, class_name)
    size = case variant
           when :thumb then '50px'
           else '100px'
           end

    <<-HTML.html_safe
    <span class="inline-flex items-center justify-center h-[#{size}] w-[#{size}] text-sm font-semibold leading-none rounded-full border border-accent-dark text-accent-dark dark:border-accent dark:text-accent hover:bg-accent-dark hover:text-background-dark hover:border-background-dark hover:dark:bg-accent hover:dark:text-background hover:dark:border-background #{class_name}">
      #{initials}
    </span>
    HTML
  end
end