(set-info :original "testgen.tmp3.bc")
(set-info :authors "SeaHorn v.10.0.0-rc0")
(declare-rel verifier.error (Bool Bool Bool ))
(declare-rel main@_loop.bound ())
(declare-rel main@_.01 (Int Int Int ))
(declare-rel main@_ret ())
(declare-rel main@empty.loop (Int Int ))
(declare-rel main@empty.loop.body (Int Int ))
(declare-var main@%_6_0 Int )
(declare-var main@%_7_0 Int )
(declare-var main@%_.12_0 Bool )
(declare-var main@%.12_0 Int )
(declare-var main@%not._0 Bool )
(declare-var main@%_.1_0 Int )
(declare-var main@%_10_0 Bool )
(declare-var main@%_not.5_0 Bool )
(declare-var main@%not.5_0 Bool )
(declare-var main@%narrow_0 Bool )
(declare-var main@%spec.select_0 Int )
(declare-var main@%nd.loop.cond_0 Bool )
(declare-var main@%_call_0 Bool )
(declare-var main@%_3_0 Int )
(declare-var main@%loop.bound_0 Int )
(declare-var main@%_br_0 Int )
(declare-var main@%.01_0 Int )
(declare-var main@%.0_0 Int )
(declare-var main@%.1_0 Int )
(declare-var main@%.3_0 Int )
(declare-var main@%.01_1 Int )
(declare-var main@%.0_1 Int )
(rule (verifier.error false false false))
(rule (verifier.error false true true))
(rule (verifier.error true false true))
(rule (verifier.error true true true))
(rule main@_loop.bound)
(rule (=> (and main@_loop.bound
         true
         (= main@%_call_0 (= main@%loop.bound_0 5))
         main@%_call_0
         (= main@%_br_0 (+ main@%_3_0 4924)))
    (main@empty.loop main@%loop.bound_0 main@%_br_0)))
(rule (=> (and (main@_.01 main@%.01_0 main@%.0_0 main@%loop.bound_0)
         true
         (= main@%_7_0 (+ main@%_6_0 9413))
         (= main@%_.12_0 (= main@%_7_0 0))
         (= main@%.12_0 (ite main@%_.12_0 0 main@%.01_0))
         (= main@%not._0 (xor main@%_.12_0 true))
         (= main@%_.1_0 (ite main@%not._0 1 0))
         (= main@%.1_0 (+ main@%.0_0 main@%_.1_0))
         (= main@%_10_0 (> main@%.1_0 main@%loop.bound_0))
         (= main@%_not.5_0 (= main@%.12_0 0))
         (= main@%not.5_0 (xor main@%_10_0 true))
         (= main@%narrow_0 (and main@%_not.5_0 main@%not.5_0))
         (= main@%spec.select_0 (ite main@%narrow_0 1 0))
         (= main@%.3_0 (+ main@%.12_0 main@%spec.select_0))
         main@%_10_0)
    main@_ret))
(rule (=> (and (main@_.01 main@%.01_0 main@%.0_0 main@%loop.bound_0)
         true
         (= main@%_7_0 (+ main@%_6_0 9413))
         (= main@%_.12_0 (= main@%_7_0 0))
         (= main@%.12_0 (ite main@%_.12_0 0 main@%.01_0))
         (= main@%not._0 (xor main@%_.12_0 true))
         (= main@%_.1_0 (ite main@%not._0 1 0))
         (= main@%.1_0 (+ main@%.0_0 main@%_.1_0))
         (= main@%_10_0 (> main@%.1_0 main@%loop.bound_0))
         (= main@%_not.5_0 (= main@%.12_0 0))
         (= main@%not.5_0 (xor main@%_10_0 true))
         (= main@%narrow_0 (and main@%_not.5_0 main@%not.5_0))
         (= main@%spec.select_0 (ite main@%narrow_0 1 0))
         (= main@%.3_0 (+ main@%.12_0 main@%spec.select_0))
         (not main@%_10_0)
         (= main@%.01_1 main@%.3_0)
         (= main@%.0_1 main@%.1_0))
    (main@_.01 main@%.01_1 main@%.0_1 main@%loop.bound_0)))
(rule (=> (and (main@empty.loop main@%loop.bound_0 main@%_br_0)
         true
         main@%nd.loop.cond_0)
    (main@empty.loop.body main@%loop.bound_0 main@%_br_0)))
(rule (=> (and (main@empty.loop main@%loop.bound_0 main@%_br_0)
         true
         (not main@%nd.loop.cond_0)
         (= main@%.01_0 main@%_br_0)
         (= main@%.0_0 0))
    (main@_.01 main@%.01_0 main@%.0_0 main@%loop.bound_0)))
(rule (=> (main@empty.loop.body main@%loop.bound_0 main@%_br_0)
    (main@empty.loop main@%loop.bound_0 main@%_br_0)))
(query main@_ret)

