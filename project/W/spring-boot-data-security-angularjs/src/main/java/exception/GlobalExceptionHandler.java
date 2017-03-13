package exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.*;

import org.apache.commons.lang3.exception.ExceptionUtils;

@ControllerAdvice
@RestController
public class GlobalExceptionHandler {

    @ExceptionHandler(TransactionSystemException.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    public ExceptionResponse handleTransactionSystemException(TransactionSystemException ex) {
        return new ExceptionResponse( ExceptionUtils.getRootCauseMessage(ex) );
    }

}