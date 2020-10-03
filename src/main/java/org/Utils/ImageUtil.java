package org.Utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class ImageUtil {

	private static final Logger logger = LoggerFactory.getLogger(ImageUtil.class);
	
	public static String fileUpload(String uploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		//저장될 이름 = 랜덤숫자 + "_" + 원래이름
		String savedName = uid.toString() + "_" + originalName;
		
		
		//'년/월/일' 폴더 경로 생성.
		String savedPath = calPath(uploadPath);
		
		File target = new File(uploadPath + savedPath, savedName);
		
		//원본파일을 저장.
		
		////file.transferTo(new File());도 가능.
		FileCopyUtils.copy(fileData, target);
		
		String uploadFileName = null;
		//확장자명
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		//이미지일때 
		if(MediaUtils.getMediaType(formatName)!= null) {
			uploadFileName = makeThumbnail(uploadPath, savedPath, savedName);
		}else { //이미지가 아닐 때
			uploadFileName = makeNoImage(uploadPath, savedPath, savedName);
		}		
		
		return uploadFileName;
	}
	
	
	private static String makeNoImage(String uploadPath, String savedPath, String savedName) {
		String noImageName = uploadPath + savedPath + File.separator + savedName;
		
		return noImageName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}


	//'년/월/일'계산.
	private static String calPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
		
	}
	
	//폴더 생성.
	private static void makeDir(String uploadPath, String...paths) {
		if(new File(paths[paths.length-1]).exists()) return;
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}
	
	//썸네일 생성
	//uploadPath : 기본경로, path : /년/월/일 폴더 경로, fileName : 업로드된 파일이름.
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception{
		
		//BufferedImage : 실제 이미지가 아닌 메모리상의 이미지를 의미하는 객체.
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
				
		//썸네일 이미지 파일의 높이를 100px로 고정
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		
		//썸네일 파일에는 파일이름앞에 's_'을 붙여서 구분
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		
		//썸네일 파일 생성
		File newThumbnailFile = new File(thumbnailName);
		
		//확장자명
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		//destImg를 newThumbnailFile에 씀.
		ImageIO.write(destImg, formatName.toUpperCase(), newThumbnailFile);
		
		//브라우저에서 윈도우의경로로 사용하는 '\' 문자가 정상적인 경로로인식되지 않기 떄문에 '/'로 치환.
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	
}
