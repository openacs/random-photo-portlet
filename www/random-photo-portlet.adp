
<if @user_p@ eq 1>  
<table>
<tr>
<td valign="top">
<img src="/shared/portrait-bits.tcl?user_id=@random_user_id@" alt="#acs-subsite.lt_Portrait_of_first_last#" width="135" style="border:2px solid #e2e2e2;"> 
</td>
<td valign="top">
#random-photo-portlet.Who_this#
<ul class="mktree">
<li class="liClosed">
#random-photo-portlet.Click_to_find_out#
<ul>
<li><b>#random-photo-portlet.Name#</b> <a href="/dotlrn/community-member?user_id=@user_id@">@full_name@</a></li>
<if @random_user_bio@ ne "">
<li><b>About:</b> @random_user_bio;noquote@</li>
</if>
<if @random_user_groups@ ne "">
<li><b>#random-photo-portlet.Groups#</b> @random_user_groups;noquote@</li>
</if>
</ul>
</li>
</ul>
<!--
<a href="mailto:@email@">@email@</a>
-->
<td>
</tr>
<!--
<tr>
<td colspan=2>
<b>#random-photo-portlet.Name#</b> <a href="/dotlrn/community-member?user_id=@user_id@">@full_name@</a>  <br>
<b>#random-photo-portlet.Role#</b> #random-photo-portlet.role_of_pretty_name#
</td>
</tr>
-->
</table>
</if>

<if @user_p@ eq 0>
#random-photo-portlet.lt_There_are_no_photos_t#
</if> 
