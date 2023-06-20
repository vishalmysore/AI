package openai;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

public class BasicPrompt {

    public static void main(String[] args) {
        // Set your OpenAI API credentials
        String apiKey = args[0];
        String apiUrl = "https://api.openai.com/v1/engines/text-davinci-003/completions";

        // Set the prompt for weather forecast command
        String prompt = "What will be the weather forecast tomorrow in New York?";

        // Create the JSON request body
        String requestBody = "{\"prompt\":\"" + prompt + "\",\"max_tokens\":100}";

        // Create an HTTP client
        HttpClient httpClient = HttpClientBuilder.create().build();

        // Create an HTTP POST request with the API endpoint
        HttpPost httpPost = new HttpPost(apiUrl);

        // Set the request headers
        httpPost.setHeader("Content-Type", "application/json");
        httpPost.setHeader("Authorization", "Bearer " + apiKey);

        try {
            // Set the request body
            httpPost.setEntity(new StringEntity(requestBody));

            // Execute the request
            HttpResponse response = httpClient.execute(httpPost);

            // Get the response body
            HttpEntity entity = response.getEntity();
            String responseBody = EntityUtils.toString(entity);

            // Print the weather forecast
            System.out.println("Weather Forecast: " + responseBody);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}