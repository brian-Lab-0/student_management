package util;

/**
 * 一JSON type loaded by layui data table
 * @author zhang jin sheng
 *
 */
public class LayuiTableData {

    public static final int FLAG_SUCC = 0;  //Data acquisition succeeded
    public static final int FLAG_FAIL = 1;  //Data acquisition failed

    public int code; //Processing result status code
    public String msg;  //Processing result return message
    public int count;  //the number of returned data
    public Object data; //To query data, a list is required

    public LayuiTableData(){
        this.code = FLAG_FAIL;
        this.msg = null;
        this.count = 0;
        this.data = null;
    }
}
