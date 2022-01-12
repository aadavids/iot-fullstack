#include <curl/curl.h>
#include <unistd.h>

int main(void) {
    CURL *curl; 
    CURLcode res;

    struct curl_slist *headers = NULL;    

    curl = curl_easy_init();

    if(curl) {
        headers = curl_slist_append(headers, "Accept: application/json");
        headers = curl_slist_append(headers, "Content-Type: application/json");
        headers = curl_slist_append(headers, "charset: utf-8");

        curl_easy_setopt(curl, CURLOPT_URL, "http://localhost:4000/api/v1/heartbeats");
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);

        char post_fields[100] = {0};

        /*
        * Sends 10 heartbeats for each sensor, alternating each second.
        */
        for(int i = 0; i < 10; i++) {
            snprintf(post_fields, 100, "{\"heartbeat\":{\"sensor_value\":%d,\"sensor_serial\":\"ab:cd:ef:01:23:45\"}}", i);
            curl_easy_setopt(curl,  CURLOPT_POSTFIELDS, post_fields);
            res = curl_easy_perform(curl);
            sleep(1);
            snprintf(post_fields, 100, "{\"heartbeat\":{\"sensor_value\":%d,\"sensor_serial\":\"11:22:33:44:55:66\"}}", i * 2);
            curl_easy_setopt(curl,  CURLOPT_POSTFIELDS, post_fields);
            res = curl_easy_perform(curl);
            sleep(1);
        }
        
        if(res != CURLE_OK) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
        }

    curl_easy_cleanup(curl);
  }
  curl_global_cleanup();
  return 0;
}
