package com.notetaker.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Transaction;


import com.notetaker.entity.Notes;
import com.notetaker.helper.FactoryProvider;

/**
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());
			
			org.hibernate.Session s = FactoryProvider.getFactory().openSession();
			
			Transaction tx = s.beginTransaction();
			
			Notes note = (Notes)s.get(Notes.class, noteId);
			s.delete(note);
			
			tx.commit();

			s.close();
			
			
			response.sendRedirect("all_notes.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}



}
