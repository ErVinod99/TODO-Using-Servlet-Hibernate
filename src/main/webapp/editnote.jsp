<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.notetaker.helper.FactoryProvider"%>
<%@ page import="javax.persistence.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.notetaker.entity.Notes"%>
<%@ page import="org.hibernate.query.Query"%>

<%@ page import="org.hibernate.Transaction"%>


<!DOCTYPE html>
<html>
<head>
<%@include file="all_css_js.jsp"%>

<meta charset="ISO-8859-1">
<title>TODO - Edit Notes</title>
</head>
<body
	style="background: url(https://cdn.pixabay.com/photo/2016/03/09/09/30/woman-1245817_1280.jpg);">


	<%@include file="navbar.jsp"%>



	<div class="container pt-3 text-center">
		<h3>Edit Notes here</h3>
	</div>

	<%
		int noteId = Integer.parseInt(request.getParameter("noteId"));
	Session s = FactoryProvider.getFactory().openSession();
	Transaction tx = s.beginTransaction();

	Notes note = (Notes) s.get(Notes.class, noteId);
	%>


	<div class="container">

		<div class="card">

			<div class="card-body">

				<p class="card-text"><form method="POST" action="UpdateNoteServlet">


					<input value="<%=note.getNoteId()%>" name="noteId" type="hidden">

			<div class="form-group">
				<label for="exampleFormControlInput1">Note Title</label> <input
							type="text" class="form-control" id="exampleFormControlInput1"
							placeholder="" value="<%=note.getNoteTitle()%>" name="noteTitle">
			</div>

			<div class="form-group">
				<label for="exampleFormControlTextarea1">Content</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
							name="noteContent" rows="5"><%=note.getNoteContent()%></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-outline-primary">Update
					Note</button>

			</div>
		</form>
				
				</p>
				

			</div>
		</div>



<!-- 		<div class="card">

			<div class="card-body">

				<p class="card-text">
				
				
			
				
				</p>

			</div>
		</div> -->








	</div>










<%@include file="footer.jsp"%>
</body>
</html>