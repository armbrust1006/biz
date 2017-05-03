package global.scit.bizcard.util;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import global.scit.bizcard.vo.OCRData;
import global.scit.bizcard.vo.OCRResultData;
import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

public class Tess4J {
	private int imgWidth;
	private int imgHeight;
	private BufferedImage img;
	private BufferedImage splitImages[];
	private ArrayList<Integer> index = new ArrayList<>();

	private String originalImagePath = "C:\\CardImageFile\\OCR\\";

	/*
	 * public Tess4J() { File imageFile = new
	 * File("C:\\CardImageFile\\OCR\\20170416.jpg");
	 * 
	 * ITesseract instance = new Tesseract();
	 * instance.setDatapath("D:\\git\\BusinessCard\\BusinessCard\\tessdata");
	 * instance.setLanguage("eng");
	 * 
	 * try { String result = instance.doOCR(imageFile);
	 * System.out.println(result); } catch (TesseractException e) {
	 * e.printStackTrace(); } }
	 */

	public OCRResultData getTess4J(OCRData ocrData, HttpServletRequest request) {
		String id = ocrData.getM_id();
		// 선택 영역 값 가져오기
		int[][] grid = new int[9][4];

		/*
		 * int setTotal = 0; for (int i = 0, length = grid.length; i < length;
		 * i++) { if (grid[i][0] == 0 && grid[i][1] == 0 && grid[i][2] == 0 &&
		 * grid[i][3] == 0) continue; setTotal++; }
		 */

		for (int i = 0, lengthI = ocrData.getGetterValue().length; i < lengthI; i++) {
			// System.out.println(i / 4);
			// System.out.println(i % 4);
			if (ocrData.getGetterValue()[i].length == 0) {
				grid[i / 4][i % 4] = 0;
			} else {
				grid[i / 4][i % 4] = ocrData.getGetterValue()[i][0];
				if (i % 4 == 0) {
					index.add(i / 4);
				}
			}
			/*
			 * for (int j = 0, lengthJ = ocrdata.getGetterValue()[i].length; j <
			 * lengthJ; j++) { System.out.println("[i][j] : [" + i + "][" + j +
			 * "]" + ocrdata.getGetterValue()[i][j]); }
			 */
		}

		/*
		 * for (int i = 0, lengthI = grid.length; i < lengthI; i++) { for (int j
		 * = 0, lengthJ = grid[i].length; j < lengthJ; j++) {
		 * System.out.println(grid[i][j]); } }
		 */

		/*
		 * for (int i = 0, length = ocrdata.getGetterValue().size(); i < length;
		 * i++) { Integer[] arr = ocrdata.getGetterValue().get(i); if
		 * (arr.length == 0) continue; int tmp = arr[0]; grid[i/4][i%4] = tmp;
		 * switch (i/4) { case 0: System.out.println("첫번째 명함"); break; case 1:
		 * System.out.println("두번째 명함"); break; case 2:
		 * System.out.println("세번째 명함"); break; case 3:
		 * System.out.println("네번째 명함"); break; case 4:
		 * System.out.println("다번째 명함"); break; case 5:
		 * System.out.println("여번째 명함"); break; case 6:
		 * System.out.println("일번째 명함"); break; case 7:
		 * System.out.println("팔번째 명함"); break; case 8:
		 * System.out.println("구번째 명함"); break; default: break; } }
		 */

		try {
			imgWidth = ocrData.getImgSize()[0];
			imgHeight = ocrData.getImgSize()[1];
			BufferedImage imgSrc = ImageIO.read(new File(originalImagePath + ocrData.getImagePath()));
			BufferedImage newImg = new BufferedImage(imgWidth, imgHeight, BufferedImage.TYPE_INT_RGB);
			Graphics g = newImg.getGraphics();
			g.drawImage(imgSrc, 0, 0, imgWidth, imgHeight, null);
			ImageIO.write(newImg, "png", new File(originalImagePath + id + ".png"));
			g.dispose();

			img = ImageIO.read(new File(originalImagePath + id + ".png"));
			splitImages = new BufferedImage[index.size()];
			for (int i = 0, length = index.size(); i < length; i++) {
				splitImages[i] = img.getSubimage(grid[index.get(i)][0], grid[index.get(i)][1], grid[index.get(i)][2],
						grid[index.get(i)][3]);
			}

			for (int i = 0, length = index.size(); i < length; i++) {
				ImageIO.write(splitImages[i], "png", new File(originalImagePath + id + i + ".png"));
			}
		} catch (Exception e) {
			System.out.println("이미지 파일이 아닙니다.");
		}

		ITesseract instance = new Tesseract();
		instance.setDatapath(request.getServletContext().getRealPath("resources/tessdata"));
		instance.setLanguage(ocrData.getLanguage());

		OCRResultData data = new OCRResultData();
		try {
			for (int i = 0, length = index.size(); i < length; i++) {
				File imageFile = new File(originalImagePath + id + i + ".png");
				String result = instance.doOCR(imageFile);
				switch (index.get(i)) {
				case 0:
					data.setName(result);
					break;
				case 1:
					data.setCompany(result);
					break;
				case 2:
					data.setDepart(result);
					break;
				case 3:
					data.setPosition(result);
					break;
				case 4:
					data.setAddress(result);
					break;
				case 5:
					data.setEmail(result);
					break;
				case 6:
					data.setTelephone(result);
					break;
				case 7:
					data.setFax(result);
					break;
				case 8:
					data.setMobile(result);
					break;
				default:
					break;
				}
				imageFile.delete();
			}
			return data;
		} catch (TesseractException e) {
			e.printStackTrace();
		} finally {
			new File(originalImagePath + id + ".png").delete();
		}
		return null;
	}

}
/*
 * String datapath = "D:\\git\\BusinessCard\\BusinessCard\\tessdata"; String
 * testResourcesDataPath =
 * "D:\\git\\BusinessCard\\BusinessCard\\src\\main\\webapp\\resources"; File
 * imageFile; ITesseract instance;
 * 
 * instance = new Tesseract(); instance.setDatapath(new
 * File(datapath).getPath()); instance.setLanguage("eng");
 * 
 * try { ImageIO.scanForPlugins(); imageFile = new File(testResourcesDataPath,
 * "sss.png"); String result = instance.doOCR(imageFile);
 * System.out.println(result); } catch (TesseractException e) {
 * System.out.println(e.getMessage()); }
 */