package global.scit.bizcard.util;

import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.awt.image.WritableRaster;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.io.FileUtils;

public class ImageService {

	/**
	 * 업로드 된 파일을 지정된 경로에 저장하고, 저장된 파일명을 리턴
	 * 
	 * @param mfile
	 *            업로드된 파일
	 * @param path
	 *            저장할 경로
	 * @return 저장된 파일명
	 */
	public static String saveImage(String imageBase64, String userID, String uploadPath) {
		// 저장 폴더가 없으면 생성
		File path = new File(uploadPath);
		if (!path.isDirectory()) {
			path.mkdirs();
		}

		// 저장할 파일명을 오늘 날짜의 년월일로 생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String savedFilename = sdf.format(new Date());

		// 저장할 전체 경로를 포함한 File 객체
		File serverFile = null;
		String ext = ".png";

		// 같은 이름의 파일이 있는 경우의 처리
		while (true) {
			serverFile = new File(uploadPath + "/" + userID + savedFilename + ext);
			// 같은 이름의 파일이 없으면 나감.
			if (!serverFile.isFile())
				break;
			// 같은 이름의 파일이 있으면 이름 뒤에 long 타입의 시간정보를 덧붙임.
			savedFilename = savedFilename + new Date().getTime();
		}

		// 이미지 저장
		try {
			byte[] decodeBytes = DatatypeConverter.parseBase64Binary(imageBase64.replace("data:image/png;base64,", ""));
			BufferedImage bfi = ImageIO.read(new ByteArrayInputStream(decodeBytes));
			ImageIO.write(bfi, "png", serverFile);
			bfi.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return userID + savedFilename + ext;
	}

	/**
	 * 
	 * @param uploadPath
	 * @param imagePath
	 * @return
	 */
	/*public static String loadImageByte(String uploadPath, String imagePath) {
		

		try {
			byte fileByte[] = FileUtils.readFileToByteArray(new File(uploadPath + "/" + imagePath));
			return String.valueOf(data);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}*/

	/**
	 * 서버에 저장된 파일의 전체 경로를 전달받아, 해당 파일을 삭제
	 * 
	 * @param fullpath
	 *            삭제할 파일의 경로
	 * @return 삭제 여부
	 */
	public static boolean deleteImage(String fullpath) {
		// 파일 삭제 여부를 리턴할 변수
		boolean result = false;

		// 전달된 전체 경로로 File객체 생성
		File delFile = new File(fullpath);

		// 해당 파일이 존재하면 삭제
		if (delFile.isFile()) {
			delFile.delete();
			result = true;
		}

		return result;
	}
}
