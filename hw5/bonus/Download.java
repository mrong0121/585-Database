package downloadPic;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.io.FileNotFoundException;

public class Download {
	static int count = 297;
	public static void main(String[] args) throws Exception {
		try {
			String fromPath = "urls.txt";
			File file = new File(fromPath);
			FileInputStream inputStream = new FileInputStream(file);
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
			String str = null;
			while((str = bufferedReader.readLine()) != null)
			{
				System.out.println(str);
				download(str, count + ".jpg", "");
				count++;
			}
			//close
			inputStream.close();
			bufferedReader.close();
		}catch (FileNotFoundException e) {
      		e.printStackTrace();
		}
		
		
	}
//    public static void main(String[] args) throws Exception {  
//        // TODO Auto-generated method stub  
//    	
//         download("http://avatar.csdn.net/1/3/B/1_li1325169021.jpg", "1_li1325169021.jpg","d:\\image\\");  
//    }  
      
    public static void download(String urlString, String filename,String savePath) throws Exception {  
        // 构造URL  
        URL url = new URL(urlString);   
        // 打开连接  
        URLConnection con = url.openConnection();  
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setConnectTimeout(50000);
        conn.setReadTimeout(50000);
        
        conn.addRequestProperty("User-Agent","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36");

        conn.connect();
        //设置请求超时为5s  
        con.setConnectTimeout(5*1000);  
        // 输入流  
        InputStream is = conn.getInputStream();  
      
        // 1K的数据缓冲  
        byte[] bs = new byte[1024];  
        // 读取到的数据长度  
        int len;  
        // 输出的文件流  
       File sf=new File(savePath);  
       if(!sf.exists()){  
           sf.mkdirs();  
       }  
       OutputStream os = new FileOutputStream(sf.getPath()+""+filename);  
        // 开始读取  
        while ((len = is.read(bs)) != -1) {  
          os.write(bs, 0, len);  
        }  
        // 完毕，关闭所有链接  
        os.close();  
        is.close();  
    }   
  
} 


