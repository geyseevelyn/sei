package br.edu.ufersa.sei.controller;

import java.net.URL;
import java.util.ResourceBundle;

import br.edu.ufersa.sei.exception.AutenticationException;
import br.edu.ufersa.sei.exception.InsertException;
import br.edu.ufersa.sei.model.BO.UsuarioBO;
import br.edu.ufersa.sei.model.BO.UsuarioInterBO;
import br.edu.ufersa.sei.model.VO.AlunoVO;
import br.edu.ufersa.sei.model.VO.DiretorVO;
import br.edu.ufersa.sei.model.VO.UsuarioVO;
import br.edu.ufersa.sei.view.Telas;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

public class LoginController implements Initializable {
	private static UsuarioInterBO<UsuarioVO> usuBO = new UsuarioBO<UsuarioVO>();
	
	//Componentes da Tela de Login
	@FXML
	private Label erroLogin;
	@FXML
	private TextField login;
	@FXML
	private TextField senha;
	
	public void autenticar(ActionEvent event) throws Exception{
		UsuarioVO vo = new UsuarioVO();
		
		try {
			vo.setLogin(login.getText());
			vo.setSenha(senha.getText());
		} 
		catch (InsertException e) {
			e.printStackTrace();
		}
		try {
			UsuarioVO autenticado = usuBO.autenticar(vo);
			if(autenticado instanceof DiretorVO) {
				Telas.telaPrincipalDiretor();
			} else {
					if(autenticado instanceof AlunoVO) {
						Telas.telaPrincipalAluno();
					} else {
					Telas.telaPrincipalProf();
					}	
			}
		} catch(AutenticationException e) {
			erroLogin.setText("Usuário ou senha inválidos");
			erroLogin.setVisible(true);
			//Telas.telaLogin();
		}
	}
	
	public void sair(ActionEvent event) throws Exception{
		Telas.telaLogin();
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub	
	}

}
