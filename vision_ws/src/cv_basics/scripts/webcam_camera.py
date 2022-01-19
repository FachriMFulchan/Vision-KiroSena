#!/usr/bin/env python3
# Basic ROS Program to Publish real-time streaming video
# with OpenCV


#Import libraries
import rospy #Python library for ROS
from sensor_msgs.msg import Image #Image is a message Type
from cv_bridge import CvBridge #Package to convert between ROS and OpenCV Images
import cv2 #OpenCV Library


def publish_message() :
    #Node that publishing to video topic
    #the message type is Image
    #Topic's name is video_frame
    pub = rospy.Publisher('image_raw', Image, queue_size=10)

    #Node's name
    rospy.init_node('webcam_camera', anonymous=False)

    #Go through the loop 10 times per second
    rate = rospy.Rate(10) #10hz

    #Create a VideoCapture object
    #to the '0' == default webcam
    cap = cv2.VideoCapture(0)

    #Used to convert between ROS and OpenCV images
    br = CvBridge()

    #While ROS is still running.
    while not rospy.is_shutdown():
        #Capture frame by frame
        ret, frame = cap.read()

        if ret == True:
            #Print debugging information to terminal
            rospy.loginfo('Publishing video frame')

            #Publish the image
            #but convert first from Image OpenCV to ROS Image message
            pub.publish(br.cv2_to_imgmsg(frame, 'bgr8'))

        # Sleep just enough to maintain the desired rate
        rate.sleep()



if __name__ == '__main__' :
    try:
        publish_message()
    except rospy.ROSInterruptException:
        pass
