
<if @user_p@ eq 1>  
<table>
<tr>
<td>
<img src="/shared/portrait-bits.tcl?user_id=@random_user_id@" alt="Portrait of @full_name@" style="border:2px solid #e2e2e2;"> 
</td>
<td valign="top">
#random-photo-portlet.One_member#
<ul class="mktree">
<li class="liClosed">
<b>#random-photo-portlet.Name#</b> <a href="/dotlrn/community-member?user_id=@user_id@">@full_name@</a> <br>
<if @random_user_bio@ ne "">
<b>About:</b> @random_user_bio;noquote@<br>
</if>
<if @random_user_groups@ ne "">
<b>Groups:</b> @random_user_groups;noquote@<br>
</if>
</li>
</ul>
<td>
</tr>
</table>
</if>

<if @user_p@ eq 0>
#random-photo-portlet.lt_There_are_no_photos_t#
</if> 

