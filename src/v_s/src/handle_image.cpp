#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <iostream>
#include <sensor_msgs/image_encodings.h>
#include <cmath>
#include <vector>
#include <fstream>
#include <Eigen/Dense>
#define WINDOWS1 "depth_image"
#define WINDOWS2 "depth_greyimage"
#define WINDOWS3 "desired_image"

using namespace Eigen;

using namespace cv;
using namespace std;
using std::stringstream;
using std::string;
using std::vector;


//camera intriparam: [ 3.6200722426806516e+02, 0., 2.5309378269159924e+02, 0.,3.6188241930411635e+02, 2.0502034288339061e+02, 0., 0., 1. ]
double cam[9]={ 3.6200722426806516e+02,0,2.5309378269159924e+02, 0,3.6188241930411635e+02,2.0502034288339061e+02, 0, 0, 1};
Mat camera_matrix = Mat(3,3,CV_64FC1,cam);
//定义视觉饲服获得的控制相机运动的速度
 Matrix <double,6,1>v;
 //定义发布给ur的twist变量
geometry_msgs::Twist velcam;
bool get_vel(false);
//对原始图像进行处理
void handle_image(Mat &picture,bool meter,Mat &picture2)
{

  for (int i=0;i<picture.rows;i++)
  {
    //int c=picture.rows;
    //int s=picture.cols;
    for (int j=0;j<picture.cols;j++)
    {
      if (meter)
      {
      //float a = picture.ptr<ushort>(i)[j]/1000.0;
      //float a = picture.at<ushort>(i,j)/1000.0;
      picture.at<ushort>(i,j) = picture.at<ushort>(i,j)/1000;
        if (picture.at<ushort>(i,j)<0.0 || picture.at<ushort>(i,j)>3.0)
        {
          picture.at<ushort>(i,j)=0;
        }
      }
      else if (picture.at<ushort>(i,j)<0.0 || picture.at<ushort>(i,j)>3000.0)
        {
          picture.at<ushort>(i,j)=0;
        }
      picture2.at<ushort>(i,j) = picture.at<ushort>(i,j);
    }
  }
}
//计算x和y方向的梯度，只对两幅图像中可用点进行计算
void grads(const Mat &picture_depth,const Mat &picture_desired,vector<ushort> &z,vector<ushort> &z_d,vector<vector<double> > &gradx,vector<vector<double> > &grady)//,vector<ushort> &vect_gradx,vector<ushort> &vect_grady)
{

  for (int i=0;i<picture_depth.rows-1;i++)
  {
    for (int j=0;j<picture_depth.cols-1;j++)
    {
      if (picture_depth.at<ushort>(i,j)!=0 && picture_desired.at<ushort>(i,j)!=0 )
      {
        gradx[i][j]=(picture_depth.at<ushort>(i,j+1) - picture_depth.at<ushort>(i,j) + picture_depth.at<ushort>(i+1,j+1) - picture_depth.at<ushort>(i+1,j))/2;
        grady[i][j]=(picture_depth.at<ushort>(i+1,j) - picture_depth.at<ushort>(i,j) + picture_depth.at<ushort>(i+1,j+1) - picture_depth.at<ushort>(i,j+1))/2;

        z.push_back(picture_depth.at<ushort>(i,j));
        z_d.push_back(picture_desired.at<ushort>(i,j));

       // vect_gradx.push_back(gradx[i][j]);
       // vect_grady.push_back(grady[i][j]);
      }
    }
  }
}


//根据相机内参矩阵，计算空间点在相机坐标系下的坐标
void calculate_XY_c(const Mat &picture_depth,const Mat & picture_desired ,vector<vector<double> >& X_c,vector<vector<double> >& Y_c)//,vector<ushort>& vect_X_c,vector<ushort>& vect_Y_c)
{
  double Fx = camera_matrix.at<double>(0,0);
  double Fy = camera_matrix.at<double>(1,1);
  double cx  = camera_matrix.at<double>(0,2);
  double cy  = camera_matrix.at<double>(1,2);

  for (int i=0;i<picture_depth.rows-1;i++)
  {
    for (int j=0;j<picture_depth.cols-1;j++)
    {
      if (picture_depth.at<ushort>(i,j)!=0 && picture_desired.at<ushort>(i,j)!=0 )
      {
        X_c[i][j]=picture_depth.at<ushort>(i,j)*(i-cx)/Fx;
        Y_c[i][j]=picture_depth.at<ushort>(i,j)*(j-cy)/Fy;

       // vect_X_c.push_back(X_c[i][j]);
       //vect_Y_c.push_back(Y_c[i][j]);
      }
    }
  }
}

//根据X=xZ计算图像平面中的坐标(单位为长度)
void calculate_xy_p(const Mat &picture_depth, const Mat &picture_desired,const vector<vector<double> >& X_c,const vector<vector<double> >& Y_c,vector<vector<double> >& x_p, vector<vector<double> >& y_p)//,vector<ushort>&vect_x_p,vector<ushort>&vect_y_p)
{
  for (int i=0;i<picture_depth.rows-1;i++)
  {
    for (int j=0;j<picture_depth.cols-1;j++)
    {
      if (picture_depth.at<ushort>(i,j)!=0 && picture_desired.at<ushort>(i,j)!=0 )
      {
        x_p[i][j]=X_c[i][j]/picture_depth.at<ushort>(i,j);
        y_p[i][j]=Y_c[i][j]/picture_depth.at<ushort>(i,j);

       // vect_x_p.push_back(x_p[i][j]);
       // vect_y_p.push_back(y_p[i][j]);
      }

    }
  }
}

void calculate_lzt(const Mat &picture_depth,const Mat &picture_desired,vector<vector<double> > &gradx,vector<vector<double> > &grady,vector<vector<double> > x, vector<vector<double> > y,vector<vector<double> > &lztx,vector<vector<double> > &lzty,vector<vector<double> > &lztz,vector<double>&vect_lztx,vector<double>&vect_lzty,vector<double>&vect_lztz)
{
  for (int i=0;i<picture_depth.rows-1;i++)
  {
    for (int j=0;j<picture_depth.cols-1;j++)
    {
      if (picture_depth.at<ushort>(i,j)!=0 && picture_desired.at<ushort>(i,j)!=0 )
      {
        lztx[i][j]=gradx[i][j]/picture_depth.at<ushort>(i,j);
        lzty[i][j]=grady[i][j]/picture_depth.at<ushort>(i,j);
        lztz[i][j]=(-1)*(picture_depth.at<ushort>(i,j) + x[i][j]*gradx[i][j] +y[i][j]*grady[i][j])/picture_depth.at<ushort>(i,j);

        vect_lztx.push_back(lztx[i][j]);
        vect_lzty.push_back(lzty[i][j]);
        vect_lztz.push_back(lztz[i][j]);

      }
    }
  }
}

void calculate_lzw(const Mat &picture_depth,const Mat &picture_desired,vector<vector<double> > &gradx,vector<vector<double> > &grady,vector<vector<double> > x, vector<vector<double> > y,vector<vector<double> > &lzwx,vector<vector<double> > &lzwy,vector<vector<double> > &lzwz,vector<double>&vect_lzwx,vector<double>&vect_lzwy,vector<double>&vect_lzwz)
{
  for (int i=0;i<picture_depth.rows-1;i++)
  {
    for (int j=0;j<picture_depth.cols-1;j++)
    {
      if (picture_depth.at<ushort>(i,j)!=0 && picture_desired.at<ushort>(i,j)!=0 )
      {
        lzwx[i][j] = ((-1)*y[i][j]*picture_depth.at<ushort>(i,j)) - x[i][j]*y[i][j]*gradx[i][j] + (1+y[i][j]*y[i][j])*grady[i][j];
        lzwy[i][j] = x[i][j]*picture_depth.at<ushort>(i,j) + (1+x[i][j]*x[i][j])*gradx[i][j] + x[i][j]*y[i][j]*grady[i][j];
        lzwz[i][j] = x[i][j]*grady[i][j] - y[i][j]*gradx[i][j];

        vect_lzwx.push_back(lzwx[i][j]);
        vect_lzwy.push_back(lzwy[i][j]);
        vect_lzwz.push_back(lzwz[i][j]);
      }
    }
  }
}



void image_Callback(const sensor_msgs::ImageConstPtr& msg)
{
  //获得深度图的实际数据
    cv::Mat desired_image_sub;
    desired_image_sub = cv_bridge::toCvShare(msg)->image;

    cv::Mat depth_image_sub;
    depth_image_sub = cv_bridge::toCvShare(msg)->image;

    //对深度图进行直方图均衡化后的灰度图
      cv::Mat grey_img,grey_equ_img;
      cv_bridge::CvImageConstPtr cv_ptr;
      //转换ROS图像消息到opencv图像
      cv_ptr=cv_bridge::toCvShare(msg,sensor_msgs::image_encodings::TYPE_8UC1);
      grey_img=cv_ptr->image;
      //cv::imshow("Show depth-greyImage", grey_img);
      cv::equalizeHist(grey_img,grey_equ_img);

    int widthU = depth_image_sub.cols;				//图片宽度
    int heightV =depth_image_sub.rows;				//图片长度
    Mat desired_image;
    desired_image.create(desired_image_sub.rows,desired_image_sub.cols,desired_image_sub.type());
    Mat depth_image;
    depth_image.create(depth_image_sub.rows,depth_image_sub.cols,depth_image_sub.type());

    vector<vector<double> > gradx(heightV-1, vector<double>(widthU-1));
    vector<vector<double> > grady(heightV-1, vector<double>(widthU-1));
    vector<vector<double> > X_c(heightV-1, vector<double>(widthU-1));
    vector<vector<double> > Y_c(heightV-1, vector<double>(widthU-1));
    vector<vector<double> > x_p(heightV-1, vector<double>(widthU-1));
    vector<vector<double> > y_p(heightV-1, vector<double>(widthU-1));
    vector<vector<double> > lztx(heightV-1, vector<double>(widthU-1));
    vector<vector<double> > lzty(heightV-1, vector<double>(widthU-1));
    vector<vector<double> > lztz(heightV-1, vector<double>(widthU-1));
    vector<vector<double> > lzwx(heightV-1, vector<double>(widthU-1));
    vector<vector<double> > lzwy(heightV-1, vector<double>(widthU-1));
    vector<vector<double> > lzwz(heightV-1, vector<double>(widthU-1));


    vector<ushort>z;
    vector<ushort>z_d;

    vector<double>vect_lztx;
    vector<double>vect_lzty;
    vector<double>vect_lztz;
    vector<double>vect_lzwx;
    vector<double>vect_lzwy;
    vector<double>vect_lzwz;


    bool get_desired(false);
    bool get_actual_depth(false);

    imshow(WINDOWS3,desired_image_sub);
    char key1=waitKey(30);

    imshow(WINDOWS1,depth_image_sub);
    char key2=waitKey(30);

    if(key1 == 32)           //the Ascii of "Space key" is 32
    get_desired = true;

    if(key2 == 27)           //the Ascii of "ESC key" is 27
    get_actual_depth = true;



    if(get_desired)
    {
      //获得理想位姿下的图
       handle_image(desired_image_sub,1,desired_image);

      get_desired = false;
      ofstream write_desired;
      write_desired.open("/home/zhsyi/vision_servo_zsy/src/v_s/src/desired.txt");
      write_desired<<desired_image;
      write_desired.close();
  //exit(0);
      fstream file;
      file.open("/home/zhsyi/vision_servo_zsy/src/v_s/src/desired.txt",ios::in);
      if(file.get()!=EOF)
      {
        cout<<"desired depth_image has been saved"<<endl;
      }
      file.close();

     }

    //开始捕捉实际位姿的图像

  if (get_actual_depth)
  {
      //imshow(WINDOWS1,depth_image);
      //imshow(WINDOWS2,grey_equ_img);
     // waitKey(0);
      get_actual_depth = false;
      cout<<"capture actual depthimage"<<endl;
      handle_image(depth_image_sub,1,depth_image);
      grads(depth_image,desired_image,z,z_d,gradx,grady);//,vect_gradx,vect_grady);
      calculate_XY_c(depth_image,desired_image,X_c,Y_c);//,vect_X_c,vect_Y_c);
      calculate_xy_p(depth_image,desired_image,X_c,Y_c,x_p,y_p);//,vect_x_p,vect_y_p);
      calculate_lzt(depth_image,desired_image,gradx,grady,x_p,y_p,lztx,lzty,lztz,vect_lztx,vect_lzty,vect_lztz);
      calculate_lzw(depth_image,desired_image,gradx,grady,x_p,y_p,lzwx,lzwy,lzwz,vect_lzwx,vect_lzwy,vect_lzwz);


      cout<<"length of lztx"<<vect_lztx.size()<<endl;

      ofstream write_depth;
      write_depth.open("/home/zhsyi/vision_servo_zsy/src/v_s/src/depth.txt");
      write_depth<<depth_image;
      write_depth.close();


       int n = vect_lztx.size();

      //开始计算交互矩阵
     Eigen::MatrixXd Ld(n,6);

        for (int i=0;i<n;i++)
          {
            Ld(i,0) = vect_lztx[i];
          }
        for (int i=0;i<n;i++)
          {
            Ld(i,1) = vect_lzty[i];
          }
        for (int i=0;i<n;i++)
          {
            Ld(i,2) = vect_lztz[i];
          }
        for (int i=0;i<n;i++)
          {
            Ld(i,3) = vect_lzwx[i];
          }
        for (int i=0;i<n;i++)
          {
            Ld(i,4) = vect_lzwy[i];
          }
        for (int i=0;i<n;i++)
          {
            Ld(i,5) = vect_lzwz[i];
          }
       MatrixXd Ld_inv(6,n);
       Ld_inv =(Ld.transpose() * Ld).inverse() * Ld.transpose();
      double a=0.5;
     // Matrix <double,6,1>v;
      MatrixXd matz(n,1);
      MatrixXd matz_d(n,1);

      for (int i=0;i<n;i++)
      {
        matz(i,0) = z[i];
        matz_d(i,0) = z_d[i];
      }
      MatrixXd diff_z(n,1);
      diff_z=matz-matz_d;
      ushort number=0;
      for (int i=0;i<n;i++)
      {
        if (diff_z(i,0))
          number=number+1;
      }
cout<<"diff of two picture=:"<<number<<endl;
      v=(-1)*a*Ld_inv*diff_z;
     // cout<<matz<<endl;
      cout<<"v="<<endl;
      cout<<v<<endl;
//get_vel=true;
      /* ros::NodeHandle nh;
       ros::Publisher vel_pub = nh.advertise<geometry_msgs::Twist>("/ur_arm_cotroller/cmd_tool_vel", 1);

       while (ros::ok())
       {
           velcam.linear.x = v(0,0);
           velcam.linear.y = v(1,0);
           velcam.linear.z = v(2,0);
           velcam.angular.x = v(3,0);
           velcam.angular.y = v(4,0);
           velcam.angular.z = v(5,0);

           vel_pub.publish(velcam);
           sleep(2);
       }*/
  }


}


int main(int argc, char **argv)
{
  ros::init(argc, argv, "handle_twoimage");
  ros::NodeHandle nh;
  image_transport::ImageTransport it(nh);

  image_transport::Subscriber sub_image = it.subscribe("/kinect2/qhd/image_depth_rect", 1, image_Callback);
 //ros::Publisher vel_pub = nh.advertise<geometry_msgs::Twist>("/ur_arm_cotroller/cmd_tool_vel", 1);

  /*if(get_vel)
  {
      velcam.linear.x = v(0,0);
      velcam.linear.y = v(1,0);
      velcam.linear.z = v(2,0);
      velcam.angular.x = v(3,0);
      velcam.angular.y = v(4,0);
      velcam.angular.z = v(5,0);
cout<<"nihao hahahah"<<endl;
      vel_pub.publish(velcam);
      sleep(2);
  }*/
  ros::spin();

  return 0;
}



