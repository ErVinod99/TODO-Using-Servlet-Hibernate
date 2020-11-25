package com.notetaker.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Notes {

	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	private int noteId;

	@Column(length = 500)
	private String noteTitle;

	@Column(length = 1500)
	private String noteContent;

	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;

	public int getNoteId() {
		return noteId;
	}

	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}

	public String getNoteTitle() {
		return noteTitle;
	}

	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}

	public String getNoteContent() {
		return noteContent;
	}

	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Notes() {
		super();
	}
	
	

	public Notes(String noteTitle, String noteContent) {
		super();
		this.noteTitle = noteTitle;
		this.noteContent = noteContent;

	}

	public Notes(int noteId, String noteTitle, String noteContent, Date dateCreated) {
		super();
		this.noteId = noteId;
		this.noteTitle = noteTitle;
		this.noteContent = noteContent;
		this.dateCreated = dateCreated;
	}

	@Override
	public String toString() {
		return "Notes [noteId=" + noteId + ", noteTitle=" + noteTitle + ", noteContent=" + noteContent
				+ ", dateCreated=" + dateCreated + "]";
	}

}
