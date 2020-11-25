package com.notetaker.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.notetaker.entity.Notes;
import com.notetaker.helper.FactoryProvider;

public class AddNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddNoteServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String noteTitle = request.getParameter("noteTitle");
			String noteContent = request.getParameter("noteContent");

			Notes notes = new Notes(noteTitle, noteContent);

			
			
			
			
			
			
			/*
			 * System.out.println(notes.getNoteId());
			 * System.out.println(notes.getNoteTitle());
			 * System.out.println(notes.getNoteContent());
			 * System.out.println(notes.getDateCreated());
			 * 
			 * 
			 * PrintWriter out = response.getWriter(); out.print("HIIIIIII");
			 */

			Session session = FactoryProvider.getFactory().openSession();
			
			

			
			
			
			

			Transaction tx = session.beginTransaction();
			session.save(notes);
			tx.commit();
			session.close();

			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print("<h1 style='text-align:center'>Note Added Successfully...</h1>");

			out.println("<br>");

			out.println("<h3 style='text-align:center'><a href='all_notes.jsp'>Show All Notes</a></h3>");

			out.println("<br>");

			out.println("<h3 style='text-align:center'><a href='add_note.jsp'>Add Notes</a></h3>");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
