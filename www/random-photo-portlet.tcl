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

    set comm_list [db_list select_all_communities "*SQL*"] 
    set random_comm_pos [expr { int(rand()*[llength $comm_list])}]
    set random_comm_id [lindex $comm_list $random_comm_pos]

}

set users_list [db_list "members" "*SQL*"]
set random_user_pos [expr { int(rand()*[llength $users_list])}]
set random_user_id [lindex $users_list $random_user_pos] 

if ![db_0or1row "get_member_info" "*SQL*"] {
set user_p 0
} else {
set user_p 1
}

db_1row "get_commutity_name" "select pretty_name from dotlrn_communities_all where community_id = :random_comm_id"
