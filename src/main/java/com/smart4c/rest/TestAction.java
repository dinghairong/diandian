package com.smart4c.rest;

import java.io.InputStream;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.FormDataParam;

@Path("/book2")
public class TestAction {
	
	@POST
	@Path("test")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	public String test(@FormDataParam("file") InputStream file,
			@FormDataParam("file") FormDataContentDisposition dispostion,
			@FormDataParam("fileName") String fileName) {
		return "";
	}
	
}
