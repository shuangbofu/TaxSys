package cn.BlackHumour.TaxSys.core.formatter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.format.Formatter;

/**
 * 
 * 
 * 
 */
public class DateFormatter implements Formatter<Date> {
	
	private String datePattern;
	private SimpleDateFormat dateFormat;
	
	public DateFormatter(String datePattern) {
		System.out.println("========================================");
		this.datePattern = datePattern;
		dateFormat = new SimpleDateFormat(datePattern);
		dateFormat.setLenient(false);
	}

	@Override
	public String print(Date date, Locale locale) {
		// TODO Auto-generated method stub
		return dateFormat.format(date);
	}

	@Override
	public Date parse(String s, Locale locale) throws ParseException {
		// TODO Auto-generated method stub
		try {
			/*System.out.println("++++++++++++++++++++++++++++++++++");
			System.out.println("++++++++++++++++++++++++++++++++++");
			System.out.println("++++++++++++++++++++++++++++++++++");
			System.out.println("++++++++++++++++++++++++++++++++++");
			System.out.println("++++++++++++++++++++++++++++++++++");*/
			return dateFormat.parse(s);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new IllegalArgumentException(
					"invalid date format. Pleaseuse this pattern\""
						+datePattern +"\"");
		}
	}
	

}
