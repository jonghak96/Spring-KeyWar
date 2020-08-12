package com.spring.keywar.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;

import javax.imageio.ImageIO;

import org.jcodec.api.FrameGrab;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.model.Picture;
import org.jcodec.scale.AWTUtil;

public class VideoThread extends Thread{

	private int threadNo;
	private int threadSize;
	private double plusSize;
	private File source;
	private String uploaPath;
	private ArrayList<String> writePath;
	
	public VideoThread(File source, int threadSize, int threadNo, double plusSize, String uploadPath) {
		this.source = source;
		this.threadSize = threadSize;
		this.threadNo = threadNo;
		this.plusSize = plusSize;
		this.uploaPath = uploadPath;
		writePath = new ArrayList<String>();
	}
		
	public void run() {
		
		FrameGrab grab;
		
		try {
			
			grab = FrameGrab.createFrameGrab(NIOUtils.readableChannel(source));
			
			for (int m = 0 ; m < 5 ; m++) {
				if (m % threadSize == threadNo) {
					double startSec = m * plusSize;
					System.out.println(threadNo + " " + startSec);
					
					int frameCount = 1;
					
					grab.seekToSecondPrecise(startSec);
					
					for (int i = 0 ; i < frameCount ; i++) {
						Picture picture = grab.getNativeFrame();
						
						BufferedImage bufferedImage = AWTUtil.toBufferedImage(picture);
						ImageIO.write(bufferedImage, "png", new File(uploaPath + "/" + m + ".png"));
					}										
				}
			}			
		} catch (Exception e) {
			System.out.println(e);
		}		
	}	
}
