; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12_bad() #0 !dbg !27 {
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !54
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
  %13 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !65
  %14 = bitcast %struct._charVoid* %13 to i8*, !dbg !65
  call void @free(i8* %14) #6, !dbg !66
  br label %if.end22, !dbg !67

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid8, metadata !68, metadata !DIExpression()), !dbg !71
  %call9 = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !72
  %15 = bitcast i8* %call9 to %struct._charVoid*, !dbg !73
  store %struct._charVoid* %15, %struct._charVoid** %structCharVoid8, align 8, !dbg !71
  %16 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !74
  %cmp10 = icmp eq %struct._charVoid* %16, null, !dbg !76
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !77

if.then11:                                        ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !78
  unreachable, !dbg !78

if.end12:                                         ; preds = %if.else
  %17 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !80
  %voidSecond13 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %17, i32 0, i32 1, !dbg !81
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond13, align 8, !dbg !82
  %18 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !83
  %voidSecond14 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %18, i32 0, i32 1, !dbg !84
  %19 = load i8*, i8** %voidSecond14, align 8, !dbg !84
  %20 = bitcast i8* %19 to i32*, !dbg !85
  call void @printWLine(i32* %20), !dbg !86
  %21 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !87
  %charFirst15 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %21, i32 0, i32 0, !dbg !88
  %arraydecay16 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst15, i64 0, i64 0, !dbg !89
  %22 = bitcast i32* %arraydecay16 to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %22, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !89
  %23 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !90
  %charFirst17 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %23, i32 0, i32 0, !dbg !91
  %arrayidx18 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst17, i64 0, i64 15, !dbg !90
  store i32 0, i32* %arrayidx18, align 4, !dbg !92
  %24 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !93
  %charFirst19 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %24, i32 0, i32 0, !dbg !94
  %arraydecay20 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst19, i64 0, i64 0, !dbg !93
  call void @printWLine(i32* %arraydecay20), !dbg !95
  %25 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !96
  %voidSecond21 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %25, i32 0, i32 1, !dbg !97
  %26 = load i8*, i8** %voidSecond21, align 8, !dbg !97
  %27 = bitcast i8* %26 to i32*, !dbg !98
  call void @printWLine(i32* %27), !dbg !99
  %28 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !100
  %29 = bitcast %struct._charVoid* %28 to i8*, !dbg !100
  call void @free(i8* %29) #6, !dbg !101
  br label %if.end22

if.end22:                                         ; preds = %if.end12, %if.end
  ret void, !dbg !102
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12_good() #0 !dbg !103 {
entry:
  call void @good1(), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !106 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !112, metadata !DIExpression()), !dbg !113
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !114, metadata !DIExpression()), !dbg !115
  %call = call i64 @time(i64* null) #6, !dbg !116
  %conv = trunc i64 %call to i32, !dbg !117
  call void @srand(i32 %conv) #6, !dbg !118
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !119
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12_good(), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !122
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12_bad(), !dbg !123
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !124
  ret i32 0, !dbg !125
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !126 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %structCharVoid8 = alloca %struct._charVoid*, align 8
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !127
  %tobool = icmp ne i32 %call, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.else, !dbg !129

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !130, metadata !DIExpression()), !dbg !133
  %call1 = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !134
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !135
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !133
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !136
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !138
  br i1 %cmp, label %if.then2, label %if.end, !dbg !139

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !140
  unreachable, !dbg !140

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !142
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !143
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !144
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !145
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !146
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !146
  %5 = bitcast i8* %4 to i32*, !dbg !147
  call void @printWLine(i32* %5), !dbg !148
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !149
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !150
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !151
  %7 = bitcast i32* %arraydecay to i8*, !dbg !151
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !151
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !152
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !153
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !152
  store i32 0, i32* %arrayidx, align 4, !dbg !154
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !155
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !156
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !155
  call void @printWLine(i32* %arraydecay6), !dbg !157
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !158
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !159
  %11 = load i8*, i8** %voidSecond7, align 8, !dbg !159
  %12 = bitcast i8* %11 to i32*, !dbg !160
  call void @printWLine(i32* %12), !dbg !161
  %13 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !162
  %14 = bitcast %struct._charVoid* %13 to i8*, !dbg !162
  call void @free(i8* %14) #6, !dbg !163
  br label %if.end22, !dbg !164

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid8, metadata !165, metadata !DIExpression()), !dbg !168
  %call9 = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !169
  %15 = bitcast i8* %call9 to %struct._charVoid*, !dbg !170
  store %struct._charVoid* %15, %struct._charVoid** %structCharVoid8, align 8, !dbg !168
  %16 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !171
  %cmp10 = icmp eq %struct._charVoid* %16, null, !dbg !173
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !174

if.then11:                                        ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !175
  unreachable, !dbg !175

if.end12:                                         ; preds = %if.else
  %17 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !177
  %voidSecond13 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %17, i32 0, i32 1, !dbg !178
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond13, align 8, !dbg !179
  %18 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !180
  %voidSecond14 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %18, i32 0, i32 1, !dbg !181
  %19 = load i8*, i8** %voidSecond14, align 8, !dbg !181
  %20 = bitcast i8* %19 to i32*, !dbg !182
  call void @printWLine(i32* %20), !dbg !183
  %21 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !184
  %charFirst15 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %21, i32 0, i32 0, !dbg !185
  %arraydecay16 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst15, i64 0, i64 0, !dbg !186
  %22 = bitcast i32* %arraydecay16 to i8*, !dbg !186
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %22, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !186
  %23 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !187
  %charFirst17 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %23, i32 0, i32 0, !dbg !188
  %arrayidx18 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst17, i64 0, i64 15, !dbg !187
  store i32 0, i32* %arrayidx18, align 4, !dbg !189
  %24 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !190
  %charFirst19 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %24, i32 0, i32 0, !dbg !191
  %arraydecay20 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst19, i64 0, i64 0, !dbg !190
  call void @printWLine(i32* %arraydecay20), !dbg !192
  %25 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !193
  %voidSecond21 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %25, i32 0, i32 1, !dbg !194
  %26 = load i8*, i8** %voidSecond21, align 8, !dbg !194
  %27 = bitcast i8* %26 to i32*, !dbg !195
  call void @printWLine(i32* %27), !dbg !196
  %28 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !197
  %29 = bitcast %struct._charVoid* %28 to i8*, !dbg !197
  call void @free(i8* %29) #6, !dbg !198
  br label %if.end22

if.end22:                                         ; preds = %if.end12, %if.end
  ret void, !dbg !199
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12_bad", scope: !6, file: !6, line: 33, type: !28, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
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
!52 = !DILocation(line: 44, column: 20, scope: !34)
!53 = !DILocation(line: 44, column: 36, scope: !34)
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
!65 = !DILocation(line: 48, column: 18, scope: !34)
!66 = !DILocation(line: 48, column: 13, scope: !34)
!67 = !DILocation(line: 50, column: 5, scope: !35)
!68 = !DILocalVariable(name: "structCharVoid", scope: !69, file: !6, line: 54, type: !4)
!69 = distinct !DILexicalBlock(scope: !70, file: !6, line: 53, column: 9)
!70 = distinct !DILexicalBlock(scope: !31, file: !6, line: 52, column: 5)
!71 = !DILocation(line: 54, column: 24, scope: !69)
!72 = !DILocation(line: 54, column: 53, scope: !69)
!73 = !DILocation(line: 54, column: 41, scope: !69)
!74 = !DILocation(line: 55, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !6, line: 55, column: 17)
!76 = !DILocation(line: 55, column: 32, scope: !75)
!77 = !DILocation(line: 55, column: 17, scope: !69)
!78 = !DILocation(line: 55, column: 42, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !6, line: 55, column: 41)
!80 = !DILocation(line: 56, column: 13, scope: !69)
!81 = !DILocation(line: 56, column: 29, scope: !69)
!82 = !DILocation(line: 56, column: 40, scope: !69)
!83 = !DILocation(line: 58, column: 35, scope: !69)
!84 = !DILocation(line: 58, column: 51, scope: !69)
!85 = !DILocation(line: 58, column: 24, scope: !69)
!86 = !DILocation(line: 58, column: 13, scope: !69)
!87 = !DILocation(line: 60, column: 20, scope: !69)
!88 = !DILocation(line: 60, column: 36, scope: !69)
!89 = !DILocation(line: 60, column: 13, scope: !69)
!90 = !DILocation(line: 61, column: 13, scope: !69)
!91 = !DILocation(line: 61, column: 29, scope: !69)
!92 = !DILocation(line: 61, column: 94, scope: !69)
!93 = !DILocation(line: 62, column: 35, scope: !69)
!94 = !DILocation(line: 62, column: 51, scope: !69)
!95 = !DILocation(line: 62, column: 13, scope: !69)
!96 = !DILocation(line: 63, column: 35, scope: !69)
!97 = !DILocation(line: 63, column: 51, scope: !69)
!98 = !DILocation(line: 63, column: 24, scope: !69)
!99 = !DILocation(line: 63, column: 13, scope: !69)
!100 = !DILocation(line: 64, column: 18, scope: !69)
!101 = !DILocation(line: 64, column: 13, scope: !69)
!102 = !DILocation(line: 67, column: 1, scope: !27)
!103 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_12_good", scope: !6, file: !6, line: 110, type: !28, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocation(line: 112, column: 5, scope: !103)
!105 = !DILocation(line: 113, column: 1, scope: !103)
!106 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 124, type: !107, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DISubroutineType(types: !108)
!108 = !{!13, !13, !109}
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!112 = !DILocalVariable(name: "argc", arg: 1, scope: !106, file: !6, line: 124, type: !13)
!113 = !DILocation(line: 124, column: 14, scope: !106)
!114 = !DILocalVariable(name: "argv", arg: 2, scope: !106, file: !6, line: 124, type: !109)
!115 = !DILocation(line: 124, column: 27, scope: !106)
!116 = !DILocation(line: 127, column: 22, scope: !106)
!117 = !DILocation(line: 127, column: 12, scope: !106)
!118 = !DILocation(line: 127, column: 5, scope: !106)
!119 = !DILocation(line: 129, column: 5, scope: !106)
!120 = !DILocation(line: 130, column: 5, scope: !106)
!121 = !DILocation(line: 131, column: 5, scope: !106)
!122 = !DILocation(line: 134, column: 5, scope: !106)
!123 = !DILocation(line: 135, column: 5, scope: !106)
!124 = !DILocation(line: 136, column: 5, scope: !106)
!125 = !DILocation(line: 138, column: 5, scope: !106)
!126 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 74, type: !28, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocation(line: 76, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !126, file: !6, line: 76, column: 8)
!129 = !DILocation(line: 76, column: 8, scope: !126)
!130 = !DILocalVariable(name: "structCharVoid", scope: !131, file: !6, line: 79, type: !4)
!131 = distinct !DILexicalBlock(scope: !132, file: !6, line: 78, column: 9)
!132 = distinct !DILexicalBlock(scope: !128, file: !6, line: 77, column: 5)
!133 = !DILocation(line: 79, column: 24, scope: !131)
!134 = !DILocation(line: 79, column: 53, scope: !131)
!135 = !DILocation(line: 79, column: 41, scope: !131)
!136 = !DILocation(line: 80, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !6, line: 80, column: 17)
!138 = !DILocation(line: 80, column: 32, scope: !137)
!139 = !DILocation(line: 80, column: 17, scope: !131)
!140 = !DILocation(line: 80, column: 42, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !6, line: 80, column: 41)
!142 = !DILocation(line: 81, column: 13, scope: !131)
!143 = !DILocation(line: 81, column: 29, scope: !131)
!144 = !DILocation(line: 81, column: 40, scope: !131)
!145 = !DILocation(line: 83, column: 35, scope: !131)
!146 = !DILocation(line: 83, column: 51, scope: !131)
!147 = !DILocation(line: 83, column: 24, scope: !131)
!148 = !DILocation(line: 83, column: 13, scope: !131)
!149 = !DILocation(line: 85, column: 20, scope: !131)
!150 = !DILocation(line: 85, column: 36, scope: !131)
!151 = !DILocation(line: 85, column: 13, scope: !131)
!152 = !DILocation(line: 86, column: 13, scope: !131)
!153 = !DILocation(line: 86, column: 29, scope: !131)
!154 = !DILocation(line: 86, column: 94, scope: !131)
!155 = !DILocation(line: 87, column: 35, scope: !131)
!156 = !DILocation(line: 87, column: 51, scope: !131)
!157 = !DILocation(line: 87, column: 13, scope: !131)
!158 = !DILocation(line: 88, column: 35, scope: !131)
!159 = !DILocation(line: 88, column: 51, scope: !131)
!160 = !DILocation(line: 88, column: 24, scope: !131)
!161 = !DILocation(line: 88, column: 13, scope: !131)
!162 = !DILocation(line: 89, column: 18, scope: !131)
!163 = !DILocation(line: 89, column: 13, scope: !131)
!164 = !DILocation(line: 91, column: 5, scope: !132)
!165 = !DILocalVariable(name: "structCharVoid", scope: !166, file: !6, line: 95, type: !4)
!166 = distinct !DILexicalBlock(scope: !167, file: !6, line: 94, column: 9)
!167 = distinct !DILexicalBlock(scope: !128, file: !6, line: 93, column: 5)
!168 = !DILocation(line: 95, column: 24, scope: !166)
!169 = !DILocation(line: 95, column: 53, scope: !166)
!170 = !DILocation(line: 95, column: 41, scope: !166)
!171 = !DILocation(line: 96, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !166, file: !6, line: 96, column: 17)
!173 = !DILocation(line: 96, column: 32, scope: !172)
!174 = !DILocation(line: 96, column: 17, scope: !166)
!175 = !DILocation(line: 96, column: 42, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !6, line: 96, column: 41)
!177 = !DILocation(line: 97, column: 13, scope: !166)
!178 = !DILocation(line: 97, column: 29, scope: !166)
!179 = !DILocation(line: 97, column: 40, scope: !166)
!180 = !DILocation(line: 99, column: 35, scope: !166)
!181 = !DILocation(line: 99, column: 51, scope: !166)
!182 = !DILocation(line: 99, column: 24, scope: !166)
!183 = !DILocation(line: 99, column: 13, scope: !166)
!184 = !DILocation(line: 101, column: 20, scope: !166)
!185 = !DILocation(line: 101, column: 36, scope: !166)
!186 = !DILocation(line: 101, column: 13, scope: !166)
!187 = !DILocation(line: 102, column: 13, scope: !166)
!188 = !DILocation(line: 102, column: 29, scope: !166)
!189 = !DILocation(line: 102, column: 94, scope: !166)
!190 = !DILocation(line: 103, column: 35, scope: !166)
!191 = !DILocation(line: 103, column: 51, scope: !166)
!192 = !DILocation(line: 103, column: 13, scope: !166)
!193 = !DILocation(line: 104, column: 35, scope: !166)
!194 = !DILocation(line: 104, column: 51, scope: !166)
!195 = !DILocation(line: 104, column: 24, scope: !166)
!196 = !DILocation(line: 104, column: 13, scope: !166)
!197 = !DILocation(line: 105, column: 18, scope: !166)
!198 = !DILocation(line: 105, column: 13, scope: !166)
!199 = !DILocation(line: 108, column: 1, scope: !126)
