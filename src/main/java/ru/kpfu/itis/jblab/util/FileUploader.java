package ru.kpfu.itis.jblab.util;

import com.cloudinary.Cloudinary;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Created by Марат on 05.04.2017.
 */
public class FileUploader {
    public static String uploadFile(MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                FileInputStream fis;
                Properties property = new Properties();
                fis = new FileInputStream("\\MyMoneyManager\\src\\main\\resources\\cloudinary.properties");
                property.load(fis);
                String cloudName = property.getProperty("cloud_name");
                String apiKey = property.getProperty("api_key");
                String apiSecret = property.getProperty("api_secret");
                Map<String, String> config = new HashMap<String, String>();
                config.put("cloud_name", cloudName);
                config.put("api_key", apiKey);
                config.put("api_secret", apiSecret);
                Cloudinary cloudinary = new Cloudinary(config);
                Map result = cloudinary.uploader().upload(file.getBytes(), new HashMap());
                return (String) result.get("url");
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            }
        }
        return "";
    }
}

