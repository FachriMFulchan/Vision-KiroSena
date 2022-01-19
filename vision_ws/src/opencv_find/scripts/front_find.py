#!/usr/bin/env python3

# Subscribe from camera1/image_raw --> FRONT
# tapi testing satu kamera dulu

# Library
import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from opencv_tools.msg import FrontBallInfo
from opencv_tools.msg import FrontFriendInfo
from opencv_tools.process_im import process_im


class CameraFrontInfo(object):
    def __init__(self, pub1, pub2):
        self._pub1 = pub1
        self._pub2 = pub2

    def callback(self, data) :
        br = CvBridge()
        rospy.loginfo("Receiving Video, Starts Extracting Front Infos")
        frame1 = br.imgmsg_to_cv2(data)


        # get frame and hsv
        frame1, hsv1 = process.setting_frame_raw(frame1)
        frame2, hsv2 = process.setting_frame_raw(frame1)


        # set contour and mas
        cnts1, mask1 = process.setting_countour_universal (hsv1, orangeLower, orangeUpper)
        cnts2, mask2 = process.setting_countour_universal (hsv2, magentaLower, magentaUpper)

        # -------- Find Koordinat Bola
        # finding moment
        frame1, mx1, my1, radius1 = process.finding_moment (cnts1, frame1)
        frame2, mx2, my2, radius2 = process.finding_moment_kotak (cnts2, frame2)

        # -------- Display grid dan nilai koordinat di frame
        # Displaying koordinat
        frame1 = process.display_center_radius (frame1, mx1, my1)
        frame2 = process.display_center_radius (frame2, mx2, my2)

        # ------- Perhitungan Jarak Front
        distance_ball = process.calculate_distance (cnts1)
        distance_friend = process.calculate_distance (cnts1)

        # ------- Knowing the position
        pos_known1 = process.knowing_position(cnts1)
        pos_known2 = process.knowing_position(cnts2)

        # ------- Knowing angle
        angle1 = process.knowing_angle (mx1)
        angle2 = process.knowing_angle (mx2)


        Fbi = FrontBallInfo()
        Fbi.radius = radius1
        Fbi.angle = angle1
        Fbi.pos_known = pos_known1
        Fbi.x_pos = mx1
        Fbi.y_pos = my1
        Fbi.distance = distance_ball

        Ffi = FrontFriendInfo()
        Ffi.radius = radius2
        Ffi.angle = angle2
        Ffi.pos_known = pos_known2
        Ffi.x_pos = mx2
        Ffi.y_pos = mx2
        Ffi.distance = distance_friend


        self._pub1.publish(Fbi)
        self._pub2.publish(Ffi)

        
        # ------- Menampilkan Frame
        stack = process.stackImages (0.8, ([frame1, mask1], [frame2, mask2]))
        cv2.imshow ('stack', stack)
        cv2.waitKey(1)



def main():
    # Node
    rospy.init_node('front_find', anonymous=False)

    # Publisher
    pub1 = rospy.Publisher('front_ball_info', FrontBallInfo)
    pub2 = rospy.Publisher('front_friend_info', FrontFriendInfo)
    info = CameraFrontInfo (pub1, pub2)

    # Subscriber
    rospy.Subscriber('/camera1/image_raw', Image, info.callback)
    rospy.spin()
    cv2.destroyAllWindows()




if __name__ == '__main__' :

    # -------- Parameter Tunning Objek
    # Bola Front 
    orangeUpper = np.array ([29, 212, 152])
    orangeLower = np.array ([0, 99, 12])

    # Tag Friend
    magentaUpper = np.array ([24, 185, 255])
    magentaLower = np.array ([0, 63, 14])

    process = process_im()
    main()