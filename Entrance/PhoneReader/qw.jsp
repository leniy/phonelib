<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="com.shadt.ebook.service.*"%>
<%@ page language="java" import="com.shadt.ebook.service.impl.*"%>
<%@ page language="java" import="com.shadt.ebook.model.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String ebookuuid = request.getParameter("ebookuuid");
	EbookService es = new EbookServiceImpl(); //书
	Ebook ebook = es.getEbook(ebookuuid);
%>
<!DOCTYPE html>
<html class="no-js">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><%=ebook.getTitle()%></title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/popup.css">
	<script src="js/libs/jquery.min.js"></script>
	<script src="js/libs/zip.min.js"></script>
	<script>
	"use strict";
	document.onreadystatechange = function () {
	if (document.readyState == "complete") {
		EPUBJS.filePath = "js/libs/";
		EPUBJS.cssPath = window.location.href.replace(window.location.hash, '').replace('qw.jsp?ebookuuid=<%=ebookuuid%>', '') + "css/";
		window.reader = ePubReader("../../<%=ebook.getUrl()%>");
	}
	};
	</script>
	<script src="js/libs/screenfull.min.js"></script>
	<script src="js/epub.min.js"></script>
	<script src="js/hooks.min.js"></script>
	<script src="js/reader.min.js"></script>
</head>
<body>
	<div id="sidebar"><div id="tocView" class="view"></div></div>
	<div id="main">
		<div id="titlebar">
			<div id="opener">
				<a id="slider" class="icon-menu"></a>
			</div>
			<div id="metainfo">
				<span id="book-title"></span>
				<span id="title-seperator">&nbsp;&nbsp;–&nbsp;&nbsp;</span>
				<span id="chapter-title"></span>
			</div>
		</div>

	<div id="divider"></div>
	<div id="prev" class="arrow">‹</div>
	<div id="viewer"></div>
	<div id="next" class="arrow">›</div>

	<div id="loader"><img src="img/loader.gif"></div>
  </div>
  <div class="overlay"></div>
</body>
</html>
