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

<link href="css/style.css">

<meta charset="ISO-8859-1">
<title>TODO - Add Notes</title>
</head>
<body
	style="background: url(https://cdn.pixabay.com/photo/2016/03/09/09/30/woman-1245817_1280.jpg);">




	<%@include file="navbar.jsp"%>




	<div class="container">
		<div class="row pt-5">

			<div class="col-xs-6 col-md-8">

				<div class="container text-center">
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


							<a href="editnote.jsp?noteId=<%=note.getNoteId()%>"
								class="btn btn-outline-success">Update Note</a> <a
								href="DeleteServlet?noteId=<%=note.getNoteId()%>"
								class="btn btn-outline-danger">Delete Note</a>



						</div>
					</div>

					<%
						}

					s.close();
					%>

				</div>


			</div>



			<div class="col-sm-6 col-md-4">

				<div class="container text-center">
					<h3>Add Notes here</h3>
				</div>

				<div class="container">

					<div class="card">

						<div class="card-body">

							<p class="card-text"><form method="POST" action="AddNoteServlet">
								<div class="form-group">
							<label for="exampleFormControlInput1">Note Title</label> <input
										type="text" class="form-control" id="exampleFormControlInput1"
										placeholder="" required name="noteTitle">
						</div>

						<div class="form-group">
							<label for="exampleFormControlTextarea1">Content</label>
							<textarea class="form-control" required
										id="exampleFormControlTextarea1" name="noteContent" rows="3"></textarea>
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Add</button>
						</div>
					</form>
			
				
				</p>
							

			</div>
		</div>
				
				
				


				</div>



			</div>







		</div>


	</div>









<%@include file="footer.jsp"%>
</body>
</html>