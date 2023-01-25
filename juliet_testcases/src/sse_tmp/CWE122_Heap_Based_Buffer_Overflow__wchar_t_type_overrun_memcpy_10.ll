; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_10_bad() #0 !dbg !27 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @globalTrue, align 4, !dbg !30
  %tobool = icmp ne i32 %0, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end7, !dbg !32

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !33, metadata !DIExpression()), !dbg !36
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !37
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !38
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !36
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !39
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !41
  br i1 %cmp, label %if.then1, label %if.end, !dbg !42

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !45
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !46
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !47
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !48
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !49
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !49
  %6 = bitcast i8* %5 to i32*, !dbg !50
  call void @printWLine(i32* %6), !dbg !51
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !52
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !53
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !54
  %8 = bitcast i32* %arraydecay to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !54
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !55
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !56
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !55
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !58
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !59
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay5), !dbg !60
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !61
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !62
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !62
  %13 = bitcast i8* %12 to i32*, !dbg !63
  call void @printWLine(i32* %13), !dbg !64
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !65
  %15 = bitcast %struct._charVoid* %14 to i8*, !dbg !65
  call void @free(i8* %15) #6, !dbg !66
  br label %if.end7, !dbg !67

if.end7:                                          ; preds = %if.end, %entry
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_10_good() #0 !dbg !69 {
entry:
  call void @good1(), !dbg !70
  call void @good2(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #6, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #6, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_10_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_10_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !93 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @globalFalse, align 4, !dbg !94
  %tobool = icmp ne i32 %0, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !97
  br label %if.end7, !dbg !99

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !100, metadata !DIExpression()), !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !104
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !105
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !103
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !106
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !108
  br i1 %cmp, label %if.then1, label %if.end, !dbg !109

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %if.else
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !112
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !113
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !114
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !115
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !116
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !116
  %6 = bitcast i8* %5 to i32*, !dbg !117
  call void @printWLine(i32* %6), !dbg !118
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !119
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !120
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !121
  %8 = bitcast i32* %arraydecay to i8*, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !121
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !122
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !123
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !125
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !126
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !125
  call void @printWLine(i32* %arraydecay5), !dbg !127
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !128
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !129
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !129
  %13 = bitcast i8* %12 to i32*, !dbg !130
  call void @printWLine(i32* %13), !dbg !131
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !132
  %15 = bitcast %struct._charVoid* %14 to i8*, !dbg !132
  call void @free(i8* %15) #6, !dbg !133
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !135 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @globalTrue, align 4, !dbg !136
  %tobool = icmp ne i32 %0, 0, !dbg !136
  br i1 %tobool, label %if.then, label %if.end7, !dbg !138

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !139, metadata !DIExpression()), !dbg !142
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !143
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !144
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !142
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !145
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !147
  br i1 %cmp, label %if.then1, label %if.end, !dbg !148

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !149
  unreachable, !dbg !149

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !151
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !152
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !153
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !154
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !155
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !155
  %6 = bitcast i8* %5 to i32*, !dbg !156
  call void @printWLine(i32* %6), !dbg !157
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !158
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !159
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !160
  %8 = bitcast i32* %arraydecay to i8*, !dbg !160
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !160
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !161
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !162
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !161
  store i32 0, i32* %arrayidx, align 4, !dbg !163
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !164
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !165
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !164
  call void @printWLine(i32* %arraydecay5), !dbg !166
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !167
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !168
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !168
  %13 = bitcast i8* %12 to i32*, !dbg !169
  call void @printWLine(i32* %13), !dbg !170
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !171
  %15 = bitcast %struct._charVoid* %14 to i8*, !dbg !171
  call void @free(i8* %15) #6, !dbg !172
  br label %if.end7, !dbg !173

if.end7:                                          ; preds = %if.end, %entry
  ret void, !dbg !174
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_10_bad", scope: !6, file: !6, line: 33, type: !28, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
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
!68 = !DILocation(line: 51, column: 1, scope: !27)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_10_good", scope: !6, file: !6, line: 104, type: !28, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 106, column: 5, scope: !69)
!71 = !DILocation(line: 107, column: 5, scope: !69)
!72 = !DILocation(line: 108, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 119, type: !74, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!13, !13, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !6, line: 119, type: !13)
!80 = !DILocation(line: 119, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !6, line: 119, type: !76)
!82 = !DILocation(line: 119, column: 27, scope: !73)
!83 = !DILocation(line: 122, column: 22, scope: !73)
!84 = !DILocation(line: 122, column: 12, scope: !73)
!85 = !DILocation(line: 122, column: 5, scope: !73)
!86 = !DILocation(line: 124, column: 5, scope: !73)
!87 = !DILocation(line: 125, column: 5, scope: !73)
!88 = !DILocation(line: 126, column: 5, scope: !73)
!89 = !DILocation(line: 129, column: 5, scope: !73)
!90 = !DILocation(line: 130, column: 5, scope: !73)
!91 = !DILocation(line: 131, column: 5, scope: !73)
!92 = !DILocation(line: 133, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 58, type: !28, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 60, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !93, file: !6, line: 60, column: 8)
!96 = !DILocation(line: 60, column: 8, scope: !93)
!97 = !DILocation(line: 63, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !6, line: 61, column: 5)
!99 = !DILocation(line: 64, column: 5, scope: !98)
!100 = !DILocalVariable(name: "structCharVoid", scope: !101, file: !6, line: 68, type: !4)
!101 = distinct !DILexicalBlock(scope: !102, file: !6, line: 67, column: 9)
!102 = distinct !DILexicalBlock(scope: !95, file: !6, line: 66, column: 5)
!103 = !DILocation(line: 68, column: 24, scope: !101)
!104 = !DILocation(line: 68, column: 53, scope: !101)
!105 = !DILocation(line: 68, column: 41, scope: !101)
!106 = !DILocation(line: 69, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !101, file: !6, line: 69, column: 17)
!108 = !DILocation(line: 69, column: 32, scope: !107)
!109 = !DILocation(line: 69, column: 17, scope: !101)
!110 = !DILocation(line: 69, column: 42, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !6, line: 69, column: 41)
!112 = !DILocation(line: 70, column: 13, scope: !101)
!113 = !DILocation(line: 70, column: 29, scope: !101)
!114 = !DILocation(line: 70, column: 40, scope: !101)
!115 = !DILocation(line: 72, column: 35, scope: !101)
!116 = !DILocation(line: 72, column: 51, scope: !101)
!117 = !DILocation(line: 72, column: 24, scope: !101)
!118 = !DILocation(line: 72, column: 13, scope: !101)
!119 = !DILocation(line: 74, column: 20, scope: !101)
!120 = !DILocation(line: 74, column: 36, scope: !101)
!121 = !DILocation(line: 74, column: 13, scope: !101)
!122 = !DILocation(line: 75, column: 13, scope: !101)
!123 = !DILocation(line: 75, column: 29, scope: !101)
!124 = !DILocation(line: 75, column: 94, scope: !101)
!125 = !DILocation(line: 76, column: 35, scope: !101)
!126 = !DILocation(line: 76, column: 51, scope: !101)
!127 = !DILocation(line: 76, column: 13, scope: !101)
!128 = !DILocation(line: 77, column: 35, scope: !101)
!129 = !DILocation(line: 77, column: 51, scope: !101)
!130 = !DILocation(line: 77, column: 24, scope: !101)
!131 = !DILocation(line: 77, column: 13, scope: !101)
!132 = !DILocation(line: 78, column: 18, scope: !101)
!133 = !DILocation(line: 78, column: 13, scope: !101)
!134 = !DILocation(line: 81, column: 1, scope: !93)
!135 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 84, type: !28, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocation(line: 86, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !135, file: !6, line: 86, column: 8)
!138 = !DILocation(line: 86, column: 8, scope: !135)
!139 = !DILocalVariable(name: "structCharVoid", scope: !140, file: !6, line: 89, type: !4)
!140 = distinct !DILexicalBlock(scope: !141, file: !6, line: 88, column: 9)
!141 = distinct !DILexicalBlock(scope: !137, file: !6, line: 87, column: 5)
!142 = !DILocation(line: 89, column: 24, scope: !140)
!143 = !DILocation(line: 89, column: 53, scope: !140)
!144 = !DILocation(line: 89, column: 41, scope: !140)
!145 = !DILocation(line: 90, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !6, line: 90, column: 17)
!147 = !DILocation(line: 90, column: 32, scope: !146)
!148 = !DILocation(line: 90, column: 17, scope: !140)
!149 = !DILocation(line: 90, column: 42, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !6, line: 90, column: 41)
!151 = !DILocation(line: 91, column: 13, scope: !140)
!152 = !DILocation(line: 91, column: 29, scope: !140)
!153 = !DILocation(line: 91, column: 40, scope: !140)
!154 = !DILocation(line: 93, column: 35, scope: !140)
!155 = !DILocation(line: 93, column: 51, scope: !140)
!156 = !DILocation(line: 93, column: 24, scope: !140)
!157 = !DILocation(line: 93, column: 13, scope: !140)
!158 = !DILocation(line: 95, column: 20, scope: !140)
!159 = !DILocation(line: 95, column: 36, scope: !140)
!160 = !DILocation(line: 95, column: 13, scope: !140)
!161 = !DILocation(line: 96, column: 13, scope: !140)
!162 = !DILocation(line: 96, column: 29, scope: !140)
!163 = !DILocation(line: 96, column: 94, scope: !140)
!164 = !DILocation(line: 97, column: 35, scope: !140)
!165 = !DILocation(line: 97, column: 51, scope: !140)
!166 = !DILocation(line: 97, column: 13, scope: !140)
!167 = !DILocation(line: 98, column: 35, scope: !140)
!168 = !DILocation(line: 98, column: 51, scope: !140)
!169 = !DILocation(line: 98, column: 24, scope: !140)
!170 = !DILocation(line: 98, column: 13, scope: !140)
!171 = !DILocation(line: 99, column: 18, scope: !140)
!172 = !DILocation(line: 99, column: 13, scope: !140)
!173 = !DILocation(line: 101, column: 5, scope: !141)
!174 = !DILocation(line: 102, column: 1, scope: !135)
