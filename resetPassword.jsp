<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
	<head>

	<meta charset="UTF-8">
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/form.css">
	<title>パスワード再設定</title>

	</head>

	<body>
<!-- ヘッダー:「header.jsp」をincludeする（指定したページを実際に実行した結果を取り込む） -->
		<jsp:include page="header.jsp" />

<!-- メイン -->
		<div id="contents">
			<h1>パスワード再設定画面</h1>

	<!-- 入力チェックの結果、エラーメッセージ表示させるかどうか -->
			<!-- ユーザーID用エラーメッセージ -->
			<s:if test="userIdErrorMessageList != null && userIdErrorMessageList.size()>0">
				<div class="error_box">
					<s:iterator value="userIdErrorMessageList">
						<s:property /><br>
					</s:iterator>
				</div>
			</s:if>

			<!-- パスワード用エラーメッセージ -->
			<s:if test="passwordErrorMessageList != null && passwordErrorMessageList.size()>0">
				<div class="error_box">
					<s:iterator value="passwordErrorMessageList">
						<s:property /><br>
					</s:iterator>
				</div>
			</s:if>

			<!-- 新しいパスワード用エラーメッセージ -->
			<s:if test="NewPasswordErrorMessageList != null && NewPasswordErrorMessageList.size()>0">
				<div class="error_box">
					<s:iterator value="NewPasswordErrorMessageList">
						<s:property /><br>
					</s:iterator>
				</div>
			</s:if>

			<!-- 新しいパスワード(再確認)用エラーメッセージ -->
			<s:if test="reConfirmationNewPasswordErrorMessageList != null && reConfirmationNewPasswordErrorMessageList.size()>0">
				<div class="error_box">
					<s:iterator value="reConfirmationNewPasswordErrorMessageList">
						<s:property /><br>
					</s:iterator>
				</div>
			</s:if>

			<!-- ユーザーが存在しない場合エラーメッセージ -->
			<!-- Listではないので、要素数の確認ではなく、値が入っているかの確認(=isEmpty()) -->
			<s:if test="noExistsUserErrorMessage != null && ! noExistsUserErrorMessage.isEmpty()">
				<div class="error_box">
					<s:property value="noExistsUserErrorMessage"/><br>
				</div>
			</s:if>

			<!-- 新しいパスワードと新しいパスワード(再確認)が一致しない場合エラーメッセージ -->
			<s:if test="checkDoPassword != null && ! checkDoPassword.isEmpty()">
				<div class="error_box">
					<s:property value="checkDoPassword"/><br>
				</div>
			</s:if>

	<!-- 再設定用フォーム -->
			<s:form action="ResetPasswordConfirmAction">
				<table class="T_box">
					<tr>
						<!-- scope="row"は「同じ行の見出し」を意味する -->
						<!-- value="%{#session.resetPasswordUserId}"は｢%{ }｣の中身を文字列として表示するのではなく、セッション内の値を表示させるために必要 -->
						<th scope="row"><s:label value="ユーザーID"/></th>
						<td><s:textfield name="userId" value="%{#session.userIdForResetPassword}" placeholder="ユーザーID" class="txt"></s:textfield></td>
					</tr>
					<tr>
						<th scope="row"><s:label value="現在のパスワード"/></th>
						<td><s:password name="password" value="" placeholder="現在のパスワード" class="txt"></s:password></td>
					</tr>
					<tr>
						<th scope="row"><s:label value="新しいパスワード"/></th>
						<td><s:password name="newPassword" value="" placeholder="新しいパスワード" class="txt"></s:password></td>
					</tr>
					<tr>
						<th scope="row"><s:label value="新しいパスワード（再確認）"/></th>
						<td><s:password name="reConfirmationNewPassword" value="" placeholder="新しいパスワード（再確認）" class="txt"></s:password></td>
					</tr>
				</table>
				<div class="submit_btn_box">
					<s:submit value="確認" class="btn"/>
				</div>
			</s:form>
		</div>
	</body>
</html>