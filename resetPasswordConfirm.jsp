<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
	<head>

	<meta charset="UTF-8">
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/form.css">
	<title>パスワード再設定確認</title>

	</head>

	<body>
<!-- ヘッダー:「header.jsp」をincludeする（includeアクション：指定したページを実際に実行した結果を取り込む） -->
		<jsp:include page="header.jsp" />

<!-- メイン -->
		<div id="contents">
			<h1>パスワード再設定確認画面</h1>

		<!-- 再設定　確認用フォーム作成 -->
			<s:form id="resetPasswordForm">
				<table class="T_box">
					<tr>
						<th scope="row"><s:label value="ユーザーID"/></th>
						<td><s:property value="userId"/></td>
					</tr>
					<tr>
						<th scope="row"><s:label value="新しいパスワード"/></th>
						<td><s:property value="concealPassword"/></td>
					</tr>
				</table>
				<div class="submit_btn_box">
					<s:submit value="パスワード再設定" onclick="goResetPasswordCompleteAction()" class="btn"/>
				</div>
				<div class="submit_btn_box">
					<s:submit value="戻る" onclick="goResetPasswordAction()" class="btn"/>
				</div>

		<!-- 戻るボタン押下時、.jsによってbackFlagに値が入る -->
				<s:hidden id="backFlag" name="backFlag" value=""/>
			</s:form>
		</div>

<!-- javascript -->
		<script type="text/javascript" src="./js/resetPassword.js"></script>

	</body>
</html>