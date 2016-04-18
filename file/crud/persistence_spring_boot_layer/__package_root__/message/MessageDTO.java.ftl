package ${package_root}.message;

/**
 * @author Techne
 * 
 * Classe para criação do objeto mensagemDTO para o
 * trafego de mensagens entre servidor e cliente
 * @since 03/03/2016
 */
public class MessageDTO {

    private String message;
    private TipoMensagemEnum type;

    public MessageDTO() {
        super();
    }

    public MessageDTO(TipoMensagemEnum tipo, String mensagem) {
        super();
        this.message = mensagem;
        this.type = tipo;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public TipoMensagemEnum getType() {
        return this.type;
    }

    public void setType(TipoMensagemEnum type) {
        this.type = type;
    }
}
