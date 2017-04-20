package global.scit.bizcard.util;

import java.io.File;

import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

public class Tess4J {
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

	public String getTess4J(String path, String language) {
		File imageFile = new File(path);
		ITesseract instance = new Tesseract();
		instance.setDatapath("D:\\git\\BusinessCard\\BusinessCard\\tessdata");
		if (!language.isEmpty()) {
			instance.setLanguage(language);
		}

		try {
			return instance.doOCR(imageFile);
		} catch (TesseractException e) {
			e.printStackTrace();
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