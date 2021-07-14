(set-info :original "../sandbox/testgen_4/testgen_4.bc")
(set-info :authors "SeaHorn v.10.0.0-rc0")
(declare-rel verifier.error (Bool Bool Bool ))
(declare-rel main@_loop.bound ())
(declare-rel main@empty.loop (Int ))
(declare-rel main@_.01 (Int Int Int ))
(declare-rel main@_ret ())
(declare-var main@%_not._0 Bool )
(declare-var main@%not._0 Bool )
(declare-var main@%_.12_0 Int )
(declare-var main@%.12_0 Int )
(declare-var main@%_.1_0 Int )
(declare-var main@%_7_0 Int )
(declare-var main@%_8_0 Bool )
(declare-var main@%nd.loop.cond_0 Bool )
(declare-var main@%.01_2 Int )
(declare-var main@%.0_2 Int )
(declare-var main@%_call_0 Bool )
(declare-var main@_loop.bound_0 Bool )
(declare-var main@%loop.bound_0 Int )
(declare-var main@empty.loop_0 Bool )
(declare-var main@empty.loop.body_0 Bool )
(declare-var main@empty.loop_1 Bool )
(declare-var main@_.01_0 Bool )
(declare-var main@%.01_0 Int )
(declare-var main@%.0_0 Int )
(declare-var main@%.01_1 Int )
(declare-var main@%.0_1 Int )
(declare-var main@%.1_0 Int )
(declare-var main@%_br_0 Int )
(declare-var main@_.01_1 Bool )
(declare-var main@_ret_0 Bool )
(rule (verifier.error false false false))
(rule (verifier.error false true true))
(rule (verifier.error true false true))
(rule (verifier.error true true true))
(rule main@_loop.bound)
(rule (=> (and main@_loop.bound
         true
         (= main@%_call_0 (= main@%loop.bound_0 100000))
         main@%_call_0
         (=> main@empty.loop_0 (and main@empty.loop_0 main@_loop.bound_0))
         main@empty.loop_0)
    (main@empty.loop main@%loop.bound_0)))
(rule (=> (and (main@empty.loop main@%loop.bound_0)
         true
         (=> main@empty.loop.body_0
             (and main@empty.loop.body_0 main@empty.loop_0))
         (=> (and main@empty.loop.body_0 main@empty.loop_0)
             main@%nd.loop.cond_0)
         (=> main@empty.loop_1 (and main@empty.loop_1 main@empty.loop.body_0))
         main@empty.loop_1)
    (main@empty.loop main@%loop.bound_0)))
(rule (=> (and (main@empty.loop main@%loop.bound_0)
         true
         (=> main@_.01_0 (and main@_.01_0 main@empty.loop_0))
         (=> (and main@_.01_0 main@empty.loop_0) (not main@%nd.loop.cond_0))
         (=> (and main@_.01_0 main@empty.loop_0) (= main@%.01_0 49707))
         (=> (and main@_.01_0 main@empty.loop_0) (= main@%.0_0 33768))
         (=> (and main@_.01_0 main@empty.loop_0) (= main@%.01_1 main@%.01_0))
         (=> (and main@_.01_0 main@empty.loop_0) (= main@%.0_1 main@%.0_0))
         main@_.01_0)
    (main@_.01 main@%.01_1 main@%.0_1 main@%loop.bound_0)))
(rule (=> (and (main@_.01 main@%.01_0 main@%.0_0 main@%loop.bound_0)
         true
         (= main@%_not._0 (> main@%.01_0 4))
         (= main@%not._0 (xor main@%_not._0 true))
         (= main@%_.12_0 (ite main@%not._0 1 0))
         (= main@%.12_0 (+ main@%.01_0 main@%_.12_0))
         (= main@%_.1_0 (ite main@%_not._0 1 0))
         (= main@%.1_0 (+ main@%.0_0 main@%_.1_0))
         (= main@%_7_0 (+ main@%.12_0 main@%.1_0))
         (= main@%_8_0 (= main@%_7_0 main@%loop.bound_0))
         (= main@%_br_0 (+ main@%.12_0 1))
         (=> main@_.01_1 (and main@_.01_1 main@_.01_0))
         (=> (and main@_.01_1 main@_.01_0) (not main@%_8_0))
         (=> (and main@_.01_1 main@_.01_0) (= main@%.01_1 main@%_br_0))
         (=> (and main@_.01_1 main@_.01_0) (= main@%.0_1 main@%.1_0))
         (=> (and main@_.01_1 main@_.01_0) (= main@%.01_2 main@%.01_1))
         (=> (and main@_.01_1 main@_.01_0) (= main@%.0_2 main@%.0_1))
         main@_.01_1)
    (main@_.01 main@%.01_2 main@%.0_2 main@%loop.bound_0)))
(rule (=> (and (main@_.01 main@%.01_0 main@%.0_0 main@%loop.bound_0)
         true
         (= main@%_not._0 (> main@%.01_0 4))
         (= main@%not._0 (xor main@%_not._0 true))
         (= main@%_.12_0 (ite main@%not._0 1 0))
         (= main@%.12_0 (+ main@%.01_0 main@%_.12_0))
         (= main@%_.1_0 (ite main@%_not._0 1 0))
         (= main@%.1_0 (+ main@%.0_0 main@%_.1_0))
         (= main@%_7_0 (+ main@%.12_0 main@%.1_0))
         (= main@%_8_0 (= main@%_7_0 main@%loop.bound_0))
         (= main@%_br_0 (+ main@%.12_0 1))
         (=> main@_ret_0 (and main@_ret_0 main@_.01_0))
         (=> (and main@_ret_0 main@_.01_0) main@%_8_0)
         main@_ret_0)
    main@_ret))
(query main@_ret)
