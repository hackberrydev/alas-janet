(import testament :prefix "" :exit true)
(import ../src/plan_parser :prefix "")
(import ../src/date :as d)

(deftest parse-plan
  (def plan-string
    ```
    # Main TODO

    ## Inbox

    - [ ] Fix the lamp
    - [ ] Update Rust

    ## 2020-08-01, Saturday

    - [ ] Develop photos
    - [x] Pay bills

    ## 2020-07-31, Friday

    - [x] Review open pull requests
    - [x] Fix the flaky test
    ```)
  (def plan (first (parse plan-string)))
  (def inbox (plan :inbox))
  (def day-1 ((plan :days) 0))
  (def day-2 ((plan :days) 1))
  (is (= "Main TODO" (plan :title)))
  (is (= {:title "Fix the lamp" :done false} (inbox 0)))
  (is (= {:title "Update Rust" :done false} (inbox 1)))
  (is (= (d/date 2020 8 1) (day-1 :date)))
  (is (= {:title "Develop photos" :done false} ((day-1 :tasks) 0)))
  (is (= {:title "Pay bills" :done true} ((day-1 :tasks) 1)))
  (is (= (d/date 2020 7 31) (day-2 :date)))
  (is (= {:title "Review open pull requests" :done true} ((day-2 :tasks) 0)))
  (is (= {:title "Fix the flaky test" :done true} ((day-2 :tasks) 1))))

(run-tests!)
