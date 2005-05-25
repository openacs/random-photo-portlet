<?xml version="1.0"?>

<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

    <fullquery name="communities">
        <querytext>
            select dotlrn_communities_all.community_id
            from dotlrn_communities_all,
            dotlrn_member_rels_approved
            where dotlrn_communities_all.community_id = dotlrn_member_rels_approved.community_id
            and dotlrn_member_rels_approved.user_id = :user_id
            order by random ()
            limit 1
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
            order by random ()
            limit 1
       </querytext>
   </fullquery>


</queryset>

