(require "asdf")

(let ((asdf:*user-cache* (uiop:getenv "AUTOPKGTEST_TMP"))) ; Store FASL in some temporary dir
  (asdf:load-system "trivial-features-tests"))

;; Can't use ASDF:TEST-SYSTEM, its return value is meaningless
(unless (trivial-features-tests:run)
  (uiop:quit 1))
