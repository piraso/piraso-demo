package org.piraso.demo;

import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.http.converter.json.MappingJacksonHttpMessageConverter;

import java.io.IOException;

public class CustomMappingJacksonHttpMessageConverter extends MappingJacksonHttpMessageConverter {

    private boolean prettyPrint;

    @Override
    protected void writeInternal(Object object, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        JsonEncoding encoding = getJsonEncoding(outputMessage.getHeaders().getContentType());
        JsonGenerator jsonGenerator =
                getObjectMapper().getJsonFactory().createJsonGenerator(outputMessage.getBody(), encoding);
        try {
            if (isPrettyPrint()) {
                jsonGenerator.useDefaultPrettyPrinter();
            }

            getObjectMapper().writeValue(jsonGenerator, object);
        } catch (JsonProcessingException ex) {
            throw new HttpMessageNotWritableException("Could not write JSON: " + ex.getMessage(), ex);
        }
    }

    public void setPrettyPrint(boolean prettyPrint) {
        this.prettyPrint = prettyPrint;
    }

    public boolean isPrettyPrint() {
        return prettyPrint;
    }
}
