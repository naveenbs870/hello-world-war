<html>
<head>
<title>Hello World!</title>
</head>
<body>
	<h1>Sucessfully installed Tomcat</h1>
	<h1>Sucessfully build & deployed in slave node</h1>
	<p>
		It is now
		<%= new java.util.Date() %></p>
	<p>
		You are coming from 
		<%= request.getRemoteAddr()  %></p>
</body>
