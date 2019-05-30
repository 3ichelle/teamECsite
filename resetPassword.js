/*
 * パスワード再設定　確認画面の｢戻るボタン｣｢再設定ボタン｣用
 */

/*
 * ｢戻るボタン｣
 * 関数名goResetPasswordAction()が呼ばれると、
 * id="backFlag"のvalueを1にする
 * id="resetPasswordForm"のactionを"ResetPasswordAction"にする
 */
function goResetPasswordAction(){

	document.getElementById("backFlag").value="1";
	document.getElementById("resetPasswordForm").action="ResetPasswordAction";
}

/*
 * ｢再設定ボタン｣
 * 関数名goResetPasswordCompleteAction()が呼ばれると、
 * id="resetPasswordForm"のactionを"ResetPasswordCompleteAction"にする
 */
function goResetPasswordCompleteAction(){

	document.getElementById("resetPasswordForm").action="ResetPasswordCompleteAction";
}