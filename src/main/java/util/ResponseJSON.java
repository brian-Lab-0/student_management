package util;

/**
 * A JSON type object for storing information returned by Ajax
 * @author zhang jin sheng
 *
 */
public class ResponseJSON {

    public static final int FLAG_SUCC = 10001;  //Processed successfully
    public static final int FLAG_FAIL = 10002;  //Processing failed
    public static final int FLAG_UNKNOWN_ERORR = 10003;  //Unknown exception or error

    public int status; //Processing result status code
    public String msg;  //Processing result return message
    public Object result; //Process the returned result. Here is a character converted to JSON format

    public ResponseJSON(){
        this.status = FLAG_FAIL;
        this.msg = null;
        this.result = null;
    }
}
