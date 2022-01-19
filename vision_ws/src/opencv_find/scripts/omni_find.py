#!/usr/bin/env python3

# Subscribe from camera2/image_raw --> OMNI
# tapi testing satu kamera dulu

# Library
import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from opencv_tools.msg import OmniBallInfo
from opencv_tools.process_im import process_im


class CameraFrontInfo(object):
    def __init__(self, pub):
        self._pub = pub


    def callback(self, data) :
        br = CvBridge()
        rospy.loginfo("Receiving Video, Extracting Omni Infos")
        frame1 = br.imgmsg_to_cv2(data)


        # get frame and hsv
        frame1, hsv1 = process.setting_frame_raw(frame1)


        # set contour and mas
        cnts1, mask1 = process.setting_countour_universal (hsv1, orangeLower_360, orangeUpper_360)

        # -------- Find Koordinat Bola
        # finding moment
        frame1, mx1, my1, radius1 = process.finding_moment (cnts1, frame1)

        # -------- Display grid dan nilai koordinat di frame
        # Displaying koordinat
        frame1 = process.display_center_radius (frame1, mx1, my1)

        # ------- Perhitungan Jarak Front
        distance_ball = process.calculate_distance (cnts1)


        # ------- Knowing the position
        pos_known1 = process.knowing_position(cnts1)

        # ------- Knowing angle
        angle1 = process.knowing_angle (mx1)


        Obi = OmniBallInfo()
        Obi.radius = radius1
        Obi.angle = angle1
        Obi.pos_known = pos_known1
        Obi.x_pos = mx1
        Obi.y_pos = my1
        Obi.distance = distance_ball


        self._pub.publish(Obi)

        
        # ------- Menampilkan Frame
        stack = process.stackImages (0.8, ([frame1, mask1], [frame1, mask1]))
        cv2.imshow ('stack', stack)
        cv2.waitKey(1)



def main():
    # Node
    rospy.init_node('omni_find', anonymous=False)

    # Publisher
    pub = rospy.Publisher('omni_ball_info', OmniBallInfo)
    info = CameraFrontInfo (pub)

    rospy.Subscriber('/camera2/image_raw', Image, info.callback)
    rospy.spin()
    cv2.destroyAllWindows()




if __name__ == '__main__' :

    # -------- Parameter Tunning Objek
    # Bola Front 
    orangeUpper_360 = np.array ([24, 185, 255])
    orangeLower_360 = np.array ([0, 63, 14])


    process = process_im()
    main()