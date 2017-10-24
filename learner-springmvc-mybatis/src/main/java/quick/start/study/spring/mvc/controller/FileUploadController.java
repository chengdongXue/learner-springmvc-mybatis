package quick.start.study.spring.mvc.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import quick.start.study.spring.mvc.entity.Message;
import quick.start.study.spring.mvc.entity.Status;

@Controller
public class FileUploadController {

    /**
     * Upload single file using Spring Controller
     */
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST, produces = "application/json;charset=utf8")
    @ResponseBody
    public Message uploadFileHandler(@RequestParam("file") MultipartFile file) throws IOException {

        if (!file.isEmpty()) {
            InputStream in = null;
            OutputStream out = null;

            try {
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "tmpFiles");
                if (!dir.exists())
                    dir.mkdirs();
                File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
                in = file.getInputStream();
                out = new FileOutputStream(serverFile);
                byte[] b = new byte[1024];
                int len = 0;
                while ((len = in.read(b)) > 0) {
                    out.write(b, 0, len);
                }
                out.close();
                in.close();
                System.out.print("Server File Location=" + serverFile.getAbsolutePath());
                Message msg = new Message();
                msg.setStatus(Status.SUCCESS);
                msg.setStatusMsg("File upload success");
                return msg;
            } catch (Exception e) {
                Message msg = new Message();
                msg.setStatus(Status.ERROR);
                msg.setError("File upload file");
                return msg;
            } finally {
                if (out != null) {
                    out.close();
                    out = null;
                }
                if (in != null) {
                    in.close();
                    in = null;
                }
            }
        } else {
            Message msg = new Message();
            msg.setStatus(Status.ERROR);
            msg.setError("File is empty");
            return msg;
        }
    }
    
    /**
     * Upload multiple file using Spring Controller
     */
    @RequestMapping(value = "/uploadMultipleFile", method = RequestMethod.POST, produces = "application/json;charset=utf8")
    @ResponseBody
    public Message uploadMultipleFileHandler(@RequestParam("file") MultipartFile[] files) throws IOException {
        Message msg = new Message();
        List<Integer> arr = new ArrayList();
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            if (!file.isEmpty()) {
                InputStream in = null;
                OutputStream out = null;
                try {
                    String rootPath = System.getProperty("catalina.home");
                    File dir = new File(rootPath + File.separator + "tmpFiles");
                    if (!dir.exists())
                        dir.mkdirs();
                    File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
                    in = file.getInputStream();
                    out = new FileOutputStream(serverFile);
                    byte[] b = new byte[1024];
                    int len = 0;
                    while ((len = in.read(b)) > 0) {
                        out.write(b, 0, len);
                    }
                    out.close();
                    in.close();
                    System.out.print("Server File Location=" + serverFile.getAbsolutePath());
                } catch (Exception e) {
                    arr.add(i);
                } finally {
                    if (out != null) {
                        out.close();
                        out = null;
                    }
                    if (in != null) {
                        in.close();
                        in = null;
                    }
                }
            } else {
                arr.add(i);
            }
        }
        if(arr.size() > 0) {
            msg.setStatus(Status.ERROR);
            msg.setError("Files upload fail");
            msg.setErrorKys(arr);
        } else {
            msg.setStatus(Status.SUCCESS);
            msg.setStatusMsg("Files upload success");
        }
        return msg;
    }
}
