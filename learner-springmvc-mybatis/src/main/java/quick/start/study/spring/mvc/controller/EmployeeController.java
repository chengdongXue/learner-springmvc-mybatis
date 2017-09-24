package quick.start.study.spring.mvc.controller;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import quick.start.study.spring.business.dao.EmployeeDao;
import quick.start.study.spring.business.entity.Employee;

@Controller
public class EmployeeController {
    // create upload files directory images
    private static final String UPLOAD_DIRECTORY = "/images";
    @Autowired
    EmployeeDao dao;

    /*
     * It displays a form to input data, here "command" is a reserved request
     * attributewhich is used to display object data into form
     */
    @RequestMapping("/employeeform")
    public ModelAndView showform() {
        return new ModelAndView("empform", "command", new Employee());
    }

    /*
     * It saves object into database. The @ModelAttribute puts request data into
     * model object. You need to mention RequestMethod.POST method because
     * default request is GET
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute("employee") Employee emp) {
        dao.save(emp);
        return new ModelAndView("redirect:/viewemp");
    }

    @RequestMapping("/viewemp")
    public ModelAndView viewemp() {
        List<Employee> list = dao.getEmployees();
        return new ModelAndView("viewemp", "list", list);
    }

    @RequestMapping(value = "/editemp/{id}")
    public ModelAndView edit(@PathVariable int id) {
        Employee emp = dao.getEmpById(id);
        return new ModelAndView("empeditform", "command", emp);
    }

    @RequestMapping(value = "/editsave", method = RequestMethod.POST)
    public ModelAndView editsave(@ModelAttribute("emp") Employee emp) {
        dao.update(emp);
        return new ModelAndView("redirect:/viewemp");
    }

    @RequestMapping(value = "/deleteemp/{id}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable int id) {
        dao.delete(id);
        return new ModelAndView("redirect:/viewemp");
    }

    @RequestMapping(value = "/viewemp/{pageid}")
    public ModelAndView viewemp(@PathVariable int pageid) {
        int total = 5;
        if (pageid == 1) {
        } else {
            pageid = (pageid - 1) * total + 1;
        }
        List<Employee> list = dao.getEmployeesBypage(pageid, total);
        return new ModelAndView("viewemp", "list", list);
    }

    @RequestMapping("uploadform")
    public ModelAndView uploadForm() {
        return new ModelAndView("uploadform");
    }

    /**
     * upload files.. support more
     * 
     * @param file
     * @param session
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/savefile", method = RequestMethod.POST)
    public ModelAndView upload(@RequestParam CommonsMultipartFile file,
            HttpSession session) throws IOException {
        /*
         * ServletContext context = session.getServletContext(); String path =
         * context.getRealPath(UPLOAD_DIRECTORY); String filename =
         * file.getOriginalFilename(); System.out.println(path + " " +
         * filename); byte[] bytes = file.getBytes(); try { BufferedOutputStream
         * stream = new BufferedOutputStream( new FileOutputStream(new File(path
         * + File.separator + filename))); stream.write(bytes); stream.flush();
         * stream.close(); } catch (FileNotFoundException e) {
         * e.printStackTrace(); } return new ModelAndView("uploadform",
         * "filesuccess", "File successfully saved!");
         */
        String path = session.getServletContext().getRealPath("/");
        String filename = file.getOriginalFilename();
        System.out.println(path + " " + filename);
        try {
            byte barr[] = file.getBytes();
            BufferedOutputStream bout = new BufferedOutputStream(
                    new FileOutputStream(path + "/" + filename));
            bout.write(barr);
            bout.flush();
            bout.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return new ModelAndView("uploadform", "filename", path + "/"
                + filename);
    }
}