
(cl:in-package :asdf)

(defsystem "opencv_tools-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "FrontBallInfo" :depends-on ("_package_FrontBallInfo"))
    (:file "_package_FrontBallInfo" :depends-on ("_package"))
    (:file "FrontFriendInfo" :depends-on ("_package_FrontFriendInfo"))
    (:file "_package_FrontFriendInfo" :depends-on ("_package"))
    (:file "OmniBallInfo" :depends-on ("_package_OmniBallInfo"))
    (:file "_package_OmniBallInfo" :depends-on ("_package"))
  ))