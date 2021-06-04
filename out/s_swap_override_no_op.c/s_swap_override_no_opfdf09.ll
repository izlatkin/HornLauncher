; ModuleID = '../out/s_swap_override_no_op.c/s_swap_override_no_opfdf09.bc.txt'
source_filename = "/tmp/aws-c-common/verification/cbmc/stubs/s_swap_override_no_op.c"
target datalayout = "e-m:o-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:128-n8:16:32-S128"
target triple = "i386-apple-macosx11.0.0"

%struct.aws_priority_queue = type { i32 (i8*, i8*)*, %struct.aws_array_list, %struct.aws_array_list }
%struct.aws_array_list = type { %struct.aws_allocator*, i32, i32, i32, i8* }
%struct.aws_allocator = type { i8* (%struct.aws_allocator*, i32)*, void (%struct.aws_allocator*, i8*)*, i8* (%struct.aws_allocator*, i8*, i32, i32)*, i8* (%struct.aws_allocator*, i32, i32)*, i8* }

@llvm.used = appending global [4 x i8*] [i8* bitcast (void ()* @seahorn.fail to i8*), i8* bitcast (void (i1)* @verifier.assume to i8*), i8* bitcast (void (i1)* @verifier.assume.not to i8*), i8* bitcast (void ()* @verifier.error to i8*)], section "llvm.metadata"

declare zeroext i1 @aws_priority_queue_is_valid(%struct.aws_priority_queue*) local_unnamed_addr #0

declare zeroext i1 @aws_priority_queue_backpointer_index_valid(%struct.aws_priority_queue*, i32) local_unnamed_addr #0

declare %struct.aws_priority_queue* @verifier.nondet.1() local_unnamed_addr

declare i32 @verifier.nondet.2() local_unnamed_addr

; Function Attrs: inaccessiblememonly nofree norecurse nounwind
declare void @verifier.assume(i1) #1

; Function Attrs: inaccessiblememonly nofree norecurse nounwind
declare void @verifier.assume.not(i1) #1

; Function Attrs: inaccessiblememonly nofree norecurse nounwind
declare void @seahorn.fail() #1

; Function Attrs: inaccessiblememonly nofree norecurse noreturn nounwind
declare void @verifier.error() #2

; Function Attrs: inaccessiblememonly
declare void @seahorn.fn.enter() local_unnamed_addr #3

define i32 @main() local_unnamed_addr {
entry:
  tail call void @seahorn.fn.enter()
  %0 = tail call %struct.aws_priority_queue* @verifier.nondet.1()
  %1 = tail call i32 @verifier.nondet.2()
  %2 = tail call i32 @verifier.nondet.2()
  %3 = tail call i1 @nondet.bool()
  tail call void @verifier.assume.not(i1 %3)
  tail call void @seahorn.fn.enter() #4
  %4 = tail call zeroext i1 @aws_priority_queue_is_valid(%struct.aws_priority_queue* %0) #4
  br i1 %4, label %5, label %verifier.error

5:                                                ; preds = %entry
  %6 = getelementptr inbounds %struct.aws_priority_queue, %struct.aws_priority_queue* %0, i32 0, i32 1, i32 2
  %7 = load i32, i32* %6, align 4, !tbaa !5
  %8 = icmp ugt i32 %7, %1
  %9 = icmp ugt i32 %7, %2
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %10, label %verifier.error

10:                                               ; preds = %5
  %11 = tail call zeroext i1 @aws_priority_queue_backpointer_index_valid(%struct.aws_priority_queue* nonnull %0, i32 %1) #4
  br i1 %11, label %12, label %verifier.error

12:                                               ; preds = %10
  %13 = tail call zeroext i1 @aws_priority_queue_backpointer_index_valid(%struct.aws_priority_queue* nonnull %0, i32 %2) #4
  br i1 %13, label %14, label %verifier.error

14:                                               ; preds = %12
  %15 = getelementptr inbounds %struct.aws_priority_queue, %struct.aws_priority_queue* %0, i32 0, i32 2, i32 4
  %16 = load i8*, i8** %15, align 4, !tbaa !12
  %17 = icmp eq i8* %16, null
  tail call void @verifier.assume.not(i1 %17)
  %18 = getelementptr inbounds %struct.aws_priority_queue, %struct.aws_priority_queue* %0, i32 0, i32 2, i32 2
  %19 = load i32, i32* %18, align 4, !tbaa !13
  %20 = icmp ugt i32 %19, %1
  br i1 %20, label %21, label %verifier.error

21:                                               ; preds = %14
  %22 = icmp ugt i32 %19, %2
  tail call void @verifier.assume.not(i1 %22)
  br label %verifier.error

verifier.error:                                   ; preds = %14, %12, %10, %5, %entry, %21
  tail call void @seahorn.fail()
  ret i32 42
}

declare i1 @nondet.bool() local_unnamed_addr

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inaccessiblememonly nofree norecurse nounwind }
attributes #2 = { inaccessiblememonly nofree norecurse noreturn nounwind }
attributes #3 = { inaccessiblememonly }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 3]}
!1 = !{i32 1, !"NumRegisterParameters", i32 0}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"PIC Level", i32 2}
!4 = !{!"Apple clang version 12.0.5 (clang-1205.0.22.9)"}
!5 = !{!6, !11, i64 12}
!6 = !{!"aws_priority_queue", !7, i64 0, !10, i64 4, !10, i64 24}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"aws_array_list", !7, i64 0, !11, i64 4, !11, i64 8, !11, i64 12, !7, i64 16}
!11 = !{!"long", !8, i64 0}
!12 = !{!6, !7, i64 40}
!13 = !{!6, !11, i64 32}
