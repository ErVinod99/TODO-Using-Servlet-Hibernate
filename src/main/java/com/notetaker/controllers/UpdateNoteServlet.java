package com.notetaker.controllers;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.notetaker.entity.Notes;
import com.notetaker.helper.FactoryProvider;

public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateNoteServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int noteId = Integer.parseInt(request.getParameter("noteId").trim());
			String noteTitle = request.getParameter("noteTitle");
			String noteContent = request.getParameter("noteContent");

			Session s = FactoryProvider.getFactory().openSession();

			Transaction tx = s.beginTransaction();

			Notes note = s.get(Notes.class, noteId);

			note.setNoteTitle(noteTitle);
			note.setNoteContent(noteContent);
			note.setDateCreated(new Date());

			tx.commit();
			s.close();
			
			
			response.sendRedirect("all_notes.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
