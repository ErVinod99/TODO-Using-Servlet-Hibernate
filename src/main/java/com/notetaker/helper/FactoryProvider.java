package com.notetaker.helper;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	private static SessionFactory factory;

	public static SessionFactory getFactory() {

		if (factory == null) {

			Configuration cfg = new Configuration();
			factory = cfg.configure("hibernate.config.xml").buildSessionFactory();

		}

		return factory;
	}

	public static void closeFactory() {
		if (factory.isOpen()) {
			factory.close();
		}

	}

}
