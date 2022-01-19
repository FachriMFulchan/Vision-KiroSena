;; Auto-generated. Do not edit!


(when (boundp 'opencv_tools::OmniBallInfo)
  (if (not (find-package "OPENCV_TOOLS"))
    (make-package "OPENCV_TOOLS"))
  (shadow 'OmniBallInfo (find-package "OPENCV_TOOLS")))
(unless (find-package "OPENCV_TOOLS::OMNIBALLINFO")
  (make-package "OPENCV_TOOLS::OMNIBALLINFO"))

(in-package "ROS")
;;//! \htmlinclude OmniBallInfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass opencv_tools::OmniBallInfo
  :super ros::object
  :slots (_Header _radius _angle _pos_known _x_pos _y_pos _distance ))

(defmethod opencv_tools::OmniBallInfo
  (:init
   (&key
    ((:Header __Header) (instance std_msgs::Header :init))
    ((:radius __radius) 0.0)
    ((:angle __angle) 0.0)
    ((:pos_known __pos_known) nil)
    ((:x_pos __x_pos) 0)
    ((:y_pos __y_pos) 0)
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _Header __Header)
   (setq _radius (float __radius))
   (setq _angle (float __angle))
   (setq _pos_known __pos_known)
   (setq _x_pos (round __x_pos))
   (setq _y_pos (round __y_pos))
   (setq _distance (float __distance))
   self)
  (:Header
   (&rest __Header)
   (if (keywordp (car __Header))
       (send* _Header __Header)
     (progn
       (if __Header (setq _Header (car __Header)))
       _Header)))
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:pos_known
   (&optional (__pos_known :null))
   (if (not (eq __pos_known :null)) (setq _pos_known __pos_known)) _pos_known)
  (:x_pos
   (&optional __x_pos)
   (if __x_pos (setq _x_pos __x_pos)) _x_pos)
  (:y_pos
   (&optional __y_pos)
   (if __y_pos (setq _y_pos __y_pos)) _y_pos)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _Header
    (send _Header :serialization-length)
    ;; float32 _radius
    4
    ;; float32 _angle
    4
    ;; bool _pos_known
    1
    ;; int32 _x_pos
    4
    ;; int32 _y_pos
    4
    ;; float32 _distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _Header
       (send _Header :serialize s)
     ;; float32 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _pos_known
       (if _pos_known (write-byte -1 s) (write-byte 0 s))
     ;; int32 _x_pos
       (write-long _x_pos s)
     ;; int32 _y_pos
       (write-long _y_pos s)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _Header
     (send _Header :deserialize buf ptr-) (incf ptr- (send _Header :serialization-length))
   ;; float32 _radius
     (setq _radius (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _pos_known
     (setq _pos_known (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _x_pos
     (setq _x_pos (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y_pos
     (setq _y_pos (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get opencv_tools::OmniBallInfo :md5sum-) "e12555c6777f103b129b21a823dbf452")
(setf (get opencv_tools::OmniBallInfo :datatype-) "opencv_tools/OmniBallInfo")
(setf (get opencv_tools::OmniBallInfo :definition-)
      "Header Header
float32 radius
float32 angle
bool pos_known

int32 x_pos
int32 y_pos
float32 distance
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :opencv_tools/OmniBallInfo "e12555c6777f103b129b21a823dbf452")


