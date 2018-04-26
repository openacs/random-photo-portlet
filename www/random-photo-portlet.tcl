ad_page_contract {  
    Find all users that makes match with the keyword   
    @author Gerardo Morales Cadoret (gmorales@galileo.edu)  
    @creation-date 2004-03-02  
} { 

}  -properties {  
    title:onevalue  
    user_id:onevalue
}  


set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
set random_comm_id [dotlrn_community::get_community_id]

if [empty_string_p $random_comm_id] {
# If the user is in "My Space"
    set random_comm_id [db_list communities "*SQL*"]
}

set users_list [db_list "members" "*SQL*"]
set random_user_pos [expr { int(rand()*[llength $users_list])}]
set random_user_id [lindex $users_list $random_user_pos]
set bio [ad_html_to_text [person::get_bio -person_id $random_user_id]] 
set random_user_bio [string trim [string range $bio 0 200]]
if { [string length $bio] > 200 } {
  append random_user_bio " ... <a href=\"/dotlrn/community-member?user_id=$random_user_id\">more</a>"
}

# get user's communities
set groups {}
set community_list [dotlrn_community::get_all_communities_by_user $random_user_id]
foreach item $community_list {
	lappend groups [ns_set get $item "pretty_name"]
}
set random_user_groups [join $groups ", "]

if ![db_0or1row "get_member_info" "*SQL*"] {
set user_p 0
} else {
set user_p 1
}

db_1row "get_commutity_name" "select pretty_name from dotlrn_communities_all where community_id = :random_comm_id"

template::head::add_javascript -src "/resources/acs-templating/mktree.js"
template::head::add_css -href "/resources/acs-templating/mktree.css"

