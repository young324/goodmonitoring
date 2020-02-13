package com.goodmonitoring.util;


import java.io.InputStream;

import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class AWSService {
	private static final String BUCKET_NAME = "bucketgoodmonitoring";
	private static final String ACCESS_KEY = "AKIAUSPNYPFR2CMSL7YG";
	private static final String SECRET_KEY = "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";
	private AmazonS3 amazonS3;
	
	@SuppressWarnings("deprecation")
	public AWSService() {
		AWSCredentials awsCredentials = new BasicAWSCredentials(ACCESS_KEY,SECRET_KEY);
		amazonS3 = new AmazonS3Client(awsCredentials);
	}
	
	 public void upload(String keyName, InputStream inputStream,ObjectMetadata metadata){
	        if(amazonS3!=null)
	        try{
	            amazonS3.putObject(new PutObjectRequest(BUCKET_NAME,keyName,inputStream,metadata));
	        }catch(AmazonClientException ace){
	            ace.printStackTrace();
	        } finally {
	            amazonS3 = null;
	        }
	    }

	
}
