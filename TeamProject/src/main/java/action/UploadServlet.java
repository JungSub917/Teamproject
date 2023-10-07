package action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.DiaryDao;
import dto.DiaryDto;

@WebServlet("/UploadServlet")				
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getRealPath("upload");
		System.out.println("절대경로 : " + path);
		File filePath = new File(path);
		if(!filePath.exists()) {
			filePath.mkdirs();
		}
		int size = 10 * 1024 * 1024;    // 10MB (파일크기제한)								
		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy()); 
		Enumeration files = multi.getFileNames();
		String filename1 = multi.getFilesystemName((String)files.nextElement());
		System.out.println("파일명 : " + filename1);	//파일이름
		System.out.println("제목 : " + multi.getParameter("title"));	//제목
		System.out.println("내용 : " + multi.getParameter("editordata"));	//내용
		String title=multi.getParameter("title");
		String ctt= multi.getParameter("editordata");
		HttpSession session = request.getSession();
		int idx = (int)session.getAttribute("idx");
		String img=filename1;
		DiaryDao ddao = new DiaryDao();
		try {
			ddao.addDiaryDao(title, ctt, idx, img);
		} catch(Exception e) {
			System.out.println("실패");
		}
		response.sendRedirect("Controller?command=diary");
	}
}









