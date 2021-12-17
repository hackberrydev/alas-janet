(import testament :prefix "" :exit true)

(import ../../src/date :as "d")
(import ../../src/plan)
(import ../../src/day)
(import ../../src/task)
(import ../../src/commands/remove_empty_days :prefix "")

(deftest remove-empty-days-in-past
  (def plan
    (plan/build-plan "Plan" @[]
                     @[(day/build-day (d/date 2020 8 5))
                       (day/build-day (d/date 2020 8 4))
                       (day/build-day (d/date 2020 8 3) @[]
                                      @[(task/build-task "Buy milk" true)])]))
  (def new-plan (remove-empty-days plan (d/date 2020 8 6)))
  (is (= 1 (length (new-plan :days))))
  (is (= (d/date 2020 8 3) ((first (new-plan :days)) :date))))

(run-tests!)
