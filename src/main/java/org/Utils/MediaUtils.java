package org.Utils;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

//확장자를 가지고 이미지 타입인지 판단하는 클래스
//브라우저에서 파일을 다운로드 할 것인지, 보여줄것인지를 결정하기 위해 클래스로 관리.
public class MediaUtils {
	private static Map<String, MediaType> mediaMap;
	
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
	
}
