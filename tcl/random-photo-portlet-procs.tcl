ad_library {

    Procedures to support the evaluation portlets

    @creation-date May 2004
    @author gmorales@galileo.edu
    @cvs_id $Id$

}

namespace eval rphoto_display_portlet {}

#
# evaluation assignments namespace
#

ad_proc -private rphoto_display_portlet::get_my_name {
} {
    return "rphoto_display_portlet"
}



ad_proc -private rphoto_display_portlet::my_package_key {
} {
    return "random-photo-portlet"
}



ad_proc -public rphoto_display_portlet::get_pretty_name {
} {
    return "[_ random-photo-portlet.One_member]"
}



ad_proc -public rphoto_display_portlet::link {
} {
    return ""
}



ad_proc -public rphoto_display_portlet::add_self_to_page {
    {-portal_id:required}
    {-package_id:required}
    {-param_action:required}
} {
    Adds a evaluation PE to the given portal.
    
    @param portal_id The page to add self to
    @param package_id The community with the folder
    
    @return element_id The new element's id
} {
    return [portal::add_element_parameters \
                -portal_id $portal_id \
                -portlet_name [get_my_name] \
                -value $package_id \
                -force_region [parameter::get_from_package_key \
                                   -parameter "rphoto_display_portlet_force_region" \
                                   -package_key [my_package_key]] \
                -pretty_name [get_pretty_name] \
                -param_action $param_action
           ]
}



ad_proc -public rphoto_display_portlet::remove_self_from_page {
    {-portal_id:required}
    {-package_id:required}
} {
    Removes a evaluation PE from the given page or the package_id of the
    evaluation package from the portlet if there are others remaining
    
    @param portal_id The page to remove self from
    @param package_id
} {
    portal::remove_element_parameters \
        -portal_id $portal_id \
        -portlet_name [get_my_name] \
        -value $package_id
}



ad_proc -public rphoto_display_portlet::show {
    cf
} {
    portal::show_proc_helper \
        -package_key [my_package_key] \
        -config_list $cf \
        -template_src "random-photo-portlet"
}

