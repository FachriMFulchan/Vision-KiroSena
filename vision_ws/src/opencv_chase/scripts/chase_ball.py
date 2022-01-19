#!/usr/bin/env python3

# Node ini buat ngesubscribe data dari /front_ball_info
# Terus menggerakan robot maju/ throttle kiri /throttle kanan
# sesuai data koordinat bola

# Library
import rospy
from opencv_tools.msg import FrontBallInfo
from geometry_msgs.msg import Twist

class ChasingBall():
    def __init__ (self, pub):
        self._pub = pub

    def callback (self, data):
        angle = data.angle
        Tw = Twist()

        # maju
        if (-10 < angle < 10 and angle != 0) :
            Tw.linear.x = 0.2

        #rada ke kiri
        elif (angle <= -10) :
            Tw.linear.x = 0.1
            Tw.angular.z = -0.3

        elif (angle >= 10):
            Tw.linear.x = 0.1
            Tw.angular.z = 0.3

        elif (angle == 0):
            Tw.linear.x = 0.0
            Tw.angular.z = 0.0
        
        self._pub.publish(Tw)


def main():
    # Node
    rospy.init_node('chase_ball', anonymous=False)

    # Publisher
    pub = rospy.Publisher('/cmd_vel', Twist)
    chase = ChasingBall(pub)

    # Subscriber
    rospy.Subscriber('front_ball_info', FrontBallInfo, chase.callback)
    rospy.spin()




if __name__ == '__main__':
    main()