package org.Utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.apache.commons.fileupload.FileUploadException;
import org.exception.FileException;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.http.MediaType;

@Component
public class ImageUtil {

	private static final Logger logger = LoggerFactory.getLogger(ImageUtil.class);


	private static final String uploadPath = "/infoproject/boardImg";

	public List<String> fileUpload(List<MultipartFile> files) throws Exception {
		UUID uid = UUID.randomUUID();
		List<String> imgPath = new ArrayList<String>();

		for (MultipartFile file : files) {

			String originName = file.getOriginalFilename();
			// 저장될 이름 = 랜덤숫자 + "_" + 원래이름
			String savedName = uid.toString() + "_" + originName;

			// '년/월/일' 폴더 경로 생성.
			String folderName = calPath(uploadPath);

			String uploadFileName = null;

			// 확장자명
			String formatName = originName.substring(originName.lastIndexOf(".") + 1);


			try {

				// 확장자 확인.
				if (isMediaType(formatName)) {
					// 원본파일을 저장.
					file.transferTo(new File(uploadPath + folderName, savedName));
					imgPath.add(folderName + "/" + savedName);
				} else { // 확장자가 다를 때.
					throw new FileException("이미지가 아닙니다.");
				}
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
		}

		return imgPath;

	}

	// '년/월/일'계산.
	private String calPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();

		//os따라 구분자 구별.
		String datePath=  File.separator + cal.get(Calendar.YEAR);
		datePath += File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		datePath += File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		makeDir(uploadPath, datePath);

		logger.info(datePath);

		return datePath;

	}

	// 폴더 생성.
	private void makeDir(String uploadPath, String datePath) {
		if (new File(datePath).exists())
			return;

			File dirPath = new File(uploadPath + datePath);
			if (!dirPath.exists()) {
				dirPath.mkdirs();
			}
		
	}

	static Map<String, MediaType> map = new HashMap<String, MediaType>();

	static {
		map.put("PNG", MediaType.IMAGE_PNG);
		map.put("JPGE", MediaType.IMAGE_JPEG);
		map.put("GIF", MediaType.IMAGE_GIF);
	}

	
	//확장자명 체크
	private boolean isMediaType(String type) {

		type = type.toUpperCase();

		if (map.containsKey(type))
			return true;
		else
			return false;

	}

}
