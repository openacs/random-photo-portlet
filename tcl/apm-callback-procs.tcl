ad_library {
    Procedures for initializing service contracts etc. for the
    random-photo-portlet package. Should only be executed 
    once upon installation.
    
    @creation-date May 2004
    @author gmorales@galileo.edu
    @cvs-id $Id$
}

namespace eval rphoto_portlet {}
namespace eval rphoto_display_portlet {}

ad_proc -private rphoto_portlet::after_install {} {
    Create the datasources needed by the evaluation portlets.
} {
        rphoto_display_portlet::after_install
}

ad_proc -private rphoto_display_portlet::after_install {} {
    Create the datasources needed by the random photo portlet.
} {
    
    db_transaction {
	set ds_id [portal::datasource::new \
                   -name "rphoto_display_portlet" \
                   -description "A photo of one random member of the community"]

	portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key shadeable_p \
            -value t

	portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key hideable_p \
            -value t

        portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key user_editable_p \
            -value f

        portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key shaded_p \
            -value f

        portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key link_hideable_p \
            -value f

        portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p f \
            -key package_id \
            -value ""

	register_portal_datasource_impl

    }
}

ad_proc -private rphoto_display_portlet::register_portal_datasource_impl {} {
    Create the service contracts needed by the evaluation assignments portlet.
} {
    set spec {
        name "rphoto_display_portlet"
	contract_name "portal_datasource"
	owner "random-photo-portlet"
        aliases {
	    GetMyName rphoto_display_portlet::get_my_name
	    GetPrettyName  rphoto_display_portlet::get_pretty_name
	    Link rphoto_display_portlet::link
	    AddSelfToPage rphoto_display_portlet::add_self_to_page
	    Show rphoto_display_portlet::show
	    Edit rphoto_display_portlet::edit
	    RemoveSelfFromPage rphoto_display_portlet::remove_self_from_page
        }
    }
    
    acs_sc::impl::new_from_spec -spec $spec
}

ad_proc -private rphoto_display_portlet::before_uninstall {} {
    Evaluation Portlet package uninstall proc
} {

    db_transaction {
        rphoto_display_portlet::uninstall
    }
}

ad_proc -private rphoto_display_portlet::uninstall {} {
    Evaluation Portlet package uninstall proc
} {
    unregister_implementations
}

ad_proc -private rphoto_display_portlet::unregister_implementations {} {
    Unregister service contract implementations
} {
    acs_sc::impl::delete \
        -contract_name "portal_datasource" \
        -impl_name "rphoto_display_portlet"
}
