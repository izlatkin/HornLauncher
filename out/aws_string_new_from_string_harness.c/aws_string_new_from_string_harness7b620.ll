; ModuleID = '../out/aws_string_new_from_string_harness.c/aws_string_new_from_string_harness7b620.bc.txt'
source_filename = "llvm-link"
target datalayout = "e-m:o-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:128-n8:16:32-S128"
target triple = "i386-apple-macosx11.0.0"

%struct.aws_allocator = type { i8* (%struct.aws_allocator*, i32)*, void (%struct.aws_allocator*, i8*)*, i8* (%struct.aws_allocator*, i8*, i32, i32)*, i8* (%struct.aws_allocator*, i32, i32)*, i8* }
%struct.aws_byte_cursor = type { i32, i8* }
%struct.aws_log_subject_info_list = type { %struct.aws_log_subject_info*, i32 }
%struct.aws_log_subject_info = type { i32, i8*, i8* }
%struct.aws_string = type { %struct.aws_allocator*, i32, [1 x i8] }

@default_allocator = internal global %struct.aws_allocator { i8* (%struct.aws_allocator*, i32)* @s_default_malloc, void (%struct.aws_allocator*, i8*)* @s_default_free, i8* (%struct.aws_allocator*, i8*, i32, i32)* @s_default_realloc, i8* (%struct.aws_allocator*, i32, i32)* @s_default_calloc, i8* null }, align 8
@s_null_terminator_cursor = internal unnamed_addr global %struct.aws_byte_cursor { i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4.26, i32 0, i32 0) }, align 8
@.str.4.26 = private unnamed_addr constant [2 x i8] zeroinitializer, align 1
@s_common_log_subject_list = internal unnamed_addr global %struct.aws_log_subject_info_list { %struct.aws_log_subject_info* getelementptr inbounds ([5 x %struct.aws_log_subject_info], [5 x %struct.aws_log_subject_info]* @s_common_log_subject_infos, i32 0, i32 0), i32 5 }, align 8
@s_common_log_subject_infos = internal global [5 x %struct.aws_log_subject_info] [%struct.aws_log_subject_info { i32 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([80 x i8], [80 x i8]* @.str.175, i32 0, i32 0) }, %struct.aws_log_subject_info { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.176, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.177, i32 0, i32 0) }, %struct.aws_log_subject_info { i32 2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.178, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.179, i32 0, i32 0) }, %struct.aws_log_subject_info { i32 3, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.180, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.181, i32 0, i32 0) }, %struct.aws_log_subject_info { i32 4, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.182, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.183, i32 0, i32 0) }], align 4
@.str.26 = private unnamed_addr constant [13 x i8] c"aws-c-common\00", align 1
@.str.175 = private unnamed_addr constant [80 x i8] c"Subject for aws-c-common logging that doesn't belong to any particular category\00", align 1
@.str.176 = private unnamed_addr constant [15 x i8] c"task-scheduler\00", align 1
@.str.177 = private unnamed_addr constant [53 x i8] c"Subject for task scheduler or task specific logging.\00", align 1
@.str.178 = private unnamed_addr constant [7 x i8] c"thread\00", align 1
@.str.179 = private unnamed_addr constant [46 x i8] c"Subject for logging thread related functions.\00", align 1
@.str.180 = private unnamed_addr constant [9 x i8] c"memtrace\00", align 1
@.str.181 = private unnamed_addr constant [44 x i8] c"Output from the aws_mem_trace_dump function\00", align 1
@.str.182 = private unnamed_addr constant [11 x i8] c"xml-parser\00", align 1
@.str.183 = private unnamed_addr constant [41 x i8] c"Subject for xml parser specific logging.\00", align 1
@llvm.used = appending global [4 x i8*] [i8* bitcast (void ()* @seahorn.fail to i8*), i8* bitcast (void (i1)* @verifier.assume to i8*), i8* bitcast (void (i1)* @verifier.assume.not to i8*), i8* bitcast (void ()* @verifier.error to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #0

declare %struct.aws_string* @ensure_string_is_allocated_nondet_length(...) local_unnamed_addr #1

; Function Attrs: inlinehint nounwind ssp uwtable
define internal fastcc zeroext i1 @aws_string_is_valid(%struct.aws_string* readonly %0) unnamed_addr #2 {
  tail call void @seahorn.fn.enter() #9
  %2 = icmp eq %struct.aws_string* %0, null
  br i1 %2, label %9, label %3

3:                                                ; preds = %1
  %4 = getelementptr inbounds %struct.aws_string, %struct.aws_string* %0, i32 0, i32 1
  %5 = load i32, i32* %4, align 4, !tbaa !5
  %6 = getelementptr inbounds %struct.aws_string, %struct.aws_string* %0, i32 0, i32 2, i32 %5
  %7 = load i8, i8* %6, align 1, !tbaa !11
  %8 = icmp eq i8 %7, 0
  br label %9

9:                                                ; preds = %3, %1
  %10 = phi i1 [ false, %1 ], [ %8, %3 ]
  ret i1 %10
}

declare void @assert_bytes_match(i8*, i8*, i32) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #0

; Function Attrs: nounwind ssp uwtable
define internal fastcc void @aws_default_allocator() unnamed_addr #3 {
  tail call void @seahorn.fn.enter() #9
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal i8* @s_default_malloc(%struct.aws_allocator* nocapture readnone %0, i32 %1) #3 {
  tail call void @seahorn.fn.enter() #9
  %3 = alloca i8*, align 4
  %4 = icmp ugt i32 %1, 4096
  %5 = select i1 %4, i32 32, i32 8
  %6 = bitcast i8** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6) #9
  store i8* null, i8** %3, align 4, !tbaa !12
  %7 = call i32 @posix_memalign(i8** nonnull %3, i32 %5, i32 %1) #9
  %8 = icmp eq i32 %7, 0
  %9 = load i8*, i8** %3, align 4
  %10 = select i1 %8, i8* %9, i8* null
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6) #9
  ret i8* %10
}

; Function Attrs: nounwind ssp uwtable
define internal void @s_default_free(%struct.aws_allocator* nocapture readnone %0, i8* nocapture %1) #3 {
  tail call void @seahorn.fn.enter() #9
  tail call void @free(i8* %1)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define internal i8* @s_default_realloc(%struct.aws_allocator* nocapture readnone %0, i8* %1, i32 %2, i32 %3) #3 {
  %5 = alloca i8*, align 4
  tail call void @seahorn.fn.enter() #9
  %6 = icmp ne i32 %3, 0
  %7 = icmp ne i8* %1, null
  %or.cond = and i1 %7, %6
  br i1 %or.cond, label %9, label %8

8:                                                ; preds = %4
  tail call void @free(i8* %1)
  br label %21

9:                                                ; preds = %4
  %10 = icmp ugt i32 %3, %2
  br i1 %10, label %11, label %21

11:                                               ; preds = %9
  tail call void @seahorn.fn.enter() #9
  %12 = icmp ugt i32 %3, 4096
  %13 = select i1 %12, i32 32, i32 8
  %14 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %14) #9
  store i8* null, i8** %5, align 4, !tbaa !12
  %15 = call i32 @posix_memalign(i8** nonnull %5, i32 %13, i32 %3) #9
  %16 = icmp ne i32 %15, 0
  %17 = load i8*, i8** %5, align 4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %14) #9
  %18 = icmp eq i8* %17, null
  %19 = or i1 %16, %18
  br i1 %19, label %21, label %20

20:                                               ; preds = %11
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %17, i8* nonnull align 1 %1, i32 %2, i1 false) #9
  call void @seahorn.fn.enter() #9
  call void @free(i8* nonnull %1) #9
  br label %21

21:                                               ; preds = %20, %11, %9, %8
  %.0 = phi i8* [ null, %8 ], [ %1, %9 ], [ null, %11 ], [ %17, %20 ]
  ret i8* %.0
}

; Function Attrs: nounwind ssp uwtable
define internal i8* @s_default_calloc(%struct.aws_allocator* nocapture readnone %0, i32 %1, i32 %2) #3 {
  %4 = alloca i8*, align 4
  tail call void @seahorn.fn.enter() #9
  %5 = mul i32 %2, %1
  tail call void @seahorn.fn.enter() #9
  %6 = icmp ugt i32 %5, 4096
  %7 = select i1 %6, i32 32, i32 8
  %8 = bitcast i8** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #9
  store i8* null, i8** %4, align 4, !tbaa !12
  %9 = call i32 @posix_memalign(i8** nonnull %4, i32 %7, i32 %5) #9
  %10 = icmp eq i32 %9, 0
  %11 = load i8*, i8** %4, align 4
  %12 = select i1 %10, i8* %11, i8* null
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #9
  %13 = icmp eq i8* %12, null
  br i1 %13, label %15, label %14

14:                                               ; preds = %3
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 %12, i8 0, i32 %5, i1 false) #9
  br label %15

15:                                               ; preds = %14, %3
  ret i8* %12
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #4

; Function Attrs: nofree
declare i32 @posix_memalign(i8**, i32, i32) local_unnamed_addr #5

; Function Attrs: nounwind ssp uwtable
define internal fastcc %struct.aws_string* @aws_string_new_from_string(%struct.aws_allocator* %0, %struct.aws_string* %1) unnamed_addr #3 {
  tail call void @seahorn.fn.enter() #9
  %3 = getelementptr inbounds %struct.aws_string, %struct.aws_string* %1, i32 0, i32 2, i32 0
  %4 = getelementptr inbounds %struct.aws_string, %struct.aws_string* %1, i32 0, i32 1
  %5 = load i32, i32* %4, align 4, !tbaa !5
  tail call void @seahorn.fn.enter() #9
  tail call void @seahorn.fn.enter() #9
  tail call void @seahorn.fn.enter() #9
  %6 = icmp ugt i32 %5, -14
  br i1 %6, label %aws_add_size_checked.42.exit.i, label %7

aws_add_size_checked.42.exit.i:                   ; preds = %2
  tail call void @seahorn.fn.enter() #9
  tail call void @seahorn.fn.enter() #9
  br label %aws_string_new_from_array.exit

7:                                                ; preds = %2
  %8 = add nuw i32 %5, 13
  tail call void @seahorn.fn.enter() #9
  %9 = icmp eq %struct.aws_allocator* %0, null
  tail call void @verifier.assume.not(i1 %9) #9
  %10 = getelementptr inbounds %struct.aws_allocator, %struct.aws_allocator* %0, i32 0, i32 0
  %11 = load i8* (%struct.aws_allocator*, i32)*, i8* (%struct.aws_allocator*, i32)** %10, align 4, !tbaa !13
  %12 = icmp eq i8* (%struct.aws_allocator*, i32)* %11, null
  tail call void @verifier.assume.not(i1 %12) #9
  tail call void @verifier.assume.not(i1 false) #9
  %13 = tail call i8* %11(%struct.aws_allocator* nonnull %0, i32 %8) #9
  %14 = icmp eq i8* %13, null
  br i1 %14, label %aws_mem_acquire.exit.thread.i, label %15

aws_mem_acquire.exit.thread.i:                    ; preds = %7
  tail call void @seahorn.fn.enter() #9
  tail call void @seahorn.fn.enter() #9
  br label %aws_string_new_from_array.exit

15:                                               ; preds = %7
  %16 = bitcast i8* %13 to %struct.aws_string*
  %17 = bitcast i8* %13 to %struct.aws_allocator**
  store %struct.aws_allocator* %0, %struct.aws_allocator** %17, align 4, !tbaa !12
  %18 = getelementptr inbounds i8, i8* %13, i32 4
  %19 = bitcast i8* %18 to i32*
  store i32 %5, i32* %19, align 4, !tbaa !15
  %20 = icmp eq i32 %5, 0
  br i1 %20, label %23, label %21

21:                                               ; preds = %15
  %22 = getelementptr inbounds i8, i8* %13, i32 8
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %22, i8* nonnull align 1 %3, i32 %5, i1 false) #9
  br label %23

23:                                               ; preds = %21, %15
  %24 = getelementptr inbounds i8, i8* %13, i32 8
  %25 = getelementptr inbounds i8, i8* %24, i32 %5
  store i8 0, i8* %25, align 1, !tbaa !11
  br label %aws_string_new_from_array.exit

aws_string_new_from_array.exit:                   ; preds = %aws_add_size_checked.42.exit.i, %aws_mem_acquire.exit.thread.i, %23
  %.1.i = phi %struct.aws_string* [ null, %aws_add_size_checked.42.exit.i ], [ %16, %23 ], [ null, %aws_mem_acquire.exit.thread.i ]
  ret %struct.aws_string* %.1.i
}

; Function Attrs: inaccessiblememonly nofree norecurse nounwind
declare void @verifier.assume(i1) #6

; Function Attrs: inaccessiblememonly nofree norecurse nounwind
declare void @verifier.assume.not(i1) #6

; Function Attrs: inaccessiblememonly nofree norecurse nounwind
declare void @seahorn.fail() #6

; Function Attrs: inaccessiblememonly nofree norecurse noreturn nounwind
declare void @verifier.error() #7

; Function Attrs: inaccessiblememonly
declare void @seahorn.fn.enter() local_unnamed_addr #8

define i32 @main() local_unnamed_addr {
entry:
  store i8* (%struct.aws_allocator*, i32)* @s_default_malloc, i8* (%struct.aws_allocator*, i32)** getelementptr inbounds (%struct.aws_allocator, %struct.aws_allocator* @default_allocator, i32 0, i32 0), align 8
  store void (%struct.aws_allocator*, i8*)* @s_default_free, void (%struct.aws_allocator*, i8*)** getelementptr inbounds (%struct.aws_allocator, %struct.aws_allocator* @default_allocator, i32 0, i32 1), align 4
  store i8* (%struct.aws_allocator*, i8*, i32, i32)* @s_default_realloc, i8* (%struct.aws_allocator*, i8*, i32, i32)** getelementptr inbounds (%struct.aws_allocator, %struct.aws_allocator* @default_allocator, i32 0, i32 2), align 8
  store i8* (%struct.aws_allocator*, i32, i32)* @s_default_calloc, i8* (%struct.aws_allocator*, i32, i32)** getelementptr inbounds (%struct.aws_allocator, %struct.aws_allocator* @default_allocator, i32 0, i32 3), align 4
  store i8* null, i8** getelementptr inbounds (%struct.aws_allocator, %struct.aws_allocator* @default_allocator, i32 0, i32 4), align 8
  store i32 1, i32* getelementptr inbounds (%struct.aws_byte_cursor, %struct.aws_byte_cursor* @s_null_terminator_cursor, i32 0, i32 0), align 8
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4.26, i32 0, i32 0), i8** getelementptr inbounds (%struct.aws_byte_cursor, %struct.aws_byte_cursor* @s_null_terminator_cursor, i32 0, i32 1), align 4
  store %struct.aws_log_subject_info* getelementptr inbounds ([5 x %struct.aws_log_subject_info], [5 x %struct.aws_log_subject_info]* @s_common_log_subject_infos, i32 0, i32 0), %struct.aws_log_subject_info** getelementptr inbounds (%struct.aws_log_subject_info_list, %struct.aws_log_subject_info_list* @s_common_log_subject_list, i32 0, i32 0), align 8
  store i32 5, i32* getelementptr inbounds (%struct.aws_log_subject_info_list, %struct.aws_log_subject_info_list* @s_common_log_subject_list, i32 0, i32 1), align 4
  tail call void @seahorn.fn.enter()
  %0 = tail call i1 @nondet.bool()
  tail call void @verifier.assume.not(i1 %0)
  tail call void @seahorn.fn.enter() #9
  %1 = tail call %struct.aws_string* bitcast (%struct.aws_string* (...)* @ensure_string_is_allocated_nondet_length to %struct.aws_string* ()*)() #9
  %2 = tail call fastcc zeroext i1 @aws_string_is_valid(%struct.aws_string* %1) #9
  tail call void @verifier.assume(i1 %2) #9
  %3 = getelementptr inbounds %struct.aws_string, %struct.aws_string* %1, i32 0, i32 0
  %4 = load %struct.aws_allocator*, %struct.aws_allocator** %3, align 4, !tbaa !16
  %5 = icmp eq %struct.aws_allocator* %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %entry
  tail call fastcc void @aws_default_allocator() #9
  br label %7

7:                                                ; preds = %entry, %6
  %8 = phi %struct.aws_allocator* [ @default_allocator, %6 ], [ %4, %entry ]
  %9 = tail call fastcc %struct.aws_string* @aws_string_new_from_string(%struct.aws_allocator* nonnull %8, %struct.aws_string* %1) #9
  %10 = icmp eq %struct.aws_string* %9, null
  br i1 %10, label %29, label %11

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.aws_string, %struct.aws_string* %1, i32 0, i32 1
  %13 = load i32, i32* %12, align 4, !tbaa !5
  %14 = getelementptr inbounds %struct.aws_string, %struct.aws_string* %9, i32 0, i32 1
  %15 = load i32, i32* %14, align 4, !tbaa !5
  %16 = icmp eq i32 %13, %15
  br i1 %16, label %17, label %verifier.error

17:                                               ; preds = %11
  %18 = getelementptr inbounds %struct.aws_string, %struct.aws_string* %9, i32 0, i32 0
  %19 = load %struct.aws_allocator*, %struct.aws_allocator** %18, align 4, !tbaa !16
  %20 = icmp eq %struct.aws_allocator* %19, %8
  br i1 %20, label %21, label %verifier.error

21:                                               ; preds = %17
  %22 = getelementptr inbounds %struct.aws_string, %struct.aws_string* %9, i32 0, i32 2, i32 %13
  %23 = load i8, i8* %22, align 1, !tbaa !11
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %25, label %verifier.error

25:                                               ; preds = %21
  %26 = getelementptr inbounds %struct.aws_string, %struct.aws_string* %1, i32 0, i32 2, i32 0
  %27 = getelementptr inbounds %struct.aws_string, %struct.aws_string* %9, i32 0, i32 2, i32 0
  tail call void @assert_bytes_match(i8* nonnull %26, i8* nonnull %27, i32 %13) #9
  %28 = tail call fastcc zeroext i1 @aws_string_is_valid(%struct.aws_string* nonnull %9) #9
  br i1 %28, label %29, label %verifier.error

29:                                               ; preds = %25, %7
  %30 = tail call fastcc zeroext i1 @aws_string_is_valid(%struct.aws_string* %1) #9
  tail call void @verifier.assume.not(i1 %30)
  br label %verifier.error

verifier.error:                                   ; preds = %25, %21, %17, %11, %29
  tail call void @seahorn.fail()
  ret i32 42
}

declare i1 @nondet.bool() local_unnamed_addr

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #0

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #0

attributes #0 = { argmemonly nounwind willreturn }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { inaccessiblememonly nofree norecurse nounwind }
attributes #7 = { inaccessiblememonly nofree norecurse noreturn nounwind }
attributes #8 = { inaccessiblememonly }
attributes #9 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4}

!0 = !{!"Apple clang version 12.0.5 (clang-1205.0.22.9)"}
!1 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 3]}
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 7, !"PIC Level", i32 2}
!5 = !{!6, !10, i64 4}
!6 = !{!"aws_string", !7, i64 0, !10, i64 4, !8, i64 8}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"long", !8, i64 0}
!11 = !{!8, !8, i64 0}
!12 = !{!7, !7, i64 0}
!13 = !{!14, !7, i64 0}
!14 = !{!"aws_allocator", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !7, i64 16}
!15 = !{!10, !10, i64 0}
!16 = !{!6, !7, i64 0}