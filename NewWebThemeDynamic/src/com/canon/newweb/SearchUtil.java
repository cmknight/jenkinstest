package com.canon.newweb;

import java.io.IOException;
import java.io.StringWriter;
import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

public class SearchUtil {
	
	private static final Logger LOGGER = LogManager.getLogger(SearchUtil.class);
	
	public static String getXMLString(String theURL)  {
		
		try {			
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(new URL(theURL).openStream());
			
			DOMSource domSource = new DOMSource(doc);
			StringWriter writer = new StringWriter();
			StreamResult result = new StreamResult(writer);
			TransformerFactory tf = TransformerFactory.newInstance();
			Transformer transformer = tf.newTransformer();
			transformer.transform(domSource, result);
			
			return writer.toString();
			
		} catch (MalformedURLException e) {
			LOGGER.error(e);
			// intentionally ignored. if problem with parsing typeahead xml, just don't show suggestions
		} catch (TransformerConfigurationException e) {
			LOGGER.error(e);
			// intentionally ignored. if problem with parsing typeahead xml, just don't show suggestions
		} catch (ParserConfigurationException e) {
			LOGGER.error(e);
			// intentionally ignored. if problem with parsing typeahead xml, just don't show suggestions
		} catch (SAXException e) {
			LOGGER.error(e);
			// intentionally ignored. if problem with parsing typeahead xml, just don't show suggestions
		} catch (IOException e) {
			LOGGER.error(e);
			// intentionally ignored. if problem with parsing typeahead xml, just don't show suggestions
		} catch (TransformerFactoryConfigurationError e) {
			LOGGER.error(e);
			// intentionally ignored. if problem with parsing typeahead xml, just don't show suggestions
		} catch (TransformerException e) {
			LOGGER.error(e);
			// intentionally ignored. if problem with parsing typeahead xml, just don't show suggestions
		}
		
		return "";
	}
}
