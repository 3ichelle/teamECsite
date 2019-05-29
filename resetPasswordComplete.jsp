<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
	<head>

	<meta charset="UTF-8">

	<!-- 3秒後にHomeActionへリダイレクトさせる（content="秒数:URL='URL') -->
	<meta http-equiv="refresh" content="3;URL='HomeAction'"/>

	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="./css/form.css">

	<title>パスワード再設定完了</title>

	</head>

	<body>
<!-- ヘッダー:「header.jsp」をincludeする（includeアクション：指定したページを実際に実行した結果を取り込む） -->
		<jsp:include page="header.jsp" />

<!-- メイン -->
		<div id="contents">
			<h1>パスワード再設定　完了画面</h1>

			<div class="complete_box">パスワード再設定が完了しました。</div>
		</div>

	</body>
</html>