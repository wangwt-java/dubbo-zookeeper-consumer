package com.jk.util;

import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
public class FTPUtils {

    private static FTPUtils instance = null;
    private static FTPClient ftpClient = null;
    private String userName = "wwt";
    private String userPassword = "wwt";
    private String server_url = "192.168.71.83";
    private int port = 21;
    private String cache_dir = "e:/cache/";//用于压缩图片

    public static FTPUtils getInstance(){
        if(instance == null){
            instance = new FTPUtils();
        }

        ftpClient = new FTPClient();
        return instance;
    }

    /**
     * 连接FTP服务器
     * @return
     */
    private boolean connect(){
        boolean stat = false;
        try {
            if(ftpClient.isConnected())
                return true;
            ftpClient.connect(server_url, port);
            stat = true;
        } catch (SocketException e) {
            stat = false;
            e.printStackTrace();
        } catch (IOException e) {
            stat = false;
            e.printStackTrace();
        }
        return stat;
    }

    /**
     * 打开FTP服务器
     * @return
     */
    public boolean open(){
        if(!connect()){
            return false;
        }

        boolean stat = false;
        try {
            stat = ftpClient.login(userName, userPassword);
            // 检测连接是否成功
            int reply = ftpClient.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                close();
                stat = false;
            }
        } catch (IOException e) {
            stat = false;
        }
        return stat;
    }

    /**
     * 关闭FTP服务器
     */
    public void close(){
        try {
            if(ftpClient != null){
                if(ftpClient.isConnected()){
                    ftpClient.logout();
                    ftpClient.disconnect();
                }

                ftpClient = null;
            }
        } catch (IOException e) {
        }
    }

    /**
     * 上传文件到FTP服务器
     * @param filename
     * @param path
     * @param input
     * @return
     */
    public boolean upload(String filename,String path,InputStream input){
        boolean stat = false;
        try {
            cd(path);
            ftpClient.setBufferSize(1024);
            ftpClient.setControlEncoding("GBK");
            ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
            stat = ftpClient.storeFile(filename, input);
            input.close();  //关闭输入流
        } catch (IOException e) {

        }
        return stat;
    }

    /**
     * 循环切换目录
     * @param dir
     * @return
     */
    public boolean cd(String dir){
        boolean stat = true;
        try {
            String[] dirs = dir.split("/");
            if(dirs.length == 0){
                return ftpClient.changeWorkingDirectory(dir);
            }

            //stat = ftpClient.changeToParentDirectory();
            for(String dirss : dirs){
                stat = ftpClient.changeWorkingDirectory(dirss);
                //stat = stat && ftpClient.changeWorkingDirectory(dirss);
                /*boolean b = ftpClient.changeWorkingDirectory(dirss);*/
            }

        } catch (IOException e) {
            stat = false;
        }
        return stat;
    }

    /***
     * 创建目录
     * @param dir
     * @return
     */
    public boolean mkdir(String dir){
        boolean stat = false;
        try {
            //ftpClient.changeToParentDirectory();
            ftpClient.makeDirectory(dir);
            stat = true;
        } catch (IOException e) {
            stat = false;
        }
        return stat;
    }

    /**
     * 删除文件夹
     * @param pathname
     * @return
     */
    public boolean rmdir(String pathname){
        try{
            return ftpClient.removeDirectory(pathname);
        }catch(Exception e){
            return false;
        }
    }

    /**
     * 删除文件
     * @param pathname
     * @return
     */
    public boolean remove(String pathname){
        boolean stat = false;
        try{
            stat = ftpClient.deleteFile(pathname);
        }catch(Exception e){
            stat = false;
        }
        return stat;
    }

    /**
     * 移动文件或文件夹
     * @param pathname1
     * @param pathname2
     * @return
     */
    public boolean rename(String pathname1,String pathname2){
        try {
            return ftpClient.rename(pathname1, pathname2);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 上传图片自动压缩处理
     * @param path
     * @param filename
     * @param input
     * @param quality
     * @param maxWidth
     * @param maxHeight
     * @return
     */
    /*public boolean uploadImage(String path,String filename,InputStream input,float quality,int maxWidth,int maxHeight){
        boolean stat = false;
        try {
            String suffex = filename.substring(filename.lastIndexOf(".")+1, filename.length());
            System.out.println(suffex);
            File imagePath = new File(cache_dir + filename);
            Thumbnails.of(input).outputQuality(quality).size(maxWidth,maxHeight).toFile(imagePath);
            input.close();

            if(!imagePath.exists()){
                return false;
            }

            cd(path);
            ftpClient.setBufferSize(1024);
            ftpClient.setControlEncoding("GBK");
            ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
            FileInputStream input2 = new FileInputStream(imagePath);
            stat = ftpClient.storeFile(filename,input2);
            input2.close();//关闭输入流
            imagePath.delete();
            stat = true;
        } catch (IOException e) {
            e.printStackTrace();
            stat = false;
        }
        return stat;
    }*/
}
