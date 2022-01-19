; Auto-generated. Do not edit!


(cl:in-package opencv_tools-msg)


;//! \htmlinclude OmniBallInfo.msg.html

(cl:defclass <OmniBallInfo> (roslisp-msg-protocol:ros-message)
  ((Header
    :reader Header
    :initarg :Header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (radius
    :reader radius
    :initarg :radius
    :type cl:float
    :initform 0.0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (pos_known
    :reader pos_known
    :initarg :pos_known
    :type cl:boolean
    :initform cl:nil)
   (x_pos
    :reader x_pos
    :initarg :x_pos
    :type cl:integer
    :initform 0)
   (y_pos
    :reader y_pos
    :initarg :y_pos
    :type cl:integer
    :initform 0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass OmniBallInfo (<OmniBallInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OmniBallInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OmniBallInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name opencv_tools-msg:<OmniBallInfo> is deprecated: use opencv_tools-msg:OmniBallInfo instead.")))

(cl:ensure-generic-function 'Header-val :lambda-list '(m))
(cl:defmethod Header-val ((m <OmniBallInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader opencv_tools-msg:Header-val is deprecated.  Use opencv_tools-msg:Header instead.")
  (Header m))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <OmniBallInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader opencv_tools-msg:radius-val is deprecated.  Use opencv_tools-msg:radius instead.")
  (radius m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <OmniBallInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader opencv_tools-msg:angle-val is deprecated.  Use opencv_tools-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'pos_known-val :lambda-list '(m))
(cl:defmethod pos_known-val ((m <OmniBallInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader opencv_tools-msg:pos_known-val is deprecated.  Use opencv_tools-msg:pos_known instead.")
  (pos_known m))

(cl:ensure-generic-function 'x_pos-val :lambda-list '(m))
(cl:defmethod x_pos-val ((m <OmniBallInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader opencv_tools-msg:x_pos-val is deprecated.  Use opencv_tools-msg:x_pos instead.")
  (x_pos m))

(cl:ensure-generic-function 'y_pos-val :lambda-list '(m))
(cl:defmethod y_pos-val ((m <OmniBallInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader opencv_tools-msg:y_pos-val is deprecated.  Use opencv_tools-msg:y_pos instead.")
  (y_pos m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <OmniBallInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader opencv_tools-msg:distance-val is deprecated.  Use opencv_tools-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OmniBallInfo>) ostream)
  "Serializes a message object of type '<OmniBallInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pos_known) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'x_pos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y_pos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OmniBallInfo>) istream)
  "Deserializes a message object of type '<OmniBallInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radius) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'pos_known) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_pos) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y_pos) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OmniBallInfo>)))
  "Returns string type for a message object of type '<OmniBallInfo>"
  "opencv_tools/OmniBallInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OmniBallInfo)))
  "Returns string type for a message object of type 'OmniBallInfo"
  "opencv_tools/OmniBallInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OmniBallInfo>)))
  "Returns md5sum for a message object of type '<OmniBallInfo>"
  "e12555c6777f103b129b21a823dbf452")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OmniBallInfo)))
  "Returns md5sum for a message object of type 'OmniBallInfo"
  "e12555c6777f103b129b21a823dbf452")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OmniBallInfo>)))
  "Returns full string definition for message of type '<OmniBallInfo>"
  (cl:format cl:nil "Header Header~%float32 radius~%float32 angle~%bool pos_known~%~%int32 x_pos~%int32 y_pos~%float32 distance~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OmniBallInfo)))
  "Returns full string definition for message of type 'OmniBallInfo"
  (cl:format cl:nil "Header Header~%float32 radius~%float32 angle~%bool pos_known~%~%int32 x_pos~%int32 y_pos~%float32 distance~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OmniBallInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Header))
     4
     4
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OmniBallInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'OmniBallInfo
    (cl:cons ':Header (Header msg))
    (cl:cons ':radius (radius msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':pos_known (pos_known msg))
    (cl:cons ':x_pos (x_pos msg))
    (cl:cons ':y_pos (y_pos msg))
    (cl:cons ':distance (distance msg))
))
