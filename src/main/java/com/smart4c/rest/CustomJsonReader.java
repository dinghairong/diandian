package com.smart4c.rest;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;

import javax.ws.rs.Consumes;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.ext.MessageBodyReader;
import javax.ws.rs.ext.Provider;

import org.apache.commons.io.IOUtils;

import com.google.gson.Gson;

@Provider
@Consumes(MediaType.APPLICATION_JSON)
public class CustomJsonReader<T> implements MessageBodyReader<T> {

	@Override
	public boolean isReadable(Class<?> type, Type genericType,
			Annotation[] annotations, MediaType mediaType) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public T readFrom(Class<T> type, Type genericType,
			Annotation[] annotations, MediaType mediaType,
			MultivaluedMap<String, String> httpHeaders, InputStream entityStream)
			throws IOException, WebApplicationException {
		// TODO Auto-generated method stub
		/*
		 * Copy the input stream to String. Do this however you like. Here I use
		 * Commons IOUtils.
		 */
		StringWriter writer = new StringWriter();
		IOUtils.copy(entityStream, writer, "UTF-8");
		String json = writer.toString();

		/*
		 * if the input stream is expected to be deserialized into a String,
		 * then just cast it
		 */
		if (String.class == genericType)
			return type.cast(json);

		/*
		 * Otherwise, deserialize the JSON into a POJO type. You can use
		 * whatever JSON library you want, here's a simply example using GSON.
		 */
		return new Gson().fromJson(json, genericType);
	}
}
