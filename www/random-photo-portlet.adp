
<if @user_p@ eq 1>  
<table>
<tr>
<td>
<img  src="/shared/portrait-bits.tcl?user_id=@random_user_id@" alt="Portrait of @full_name@"> 
</td>
<td>
<a href="mailto:@email@">@email@</a>
<td>
</tr>
<tr>
<td colspan=2>
<b>#random-photo-portlet.Name#</b> <a href="/dotlrn/community-member?user_id=@user_id@">@full_name@</a>  <br>
<b>#random-photo-portlet.Role#</b> #random-photo-portlet.role_of_pretty_name#
</td>
</tr>
</table>
</if>

<if @user_p@ eq 0>
#random-photo-portlet.lt_There_are_no_photos_t#
</if> 

