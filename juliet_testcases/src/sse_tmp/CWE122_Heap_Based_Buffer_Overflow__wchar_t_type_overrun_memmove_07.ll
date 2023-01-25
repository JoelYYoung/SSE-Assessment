; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_07_bad() #0 !dbg !30 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end8, !dbg !36

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !37, metadata !DIExpression()), !dbg !40
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !41
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !42
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !40
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !43
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !45
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !46

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !47
  unreachable, !dbg !47

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !49
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !50
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !51
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !52
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !53
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !53
  %6 = bitcast i8* %5 to i32*, !dbg !54
  call void @printWLine(i32* %6), !dbg !55
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !56
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !57
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !58
  %8 = bitcast i32* %arraydecay to i8*, !dbg !58
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !58
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !59
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !60
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !59
  store i32 0, i32* %arrayidx, align 4, !dbg !61
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !62
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !63
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !62
  call void @printWLine(i32* %arraydecay6), !dbg !64
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !65
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !66
  %12 = load i8*, i8** %voidSecond7, align 8, !dbg !66
  %13 = bitcast i8* %12 to i32*, !dbg !67
  call void @printWLine(i32* %13), !dbg !68
  br label %if.end8, !dbg !69

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_07_good() #0 !dbg !71 {
entry:
  call void @good1(), !dbg !72
  call void @good2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #6, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #6, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_07_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_07_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !95 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !96
  %cmp = icmp ne i32 %0, 5, !dbg !98
  br i1 %cmp, label %if.then, label %if.else, !dbg !99

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !100
  br label %if.end8, !dbg !102

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !103, metadata !DIExpression()), !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !107
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !108
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !106
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !109
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !111
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !112

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %if.else
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !115
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !116
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !117
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !118
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !119
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !119
  %6 = bitcast i8* %5 to i32*, !dbg !120
  call void @printWLine(i32* %6), !dbg !121
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !122
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !123
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !124
  %8 = bitcast i32* %arraydecay to i8*, !dbg !124
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !124
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !125
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !126
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !128
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !129
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !128
  call void @printWLine(i32* %arraydecay6), !dbg !130
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !131
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !132
  %12 = load i8*, i8** %voidSecond7, align 8, !dbg !132
  %13 = bitcast i8* %12 to i32*, !dbg !133
  call void @printWLine(i32* %13), !dbg !134
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !136 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !137
  %cmp = icmp eq i32 %0, 5, !dbg !139
  br i1 %cmp, label %if.then, label %if.end8, !dbg !140

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !141, metadata !DIExpression()), !dbg !144
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !145
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !146
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !144
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !147
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !149
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !150

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !151
  unreachable, !dbg !151

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !153
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !154
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !155
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !156
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !157
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !157
  %6 = bitcast i8* %5 to i32*, !dbg !158
  call void @printWLine(i32* %6), !dbg !159
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !160
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !161
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !162
  %8 = bitcast i32* %arraydecay to i8*, !dbg !162
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !162
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !163
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !164
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !163
  store i32 0, i32* %arrayidx, align 4, !dbg !165
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !166
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !167
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !166
  call void @printWLine(i32* %arraydecay6), !dbg !168
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !169
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !170
  %12 = load i8*, i8** %voidSecond7, align 8, !dbg !170
  %13 = bitcast i8* %12 to i32*, !dbg !171
  call void @printWLine(i32* %13), !dbg !172
  br label %if.end8, !dbg !173

if.end8:                                          ; preds = %if.end, %entry
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 34, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !23, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !19, !21, !22}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !8, line: 29, baseType: !9)
!8 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !8, line: 24, size: 640, elements: !10)
!10 = !{!11, !18, !20}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !9, file: !8, line: 26, baseType: !12, size: 512)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 512, elements: !16)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !14, line: 74, baseType: !15)
!14 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{!17}
!17 = !DISubrange(count: 16)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !9, file: !8, line: 27, baseType: !19, size: 64, offset: 512)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !9, file: !8, line: 28, baseType: !19, size: 64, offset: 576)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!22 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!23 = !{!0}
!24 = !{i32 7, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{i32 7, !"uwtable", i32 1}
!28 = !{i32 7, !"frame-pointer", i32 2}
!29 = !{!"clang version 13.0.0"}
!30 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_07_bad", scope: !8, file: !8, line: 38, type: !31, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !DILocation(line: 40, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !8, line: 40, column: 8)
!35 = !DILocation(line: 40, column: 18, scope: !34)
!36 = !DILocation(line: 40, column: 8, scope: !30)
!37 = !DILocalVariable(name: "structCharVoid", scope: !38, file: !8, line: 43, type: !6)
!38 = distinct !DILexicalBlock(scope: !39, file: !8, line: 42, column: 9)
!39 = distinct !DILexicalBlock(scope: !34, file: !8, line: 41, column: 5)
!40 = !DILocation(line: 43, column: 24, scope: !38)
!41 = !DILocation(line: 43, column: 53, scope: !38)
!42 = !DILocation(line: 43, column: 41, scope: !38)
!43 = !DILocation(line: 44, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !8, line: 44, column: 17)
!45 = !DILocation(line: 44, column: 32, scope: !44)
!46 = !DILocation(line: 44, column: 17, scope: !38)
!47 = !DILocation(line: 44, column: 42, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !8, line: 44, column: 41)
!49 = !DILocation(line: 45, column: 13, scope: !38)
!50 = !DILocation(line: 45, column: 29, scope: !38)
!51 = !DILocation(line: 45, column: 40, scope: !38)
!52 = !DILocation(line: 47, column: 35, scope: !38)
!53 = !DILocation(line: 47, column: 51, scope: !38)
!54 = !DILocation(line: 47, column: 24, scope: !38)
!55 = !DILocation(line: 47, column: 13, scope: !38)
!56 = !DILocation(line: 49, column: 21, scope: !38)
!57 = !DILocation(line: 49, column: 37, scope: !38)
!58 = !DILocation(line: 49, column: 13, scope: !38)
!59 = !DILocation(line: 50, column: 13, scope: !38)
!60 = !DILocation(line: 50, column: 29, scope: !38)
!61 = !DILocation(line: 50, column: 94, scope: !38)
!62 = !DILocation(line: 51, column: 35, scope: !38)
!63 = !DILocation(line: 51, column: 51, scope: !38)
!64 = !DILocation(line: 51, column: 13, scope: !38)
!65 = !DILocation(line: 52, column: 35, scope: !38)
!66 = !DILocation(line: 52, column: 51, scope: !38)
!67 = !DILocation(line: 52, column: 24, scope: !38)
!68 = !DILocation(line: 52, column: 13, scope: !38)
!69 = !DILocation(line: 54, column: 5, scope: !39)
!70 = !DILocation(line: 55, column: 1, scope: !30)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_07_good", scope: !8, file: !8, line: 106, type: !31, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocation(line: 108, column: 5, scope: !71)
!73 = !DILocation(line: 109, column: 5, scope: !71)
!74 = !DILocation(line: 110, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 121, type: !76, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{!15, !15, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !8, line: 121, type: !15)
!82 = !DILocation(line: 121, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !8, line: 121, type: !78)
!84 = !DILocation(line: 121, column: 27, scope: !75)
!85 = !DILocation(line: 124, column: 22, scope: !75)
!86 = !DILocation(line: 124, column: 12, scope: !75)
!87 = !DILocation(line: 124, column: 5, scope: !75)
!88 = !DILocation(line: 126, column: 5, scope: !75)
!89 = !DILocation(line: 127, column: 5, scope: !75)
!90 = !DILocation(line: 128, column: 5, scope: !75)
!91 = !DILocation(line: 131, column: 5, scope: !75)
!92 = !DILocation(line: 132, column: 5, scope: !75)
!93 = !DILocation(line: 133, column: 5, scope: !75)
!94 = !DILocation(line: 135, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 62, type: !31, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocation(line: 64, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !95, file: !8, line: 64, column: 8)
!98 = !DILocation(line: 64, column: 18, scope: !97)
!99 = !DILocation(line: 64, column: 8, scope: !95)
!100 = !DILocation(line: 67, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !8, line: 65, column: 5)
!102 = !DILocation(line: 68, column: 5, scope: !101)
!103 = !DILocalVariable(name: "structCharVoid", scope: !104, file: !8, line: 72, type: !6)
!104 = distinct !DILexicalBlock(scope: !105, file: !8, line: 71, column: 9)
!105 = distinct !DILexicalBlock(scope: !97, file: !8, line: 70, column: 5)
!106 = !DILocation(line: 72, column: 24, scope: !104)
!107 = !DILocation(line: 72, column: 53, scope: !104)
!108 = !DILocation(line: 72, column: 41, scope: !104)
!109 = !DILocation(line: 73, column: 17, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !8, line: 73, column: 17)
!111 = !DILocation(line: 73, column: 32, scope: !110)
!112 = !DILocation(line: 73, column: 17, scope: !104)
!113 = !DILocation(line: 73, column: 42, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !8, line: 73, column: 41)
!115 = !DILocation(line: 74, column: 13, scope: !104)
!116 = !DILocation(line: 74, column: 29, scope: !104)
!117 = !DILocation(line: 74, column: 40, scope: !104)
!118 = !DILocation(line: 76, column: 35, scope: !104)
!119 = !DILocation(line: 76, column: 51, scope: !104)
!120 = !DILocation(line: 76, column: 24, scope: !104)
!121 = !DILocation(line: 76, column: 13, scope: !104)
!122 = !DILocation(line: 78, column: 21, scope: !104)
!123 = !DILocation(line: 78, column: 37, scope: !104)
!124 = !DILocation(line: 78, column: 13, scope: !104)
!125 = !DILocation(line: 79, column: 13, scope: !104)
!126 = !DILocation(line: 79, column: 29, scope: !104)
!127 = !DILocation(line: 79, column: 94, scope: !104)
!128 = !DILocation(line: 80, column: 35, scope: !104)
!129 = !DILocation(line: 80, column: 51, scope: !104)
!130 = !DILocation(line: 80, column: 13, scope: !104)
!131 = !DILocation(line: 81, column: 35, scope: !104)
!132 = !DILocation(line: 81, column: 51, scope: !104)
!133 = !DILocation(line: 81, column: 24, scope: !104)
!134 = !DILocation(line: 81, column: 13, scope: !104)
!135 = !DILocation(line: 84, column: 1, scope: !95)
!136 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 87, type: !31, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!137 = !DILocation(line: 89, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !136, file: !8, line: 89, column: 8)
!139 = !DILocation(line: 89, column: 18, scope: !138)
!140 = !DILocation(line: 89, column: 8, scope: !136)
!141 = !DILocalVariable(name: "structCharVoid", scope: !142, file: !8, line: 92, type: !6)
!142 = distinct !DILexicalBlock(scope: !143, file: !8, line: 91, column: 9)
!143 = distinct !DILexicalBlock(scope: !138, file: !8, line: 90, column: 5)
!144 = !DILocation(line: 92, column: 24, scope: !142)
!145 = !DILocation(line: 92, column: 53, scope: !142)
!146 = !DILocation(line: 92, column: 41, scope: !142)
!147 = !DILocation(line: 93, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !8, line: 93, column: 17)
!149 = !DILocation(line: 93, column: 32, scope: !148)
!150 = !DILocation(line: 93, column: 17, scope: !142)
!151 = !DILocation(line: 93, column: 42, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !8, line: 93, column: 41)
!153 = !DILocation(line: 94, column: 13, scope: !142)
!154 = !DILocation(line: 94, column: 29, scope: !142)
!155 = !DILocation(line: 94, column: 40, scope: !142)
!156 = !DILocation(line: 96, column: 35, scope: !142)
!157 = !DILocation(line: 96, column: 51, scope: !142)
!158 = !DILocation(line: 96, column: 24, scope: !142)
!159 = !DILocation(line: 96, column: 13, scope: !142)
!160 = !DILocation(line: 98, column: 21, scope: !142)
!161 = !DILocation(line: 98, column: 37, scope: !142)
!162 = !DILocation(line: 98, column: 13, scope: !142)
!163 = !DILocation(line: 99, column: 13, scope: !142)
!164 = !DILocation(line: 99, column: 29, scope: !142)
!165 = !DILocation(line: 99, column: 94, scope: !142)
!166 = !DILocation(line: 100, column: 35, scope: !142)
!167 = !DILocation(line: 100, column: 51, scope: !142)
!168 = !DILocation(line: 100, column: 13, scope: !142)
!169 = !DILocation(line: 101, column: 35, scope: !142)
!170 = !DILocation(line: 101, column: 51, scope: !142)
!171 = !DILocation(line: 101, column: 24, scope: !142)
!172 = !DILocation(line: 101, column: 13, scope: !142)
!173 = !DILocation(line: 103, column: 5, scope: !143)
!174 = !DILocation(line: 104, column: 1, scope: !136)
