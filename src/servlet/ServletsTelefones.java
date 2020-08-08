package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanCursoJsp;
import beans.BeanTelefones;
import dao.DaoTelefones;
import dao.DaoUsuario;

/**
 * Servlet implementation class ServletTelefones
 */
@WebServlet("/salvarTelefones")
public class ServletsTelefones extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario();
	private DaoTelefones daoTelefones = new DaoTelefones();

	public ServletsTelefones() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String acao = request.getParameter("acao");
			String user = request.getParameter("user");
			BeanCursoJsp beanCursoJsp = daoUsuario.consultar(user);
			if (acao.equalsIgnoreCase("addFone")) {
				request.getSession().setAttribute("userEscolhido", beanCursoJsp);
				request.setAttribute("userEscolhido", beanCursoJsp);

				RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
				request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
				view.forward(request, response);
			} else if (acao.equalsIgnoreCase("deleteFone")) {
				String foneId = request.getParameter("foneId");
				daoTelefones.delete(foneId);

				beanCursoJsp = (BeanCursoJsp) request.getSession().getAttribute("userEscolhido");

				RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
				request.setAttribute("userEscolhido", beanCursoJsp);
				request.setAttribute("telefones", daoTelefones.listar(Long.parseLong(user)));
				request.setAttribute("msg", "Excluido com sucesso!");
				view.forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			BeanCursoJsp beanCursoJsp = (BeanCursoJsp) request.getSession().getAttribute("userEscolhido");
			String numero = request.getParameter("numero");
			String tipo = request.getParameter("tipo");
			String acao = request.getParameter("acao");
			
			if(acao == null || (acao != null && !numero.isEmpty())) {

			if (numero == null || (numero != null && numero.isEmpty())) {
				RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
				request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
				request.setAttribute("msg", "Informe o numero do telefone!");
				view.forward(request, response);
			} else {

				BeanTelefones telefone = new BeanTelefones();
				telefone.setNumero(numero);
				telefone.setTipo(tipo);
				telefone.setUsuario(beanCursoJsp.getId());

				daoTelefones.salvar(telefone);

				request.getSession().setAttribute("userEscolhido", beanCursoJsp);
				request.setAttribute("userEscolhido", beanCursoJsp);

				RequestDispatcher view = request.getRequestDispatcher("/telefones.jsp");
				request.setAttribute("telefones", daoTelefones.listar(beanCursoJsp.getId()));
				request.setAttribute("msg", "Salvo com sucesso!");
				view.forward(request, response);
			}
			}else {
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
