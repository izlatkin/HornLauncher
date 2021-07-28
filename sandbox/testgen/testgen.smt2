(set-info :original "testgen.tmp3.bc")
(set-info :authors "SeaHorn v.10.0.0-rc0")
(declare-rel verifier.error (Bool Bool Bool ))
(declare-rel main@_loop.bound ())
(declare-rel main@_.03 (Int Int Int Int ))
(declare-rel main@_14 (Int Int Int Int ))
(declare-rel main@_16 (Int Int Int Int ))
(declare-rel main@_.25 (Int Int Int Int ))
(declare-rel main@_ret ())
(declare-rel main@empty.loop (Int Int Int Int ))
(declare-rel main@empty.loop.body (Int Int Int Int ))
(declare-var main@%_br5_0 Bool )
(declare-var main@%_17_0 Bool )
(declare-var main@%_spec.select_0 Int )
(declare-var main@%_10_0 Bool )
(declare-var main@%_.14_0 Int )
(declare-var main@%not._0 Bool )
(declare-var main@%_.12_0 Int )
(declare-var main@%_br3_0 Bool )
(declare-var main@%nd.loop.cond_0 Bool )
(declare-var main@%_call_0 Bool )
(declare-var main@%_3_0 Int )
(declare-var main@%_5_0 Int )
(declare-var main@%_7_0 Int )
(declare-var main@%loop.bound_0 Int )
(declare-var main@%_call1_0 Int )
(declare-var main@%_call2_0 Int )
(declare-var main@%_br_0 Int )
(declare-var main@%.03_0 Int )
(declare-var main@%.01_0 Int )
(declare-var main@%.0_0 Int )
(declare-var main@%.14_0 Int )
(declare-var main@%.12_0 Int )
(declare-var main@%_br4_0 Int )
(declare-var main@%.25_0 Int )
(declare-var main@%.2_0 Int )
(declare-var main@%.1_0 Int )
(declare-var main@%spec.select_0 Int )
(declare-var main@%spec.select6_0 Int )
(rule (verifier.error false false false))
(rule (verifier.error false true true))
(rule (verifier.error true false true))
(rule (verifier.error true true true))
(rule main@_loop.bound)
(rule (=> (and main@_loop.bound
         true
         (= main@%_call_0 (= main@%loop.bound_0 0))
         main@%_call_0
         (= main@%_call1_0 (+ main@%_3_0 4952))
         (= main@%_call2_0 (+ main@%_5_0 4972))
         (= main@%_br_0 (+ main@%_7_0 4992)))
    (main@empty.loop main@%loop.bound_0
                     main@%_call2_0
                     main@%_call1_0
                     main@%_br_0)))
(rule (=> (and (main@_.03 main@%loop.bound_0 main@%.03_0 main@%.01_0 main@%.0_0)
         true
         (= main@%_10_0 (> main@%.01_0 4))
         (= main@%_.14_0 (ite main@%_10_0 1 0))
         (= main@%.14_0 (+ main@%.03_0 main@%_.14_0))
         (= main@%not._0 (xor main@%_10_0 true))
         (= main@%_.12_0 (ite main@%not._0 1 0))
         (= main@%.12_0 (+ main@%.01_0 main@%_.12_0))
         (= main@%_br3_0 (< main@%.14_0 6))
         main@%_br3_0)
    (main@_14 main@%loop.bound_0 main@%.0_0 main@%.14_0 main@%.12_0)))
(rule (=> (and (main@_.03 main@%loop.bound_0 main@%.03_0 main@%.01_0 main@%.0_0)
         true
         (= main@%_10_0 (> main@%.01_0 4))
         (= main@%_.14_0 (ite main@%_10_0 1 0))
         (= main@%.14_0 (+ main@%.03_0 main@%_.14_0))
         (= main@%not._0 (xor main@%_10_0 true))
         (= main@%_.12_0 (ite main@%not._0 1 0))
         (= main@%.12_0 (+ main@%.01_0 main@%_.12_0))
         (= main@%_br3_0 (< main@%.14_0 6))
         (not main@%_br3_0))
    (main@_16 main@%loop.bound_0 main@%.0_0 main@%.14_0 main@%.12_0)))
(rule (=> (and (main@_14 main@%loop.bound_0 main@%.0_0 main@%.14_0 main@%.12_0)
         true
         (= main@%_br4_0 (+ main@%.0_0 1))
         (= main@%.25_0 main@%.14_0)
         (= main@%.2_0 main@%.12_0)
         (= main@%.1_0 main@%_br4_0))
    (main@_.25 main@%.1_0 main@%loop.bound_0 main@%.25_0 main@%.2_0)))
(rule (=> (and (main@_16 main@%loop.bound_0 main@%.0_0 main@%.14_0 main@%.12_0)
         true
         (= main@%_17_0 (> main@%.12_0 main@%.14_0))
         (= main@%_spec.select_0 (ite main@%_17_0 1 0))
         (= main@%spec.select_0 (+ main@%.14_0 main@%_spec.select_0))
         (= main@%spec.select6_0 (ite main@%_17_0 main@%.12_0 0))
         (= main@%.25_0 main@%spec.select_0)
         (= main@%.2_0 main@%spec.select6_0)
         (= main@%.1_0 main@%.0_0))
    (main@_.25 main@%.1_0 main@%loop.bound_0 main@%.25_0 main@%.2_0)))
(rule (=> (and (main@_.25 main@%.1_0 main@%loop.bound_0 main@%.25_0 main@%.2_0)
         true
         (= main@%_br5_0 (= main@%.1_0 main@%loop.bound_0))
         main@%_br5_0)
    main@_ret))
(rule (=> (and (main@_.25 main@%.1_0 main@%loop.bound_0 main@%.25_0 main@%.2_0)
         true
         (= main@%_br5_0 (= main@%.1_0 main@%loop.bound_0))
         (not main@%_br5_0)
         (= main@%.03_0 main@%.25_0)
         (= main@%.01_0 main@%.2_0)
         (= main@%.0_0 main@%.1_0))
    (main@_.03 main@%loop.bound_0 main@%.03_0 main@%.01_0 main@%.0_0)))
(rule (=> (and (main@empty.loop main@%loop.bound_0
                          main@%_call2_0
                          main@%_call1_0
                          main@%_br_0)
         true
         main@%nd.loop.cond_0)
    (main@empty.loop.body
      main@%loop.bound_0
      main@%_call2_0
      main@%_call1_0
      main@%_br_0)))
(rule (=> (and (main@empty.loop main@%loop.bound_0
                          main@%_call2_0
                          main@%_call1_0
                          main@%_br_0)
         true
         (not main@%nd.loop.cond_0)
         (= main@%.03_0 main@%_call2_0)
         (= main@%.01_0 main@%_call1_0)
         (= main@%.0_0 main@%_br_0))
    (main@_.03 main@%loop.bound_0 main@%.03_0 main@%.01_0 main@%.0_0)))
(rule (=> (main@empty.loop.body
      main@%loop.bound_0
      main@%_call2_0
      main@%_call1_0
      main@%_br_0)
    (main@empty.loop main@%loop.bound_0
                     main@%_call2_0
                     main@%_call1_0
                     main@%_br_0)))
(query main@_ret)

