; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_12_bad() #0 !dbg !27 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %structCharVoid8 = alloca %struct._charVoid*, align 8
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !30
  %tobool = icmp ne i32 %call, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !33, metadata !DIExpression()), !dbg !36
  %call1 = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !37
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !38
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !36
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !39
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !41
  br i1 %cmp, label %if.then2, label %if.end, !dbg !42

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !45
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !46
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !47
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !48
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !49
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !49
  %5 = bitcast i8* %4 to i32*, !dbg !50
  call void @printWLine(i32* %5), !dbg !51
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !52
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !53
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !54
  %7 = bitcast i32* %arraydecay to i8*, !dbg !54
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !54
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !55
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !56
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !55
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !58
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !59
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay6), !dbg !60
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !61
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !62
  %11 = load i8*, i8** %voidSecond7, align 8, !dbg !62
  %12 = bitcast i8* %11 to i32*, !dbg !63
  call void @printWLine(i32* %12), !dbg !64
  br label %if.end22, !dbg !65

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid8, metadata !66, metadata !DIExpression()), !dbg !69
  %call9 = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !70
  %13 = bitcast i8* %call9 to %struct._charVoid*, !dbg !71
  store %struct._charVoid* %13, %struct._charVoid** %structCharVoid8, align 8, !dbg !69
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !72
  %cmp10 = icmp eq %struct._charVoid* %14, null, !dbg !74
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !75

if.then11:                                        ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !76
  unreachable, !dbg !76

if.end12:                                         ; preds = %if.else
  %15 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !78
  %voidSecond13 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %15, i32 0, i32 1, !dbg !79
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond13, align 8, !dbg !80
  %16 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !81
  %voidSecond14 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %16, i32 0, i32 1, !dbg !82
  %17 = load i8*, i8** %voidSecond14, align 8, !dbg !82
  %18 = bitcast i8* %17 to i32*, !dbg !83
  call void @printWLine(i32* %18), !dbg !84
  %19 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !85
  %charFirst15 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %19, i32 0, i32 0, !dbg !86
  %arraydecay16 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst15, i64 0, i64 0, !dbg !87
  %20 = bitcast i32* %arraydecay16 to i8*, !dbg !87
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %20, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !87
  %21 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !88
  %charFirst17 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %21, i32 0, i32 0, !dbg !89
  %arrayidx18 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst17, i64 0, i64 15, !dbg !88
  store i32 0, i32* %arrayidx18, align 4, !dbg !90
  %22 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !91
  %charFirst19 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %22, i32 0, i32 0, !dbg !92
  %arraydecay20 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst19, i64 0, i64 0, !dbg !91
  call void @printWLine(i32* %arraydecay20), !dbg !93
  %23 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !94
  %voidSecond21 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %23, i32 0, i32 1, !dbg !95
  %24 = load i8*, i8** %voidSecond21, align 8, !dbg !95
  %25 = bitcast i8* %24 to i32*, !dbg !96
  call void @printWLine(i32* %25), !dbg !97
  br label %if.end22

if.end22:                                         ; preds = %if.end12, %if.end
  ret void, !dbg !98
}

declare dso_local i32 @globalReturnsTrueOrFalse(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printWLine(i32*) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_12_good() #0 !dbg !99 {
entry:
  call void @good1(), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !102 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !108, metadata !DIExpression()), !dbg !109
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !110, metadata !DIExpression()), !dbg !111
  %call = call i64 @time(i64* null) #6, !dbg !112
  %conv = trunc i64 %call to i32, !dbg !113
  call void @srand(i32 %conv) #6, !dbg !114
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_12_good(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !118
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_12_bad(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  ret i32 0, !dbg !121
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !122 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %structCharVoid8 = alloca %struct._charVoid*, align 8
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !123
  %tobool = icmp ne i32 %call, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.else, !dbg !125

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !126, metadata !DIExpression()), !dbg !129
  %call1 = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !130
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !131
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !129
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !132
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !134
  br i1 %cmp, label %if.then2, label %if.end, !dbg !135

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !138
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !139
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !140
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !141
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !142
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !142
  %5 = bitcast i8* %4 to i32*, !dbg !143
  call void @printWLine(i32* %5), !dbg !144
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !145
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !146
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !147
  %7 = bitcast i32* %arraydecay to i8*, !dbg !147
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !147
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !148
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !149
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !148
  store i32 0, i32* %arrayidx, align 4, !dbg !150
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !151
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !152
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !151
  call void @printWLine(i32* %arraydecay6), !dbg !153
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !154
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !155
  %11 = load i8*, i8** %voidSecond7, align 8, !dbg !155
  %12 = bitcast i8* %11 to i32*, !dbg !156
  call void @printWLine(i32* %12), !dbg !157
  br label %if.end22, !dbg !158

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid8, metadata !159, metadata !DIExpression()), !dbg !162
  %call9 = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !163
  %13 = bitcast i8* %call9 to %struct._charVoid*, !dbg !164
  store %struct._charVoid* %13, %struct._charVoid** %structCharVoid8, align 8, !dbg !162
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !165
  %cmp10 = icmp eq %struct._charVoid* %14, null, !dbg !167
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !168

if.then11:                                        ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !169
  unreachable, !dbg !169

if.end12:                                         ; preds = %if.else
  %15 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !171
  %voidSecond13 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %15, i32 0, i32 1, !dbg !172
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond13, align 8, !dbg !173
  %16 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !174
  %voidSecond14 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %16, i32 0, i32 1, !dbg !175
  %17 = load i8*, i8** %voidSecond14, align 8, !dbg !175
  %18 = bitcast i8* %17 to i32*, !dbg !176
  call void @printWLine(i32* %18), !dbg !177
  %19 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !178
  %charFirst15 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %19, i32 0, i32 0, !dbg !179
  %arraydecay16 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst15, i64 0, i64 0, !dbg !180
  %20 = bitcast i32* %arraydecay16 to i8*, !dbg !180
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %20, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !180
  %21 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !181
  %charFirst17 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %21, i32 0, i32 0, !dbg !182
  %arrayidx18 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst17, i64 0, i64 15, !dbg !181
  store i32 0, i32* %arrayidx18, align 4, !dbg !183
  %22 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !184
  %charFirst19 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %22, i32 0, i32 0, !dbg !185
  %arraydecay20 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst19, i64 0, i64 0, !dbg !184
  call void @printWLine(i32* %arraydecay20), !dbg !186
  %23 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !187
  %voidSecond21 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %23, i32 0, i32 1, !dbg !188
  %24 = load i8*, i8** %voidSecond21, align 8, !dbg !188
  %25 = bitcast i8* %24 to i32*, !dbg !189
  call void @printWLine(i32* %25), !dbg !190
  br label %if.end22

if.end22:                                         ; preds = %if.end12, %if.end
  ret void, !dbg !191
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_12.c", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !6, line: 24, size: 640, elements: !8)
!8 = !{!9, !16, !18}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !7, file: !6, line: 26, baseType: !10, size: 512)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 512, elements: !14)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 74, baseType: !13)
!12 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{!15}
!15 = !DISubrange(count: 16)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !7, file: !6, line: 27, baseType: !17, size: 64, offset: 512)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !7, file: !6, line: 28, baseType: !17, size: 64, offset: 576)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!20 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!21 = !{i32 7, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{i32 7, !"uwtable", i32 1}
!25 = !{i32 7, !"frame-pointer", i32 2}
!26 = !{!"clang version 13.0.0"}
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_12_bad", scope: !6, file: !6, line: 33, type: !28, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocation(line: 35, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !6, line: 35, column: 8)
!32 = !DILocation(line: 35, column: 8, scope: !27)
!33 = !DILocalVariable(name: "structCharVoid", scope: !34, file: !6, line: 38, type: !4)
!34 = distinct !DILexicalBlock(scope: !35, file: !6, line: 37, column: 9)
!35 = distinct !DILexicalBlock(scope: !31, file: !6, line: 36, column: 5)
!36 = !DILocation(line: 38, column: 24, scope: !34)
!37 = !DILocation(line: 38, column: 53, scope: !34)
!38 = !DILocation(line: 38, column: 41, scope: !34)
!39 = !DILocation(line: 39, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !6, line: 39, column: 17)
!41 = !DILocation(line: 39, column: 32, scope: !40)
!42 = !DILocation(line: 39, column: 17, scope: !34)
!43 = !DILocation(line: 39, column: 42, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !6, line: 39, column: 41)
!45 = !DILocation(line: 40, column: 13, scope: !34)
!46 = !DILocation(line: 40, column: 29, scope: !34)
!47 = !DILocation(line: 40, column: 40, scope: !34)
!48 = !DILocation(line: 42, column: 35, scope: !34)
!49 = !DILocation(line: 42, column: 51, scope: !34)
!50 = !DILocation(line: 42, column: 24, scope: !34)
!51 = !DILocation(line: 42, column: 13, scope: !34)
!52 = !DILocation(line: 44, column: 21, scope: !34)
!53 = !DILocation(line: 44, column: 37, scope: !34)
!54 = !DILocation(line: 44, column: 13, scope: !34)
!55 = !DILocation(line: 45, column: 13, scope: !34)
!56 = !DILocation(line: 45, column: 29, scope: !34)
!57 = !DILocation(line: 45, column: 94, scope: !34)
!58 = !DILocation(line: 46, column: 35, scope: !34)
!59 = !DILocation(line: 46, column: 51, scope: !34)
!60 = !DILocation(line: 46, column: 13, scope: !34)
!61 = !DILocation(line: 47, column: 35, scope: !34)
!62 = !DILocation(line: 47, column: 51, scope: !34)
!63 = !DILocation(line: 47, column: 24, scope: !34)
!64 = !DILocation(line: 47, column: 13, scope: !34)
!65 = !DILocation(line: 49, column: 5, scope: !35)
!66 = !DILocalVariable(name: "structCharVoid", scope: !67, file: !6, line: 53, type: !4)
!67 = distinct !DILexicalBlock(scope: !68, file: !6, line: 52, column: 9)
!68 = distinct !DILexicalBlock(scope: !31, file: !6, line: 51, column: 5)
!69 = !DILocation(line: 53, column: 24, scope: !67)
!70 = !DILocation(line: 53, column: 53, scope: !67)
!71 = !DILocation(line: 53, column: 41, scope: !67)
!72 = !DILocation(line: 54, column: 17, scope: !73)
!73 = distinct !DILexicalBlock(scope: !67, file: !6, line: 54, column: 17)
!74 = !DILocation(line: 54, column: 32, scope: !73)
!75 = !DILocation(line: 54, column: 17, scope: !67)
!76 = !DILocation(line: 54, column: 42, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !6, line: 54, column: 41)
!78 = !DILocation(line: 55, column: 13, scope: !67)
!79 = !DILocation(line: 55, column: 29, scope: !67)
!80 = !DILocation(line: 55, column: 40, scope: !67)
!81 = !DILocation(line: 57, column: 35, scope: !67)
!82 = !DILocation(line: 57, column: 51, scope: !67)
!83 = !DILocation(line: 57, column: 24, scope: !67)
!84 = !DILocation(line: 57, column: 13, scope: !67)
!85 = !DILocation(line: 59, column: 21, scope: !67)
!86 = !DILocation(line: 59, column: 37, scope: !67)
!87 = !DILocation(line: 59, column: 13, scope: !67)
!88 = !DILocation(line: 60, column: 13, scope: !67)
!89 = !DILocation(line: 60, column: 29, scope: !67)
!90 = !DILocation(line: 60, column: 94, scope: !67)
!91 = !DILocation(line: 61, column: 35, scope: !67)
!92 = !DILocation(line: 61, column: 51, scope: !67)
!93 = !DILocation(line: 61, column: 13, scope: !67)
!94 = !DILocation(line: 62, column: 35, scope: !67)
!95 = !DILocation(line: 62, column: 51, scope: !67)
!96 = !DILocation(line: 62, column: 24, scope: !67)
!97 = !DILocation(line: 62, column: 13, scope: !67)
!98 = !DILocation(line: 65, column: 1, scope: !27)
!99 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_12_good", scope: !6, file: !6, line: 106, type: !28, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocation(line: 108, column: 5, scope: !99)
!101 = !DILocation(line: 109, column: 1, scope: !99)
!102 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 120, type: !103, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DISubroutineType(types: !104)
!104 = !{!13, !13, !105}
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!108 = !DILocalVariable(name: "argc", arg: 1, scope: !102, file: !6, line: 120, type: !13)
!109 = !DILocation(line: 120, column: 14, scope: !102)
!110 = !DILocalVariable(name: "argv", arg: 2, scope: !102, file: !6, line: 120, type: !105)
!111 = !DILocation(line: 120, column: 27, scope: !102)
!112 = !DILocation(line: 123, column: 22, scope: !102)
!113 = !DILocation(line: 123, column: 12, scope: !102)
!114 = !DILocation(line: 123, column: 5, scope: !102)
!115 = !DILocation(line: 125, column: 5, scope: !102)
!116 = !DILocation(line: 126, column: 5, scope: !102)
!117 = !DILocation(line: 127, column: 5, scope: !102)
!118 = !DILocation(line: 130, column: 5, scope: !102)
!119 = !DILocation(line: 131, column: 5, scope: !102)
!120 = !DILocation(line: 132, column: 5, scope: !102)
!121 = !DILocation(line: 134, column: 5, scope: !102)
!122 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 72, type: !28, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocation(line: 74, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !122, file: !6, line: 74, column: 8)
!125 = !DILocation(line: 74, column: 8, scope: !122)
!126 = !DILocalVariable(name: "structCharVoid", scope: !127, file: !6, line: 77, type: !4)
!127 = distinct !DILexicalBlock(scope: !128, file: !6, line: 76, column: 9)
!128 = distinct !DILexicalBlock(scope: !124, file: !6, line: 75, column: 5)
!129 = !DILocation(line: 77, column: 24, scope: !127)
!130 = !DILocation(line: 77, column: 53, scope: !127)
!131 = !DILocation(line: 77, column: 41, scope: !127)
!132 = !DILocation(line: 78, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !6, line: 78, column: 17)
!134 = !DILocation(line: 78, column: 32, scope: !133)
!135 = !DILocation(line: 78, column: 17, scope: !127)
!136 = !DILocation(line: 78, column: 42, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !6, line: 78, column: 41)
!138 = !DILocation(line: 79, column: 13, scope: !127)
!139 = !DILocation(line: 79, column: 29, scope: !127)
!140 = !DILocation(line: 79, column: 40, scope: !127)
!141 = !DILocation(line: 81, column: 35, scope: !127)
!142 = !DILocation(line: 81, column: 51, scope: !127)
!143 = !DILocation(line: 81, column: 24, scope: !127)
!144 = !DILocation(line: 81, column: 13, scope: !127)
!145 = !DILocation(line: 83, column: 21, scope: !127)
!146 = !DILocation(line: 83, column: 37, scope: !127)
!147 = !DILocation(line: 83, column: 13, scope: !127)
!148 = !DILocation(line: 84, column: 13, scope: !127)
!149 = !DILocation(line: 84, column: 29, scope: !127)
!150 = !DILocation(line: 84, column: 94, scope: !127)
!151 = !DILocation(line: 85, column: 35, scope: !127)
!152 = !DILocation(line: 85, column: 51, scope: !127)
!153 = !DILocation(line: 85, column: 13, scope: !127)
!154 = !DILocation(line: 86, column: 35, scope: !127)
!155 = !DILocation(line: 86, column: 51, scope: !127)
!156 = !DILocation(line: 86, column: 24, scope: !127)
!157 = !DILocation(line: 86, column: 13, scope: !127)
!158 = !DILocation(line: 88, column: 5, scope: !128)
!159 = !DILocalVariable(name: "structCharVoid", scope: !160, file: !6, line: 92, type: !4)
!160 = distinct !DILexicalBlock(scope: !161, file: !6, line: 91, column: 9)
!161 = distinct !DILexicalBlock(scope: !124, file: !6, line: 90, column: 5)
!162 = !DILocation(line: 92, column: 24, scope: !160)
!163 = !DILocation(line: 92, column: 53, scope: !160)
!164 = !DILocation(line: 92, column: 41, scope: !160)
!165 = !DILocation(line: 93, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !160, file: !6, line: 93, column: 17)
!167 = !DILocation(line: 93, column: 32, scope: !166)
!168 = !DILocation(line: 93, column: 17, scope: !160)
!169 = !DILocation(line: 93, column: 42, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !6, line: 93, column: 41)
!171 = !DILocation(line: 94, column: 13, scope: !160)
!172 = !DILocation(line: 94, column: 29, scope: !160)
!173 = !DILocation(line: 94, column: 40, scope: !160)
!174 = !DILocation(line: 96, column: 35, scope: !160)
!175 = !DILocation(line: 96, column: 51, scope: !160)
!176 = !DILocation(line: 96, column: 24, scope: !160)
!177 = !DILocation(line: 96, column: 13, scope: !160)
!178 = !DILocation(line: 98, column: 21, scope: !160)
!179 = !DILocation(line: 98, column: 37, scope: !160)
!180 = !DILocation(line: 98, column: 13, scope: !160)
!181 = !DILocation(line: 99, column: 13, scope: !160)
!182 = !DILocation(line: 99, column: 29, scope: !160)
!183 = !DILocation(line: 99, column: 94, scope: !160)
!184 = !DILocation(line: 100, column: 35, scope: !160)
!185 = !DILocation(line: 100, column: 51, scope: !160)
!186 = !DILocation(line: 100, column: 13, scope: !160)
!187 = !DILocation(line: 101, column: 35, scope: !160)
!188 = !DILocation(line: 101, column: 51, scope: !160)
!189 = !DILocation(line: 101, column: 24, scope: !160)
!190 = !DILocation(line: 101, column: 13, scope: !160)
!191 = !DILocation(line: 104, column: 1, scope: !122)
