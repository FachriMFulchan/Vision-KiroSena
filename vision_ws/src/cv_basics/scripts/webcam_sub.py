#!/usr/bin/env python3

#Import libraries
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2


def callback(data):

    #Used to convert ROS message to OpenCV images
    br = CvBridge()

    #Output debugging information to the terminal
    rospy.loginfo("receiving video frame")

    #Convert ROS Image message to OpenCV Image
    current_frame = br.imgmsg_to_cv2(data)

    #Display image
    cv2.imshow("camera", current_frame)

    cv2.waitKey(1)



def receive_message():
    #Tells ropsy the name of this node
    rospy.init_node('webcam_sub', anonymous=False)

    #Node is subscribing to the video_frames topic
    rospy.Subscriber('video_frames', Image, callback)

    #spin () simplu keeps python from exiting until this node is stopped
    rospy.spin()

    #Close down the video stream when done
    cv2.destroyAllWindows()


if __name__ == '__main__':
    receive_message()