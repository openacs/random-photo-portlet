<?xml version="1.0"?>

<queryset>

    <fullquery name="select_all_communities">
        <querytext>
            select dotlrn_communities_all.community_id
            from dotlrn_communities_all,
            dotlrn_member_rels_approved
            where dotlrn_communities_all.community_id = dotlrn_member_rels_approved.community_id
            and dotlrn_member_rels_approved.user_id = :user_id
        </querytext>
    </fullquery>


    <fullquery name="members">
        <querytext>
           select dotlrn_member_rels_approved.user_id 
           from registered_users, acs_rels a, 
           dotlrn_member_rels_approved 
            where dotlrn_member_rels_approved.community_id = :random_comm_id
            and a.rel_type = 'user_portrait_rel'
            and a.object_id_one = registered_users.user_id
            and dotlrn_member_rels_approved.user_id = registered_users.user_id
       </querytext>
   </fullquery>


    <fullquery name="get_member_info">
        <querytext>
           select dotlrn_member_rels_approved.rel_id, 
                   dotlrn_member_rels_approved.role, 
                   dotlrn_member_rels_approved.user_id, 
                   registered_users.first_names || ' '|| registered_users.last_name as full_name, 
                   registered_users.email 
                   from registered_users, 
                 dotlrn_member_rels_approved 
            where dotlrn_member_rels_approved.community_id = :random_comm_id
            and dotlrn_member_rels_approved.user_id = registered_users.user_id
            and dotlrn_member_rels_approved.user_id = :random_user_id
       </querytext>
   </fullquery>

</queryset>

