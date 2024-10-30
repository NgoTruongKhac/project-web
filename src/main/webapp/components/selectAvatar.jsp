<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 



<div class="avatar-options" id="avatar-options">
	<img src="images/boy.png" alt="Boy"
		onclick="selectAvatar('images/boy.png')"> <img
		src="images/girl.png" alt="Girl"
		onclick="selectAvatar('images/girl.png')"> <img
		src="images/men.png" alt="Man"
		onclick="selectAvatar('images/men.png')"> <img
		src="images/women.png" alt="Woman"
		onclick="selectAvatar('images/women.png')"> <img
		src="images/men2.png" alt="Men2"
		onclick="selectAvatar('images/men2.png')"> <img
		src="images/girl2.png" alt="Girl2"
		onclick="selectAvatar('images/girl2.png')"> <img
		src="images/blank_avatar.png" alt="blank"
		onclick="selectAvatar('images/blank_avatar.png')"> <img
		src="images/boy2.png" alt="Boy2"
		onclick="selectAvatar('images/boy2.png')"> <img
		src="images/girl3.png" alt="Girl3"
		onclick="selectAvatar('images/girl3.png')">

</div>


<script>
	document
			.querySelector('.avatar-picker')
			.addEventListener(
					'click',
					function() {
						const avatarOptions = document
								.getElementById('avatar-options');
						avatarOptions.style.display = avatarOptions.style.display === 'block' ? 'none'
								: 'block';
					});

	function selectAvatar(avatar) {
		document.getElementById('selected-avatar').src = avatar;
		document.getElementById('avatarSrc').value = avatar;
		document.getElementById('avatar-options').style.display = 'none';
	}
</script>