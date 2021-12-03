package PortalAluno.UniUp.Controller;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.MultiPartEmail;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import PortalAluno.UniUp.Model.EmailModel;

@RestController
@RequestMapping(value = "/api")
public class EnvioEmailController {
	
	@PostMapping(path = "/enviaremail")
	public boolean enviarEmail(@RequestBody EmailModel email)
	{
		
		MultiPartEmail emailConfig = new MultiPartEmail();
		emailConfig.setHostName("smtp.gmail.com");
		emailConfig.setSslSmtpPort("465");
		emailConfig.setStartTLSRequired(true);
		emailConfig.setStartTLSEnabled(true);
		emailConfig.setSSLOnConnect(true);
		
		
		emailConfig.setAuthenticator(new DefaultAuthenticator("Email", "Senha"));
				
		try
		{
			emailConfig.setFrom("email","Suporte UniUp");
						
			emailConfig.setSubject("Suporte");
			emailConfig.setMsg(email.getSolicitacao() + "\n\nEmail enviado por: " + email.getEmail()
			+ "\nTelefone Para Contato: " + email.getTelefone());
			emailConfig.addTo("alysson.paulino@hotmail.com");
			
			emailConfig.send();
				
				
			return true;
		
		}
		catch (EmailException e) {
			e.printStackTrace();
			
			return false;
		}
		
	
	}

}
