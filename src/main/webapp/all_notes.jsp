<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.notetaker.helper.FactoryProvider"%>
<%@ page import="javax.persistence.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.notetaker.entity.Notes"%>
<%@ page import="org.hibernate.query.Query"%>
<%@ page import="java.text.SimpleDateFormat"%>




<!DOCTYPE html>
<html>
<head>
<%@include file="all_css_js.jsp"%>

<meta charset="ISO-8859-1">
<title>TODO - All Notes</title>
</head>
<body style="background:url(https://cdn.pixabay.com/photo/2016/03/09/09/30/woman-1245817_1280.jpg);">



		<%@include file="navbar.jsp"%>
		


	<div class="container pt-3 text-center">
		<h3>All Notes</h3>
	</div>

	<div class="container">

		<%
			Session s = FactoryProvider.getFactory().openSession();
		Query q = s.createQuery("From Notes");
		List<Notes> l = q.list();

		for (Notes note : l) {
		%>

		<div class="card mt-3">


			<div class="card-header">
				Created date
				<%=note.getDateCreated()%></div>
			<div class="card-body">
				<h5 class="card-title"><%=note.getNoteTitle()%></h5>
				<p class="card-text"><%=note.getNoteContent()%></p>


				<a href="editnote.jsp?noteId=<%=note.getNoteId() %>" class="btn btn-outline-success">Update Note</a>


				<a href="DeleteServlet?noteId=<%=note.getNoteId() %>" class="btn btn-outline-danger">Delete Note</a>



			</div>
		</div>

		<%
			}

		s.close();
		%>






<!-- 

		Edit Modal
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
					
					
					<div class="container text-center">
						<h5 class="modal-title" id="exampleModalLongTitle">Edit Note</h5>
					</div>
		
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<form method="POST" action="UpdateNoteServlet">
							<div class="form-group">
								<label for="exampleFormControlInput1">Note Title</label> <input
									type="text" class="form-control" id="exampleFormControlInput1"
									placeholder=""  name="noteTitle">
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1">Content</label>
								<textarea class="form-control" 
									id="exampleFormControlTextarea1" name="noteContent" rows="3"></textarea>
							</div>


							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
									
								<button type="submit" class="btn btn-primary text-center">Update</button>
							</div>


						</form>



					</div>

				</div>
			</div>
		</div>


		Edit Modal End


 -->


	</div>
	
	
	
	
	
	<%@include file="footer.jsp"%>

</body>
</html>