module ApplicationHelper

  def user_account_menu
    account_menu = ""
    if user_signed_in?
      account_menu << "<div class=\"btn-group pull-right\">"
      account_menu << "<a class=\"btn dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">"
      account_menu << "<i class=\"icon-user\"></i> #{current_user.email}"
      account_menu << "<span class=\"caret\"></span>"
      account_menu << "</a>"
  		account_menu << "<ul class=\"dropdown-menu\">"
      account_menu << "<li><a href=\"#\">Profile</a></li>"
      account_menu << "<li class=\"divider\"></li>"
      account_menu << "<li>#{link_to(t(:signout, :default => "Sign out"), destroy_user_session_path, :method => :delete)}</li>"
      account_menu << "</ul>"	
  	  account_menu << "</div>"
  	else
      account_menu << "<div class=\"nav-collapse pull-right\">"
      account_menu << "<ul class=\"nav\">"
      account_menu << "<li>#{link_to "Sign in"}</li>"
      account_menu << "</ul>"
      account_menu << "</div>" 
  	end
	  
	  return account_menu.html_safe
  end
end
