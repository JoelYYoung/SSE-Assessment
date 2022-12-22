; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !24
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05_bad() #0 !dbg !32 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end7, !dbg !37

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !38, metadata !DIExpression()), !dbg !41
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !42
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !43
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !41
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !44
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !46
  br i1 %cmp, label %if.then1, label %if.end, !dbg !47

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !48
  unreachable, !dbg !48

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !50
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !51
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !52
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !53
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !54
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !54
  %6 = bitcast i8* %5 to i32*, !dbg !55
  call void @printWLine(i32* %6), !dbg !56
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !57
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !58
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !59
  %8 = bitcast i32* %arraydecay to i8*, !dbg !59
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !59
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !60
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !61
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !60
  store i32 0, i32* %arrayidx, align 4, !dbg !62
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !63
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !64
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* %arraydecay5), !dbg !65
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !66
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !67
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !67
  %13 = bitcast i8* %12 to i32*, !dbg !68
  call void @printWLine(i32* %13), !dbg !69
  br label %if.end7, !dbg !70

if.end7:                                          ; preds = %if.end, %entry
  ret void, !dbg !71
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05_good() #0 !dbg !72 {
entry:
  call void @good1(), !dbg !73
  call void @good2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #6, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #6, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !96 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFalse, align 4, !dbg !97
  %tobool = icmp ne i32 %0, 0, !dbg !97
  br i1 %tobool, label %if.then, label %if.else, !dbg !99

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !100
  br label %if.end7, !dbg !102

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !103, metadata !DIExpression()), !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !107
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !108
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !106
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !109
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !111
  br i1 %cmp, label %if.then1, label %if.end, !dbg !112

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %if.else
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !115
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !116
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !117
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !118
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !119
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !119
  %6 = bitcast i8* %5 to i32*, !dbg !120
  call void @printWLine(i32* %6), !dbg !121
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !122
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !123
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !124
  %8 = bitcast i32* %arraydecay to i8*, !dbg !124
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !124
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !125
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !126
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !128
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !129
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !128
  call void @printWLine(i32* %arraydecay5), !dbg !130
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !131
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !132
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !132
  %13 = bitcast i8* %12 to i32*, !dbg !133
  call void @printWLine(i32* %13), !dbg !134
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !136 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticTrue, align 4, !dbg !137
  %tobool = icmp ne i32 %0, 0, !dbg !137
  br i1 %tobool, label %if.then, label %if.end7, !dbg !139

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !140, metadata !DIExpression()), !dbg !143
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !144
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !145
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !143
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !146
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !148
  br i1 %cmp, label %if.then1, label %if.end, !dbg !149

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !150
  unreachable, !dbg !150

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !152
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !153
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !154
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !155
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !156
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !156
  %6 = bitcast i8* %5 to i32*, !dbg !157
  call void @printWLine(i32* %6), !dbg !158
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !159
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !160
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !161
  %8 = bitcast i32* %arraydecay to i8*, !dbg !161
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !161
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !162
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !163
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !162
  store i32 0, i32* %arrayidx, align 4, !dbg !164
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !165
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !166
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !165
  call void @printWLine(i32* %arraydecay5), !dbg !167
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !168
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !169
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !169
  %13 = bitcast i8* %12 to i32*, !dbg !170
  call void @printWLine(i32* %13), !dbg !171
  br label %if.end7, !dbg !172

if.end7:                                          ; preds = %if.end, %entry
  ret void, !dbg !173
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
!llvm.module.flags = !{!26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !8, line: 34, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !23, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !19, !21, !22}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !8, line: 29, baseType: !9)
!8 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05.c", directory: "/root/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !8, line: 24, size: 640, elements: !10)
!10 = !{!11, !18, !20}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !9, file: !8, line: 26, baseType: !12, size: 512)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 512, elements: !16)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !14, line: 74, baseType: !15)
!14 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{!17}
!17 = !DISubrange(count: 16)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !9, file: !8, line: 27, baseType: !19, size: 64, offset: 512)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !9, file: !8, line: 28, baseType: !19, size: 64, offset: 576)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!22 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!23 = !{!0, !24}
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !8, line: 35, type: !15, isLocal: true, isDefinition: true)
!26 = !{i32 7, !"Dwarf Version", i32 4}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 7, !"uwtable", i32 1}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"clang version 13.0.0"}
!32 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05_bad", scope: !8, file: !8, line: 39, type: !33, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !DILocation(line: 41, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !8, line: 41, column: 8)
!37 = !DILocation(line: 41, column: 8, scope: !32)
!38 = !DILocalVariable(name: "structCharVoid", scope: !39, file: !8, line: 44, type: !6)
!39 = distinct !DILexicalBlock(scope: !40, file: !8, line: 43, column: 9)
!40 = distinct !DILexicalBlock(scope: !36, file: !8, line: 42, column: 5)
!41 = !DILocation(line: 44, column: 24, scope: !39)
!42 = !DILocation(line: 44, column: 53, scope: !39)
!43 = !DILocation(line: 44, column: 41, scope: !39)
!44 = !DILocation(line: 45, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !8, line: 45, column: 17)
!46 = !DILocation(line: 45, column: 32, scope: !45)
!47 = !DILocation(line: 45, column: 17, scope: !39)
!48 = !DILocation(line: 45, column: 42, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !8, line: 45, column: 41)
!50 = !DILocation(line: 46, column: 13, scope: !39)
!51 = !DILocation(line: 46, column: 29, scope: !39)
!52 = !DILocation(line: 46, column: 40, scope: !39)
!53 = !DILocation(line: 48, column: 35, scope: !39)
!54 = !DILocation(line: 48, column: 51, scope: !39)
!55 = !DILocation(line: 48, column: 24, scope: !39)
!56 = !DILocation(line: 48, column: 13, scope: !39)
!57 = !DILocation(line: 50, column: 21, scope: !39)
!58 = !DILocation(line: 50, column: 37, scope: !39)
!59 = !DILocation(line: 50, column: 13, scope: !39)
!60 = !DILocation(line: 51, column: 13, scope: !39)
!61 = !DILocation(line: 51, column: 29, scope: !39)
!62 = !DILocation(line: 51, column: 94, scope: !39)
!63 = !DILocation(line: 52, column: 35, scope: !39)
!64 = !DILocation(line: 52, column: 51, scope: !39)
!65 = !DILocation(line: 52, column: 13, scope: !39)
!66 = !DILocation(line: 53, column: 35, scope: !39)
!67 = !DILocation(line: 53, column: 51, scope: !39)
!68 = !DILocation(line: 53, column: 24, scope: !39)
!69 = !DILocation(line: 53, column: 13, scope: !39)
!70 = !DILocation(line: 55, column: 5, scope: !40)
!71 = !DILocation(line: 56, column: 1, scope: !32)
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_05_good", scope: !8, file: !8, line: 107, type: !33, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocation(line: 109, column: 5, scope: !72)
!74 = !DILocation(line: 110, column: 5, scope: !72)
!75 = !DILocation(line: 111, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 122, type: !77, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DISubroutineType(types: !78)
!78 = !{!15, !15, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !8, line: 122, type: !15)
!83 = !DILocation(line: 122, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !8, line: 122, type: !79)
!85 = !DILocation(line: 122, column: 27, scope: !76)
!86 = !DILocation(line: 125, column: 22, scope: !76)
!87 = !DILocation(line: 125, column: 12, scope: !76)
!88 = !DILocation(line: 125, column: 5, scope: !76)
!89 = !DILocation(line: 127, column: 5, scope: !76)
!90 = !DILocation(line: 128, column: 5, scope: !76)
!91 = !DILocation(line: 129, column: 5, scope: !76)
!92 = !DILocation(line: 132, column: 5, scope: !76)
!93 = !DILocation(line: 133, column: 5, scope: !76)
!94 = !DILocation(line: 134, column: 5, scope: !76)
!95 = !DILocation(line: 136, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 63, type: !33, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocation(line: 65, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !96, file: !8, line: 65, column: 8)
!99 = !DILocation(line: 65, column: 8, scope: !96)
!100 = !DILocation(line: 68, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !8, line: 66, column: 5)
!102 = !DILocation(line: 69, column: 5, scope: !101)
!103 = !DILocalVariable(name: "structCharVoid", scope: !104, file: !8, line: 73, type: !6)
!104 = distinct !DILexicalBlock(scope: !105, file: !8, line: 72, column: 9)
!105 = distinct !DILexicalBlock(scope: !98, file: !8, line: 71, column: 5)
!106 = !DILocation(line: 73, column: 24, scope: !104)
!107 = !DILocation(line: 73, column: 53, scope: !104)
!108 = !DILocation(line: 73, column: 41, scope: !104)
!109 = !DILocation(line: 74, column: 17, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !8, line: 74, column: 17)
!111 = !DILocation(line: 74, column: 32, scope: !110)
!112 = !DILocation(line: 74, column: 17, scope: !104)
!113 = !DILocation(line: 74, column: 42, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !8, line: 74, column: 41)
!115 = !DILocation(line: 75, column: 13, scope: !104)
!116 = !DILocation(line: 75, column: 29, scope: !104)
!117 = !DILocation(line: 75, column: 40, scope: !104)
!118 = !DILocation(line: 77, column: 35, scope: !104)
!119 = !DILocation(line: 77, column: 51, scope: !104)
!120 = !DILocation(line: 77, column: 24, scope: !104)
!121 = !DILocation(line: 77, column: 13, scope: !104)
!122 = !DILocation(line: 79, column: 21, scope: !104)
!123 = !DILocation(line: 79, column: 37, scope: !104)
!124 = !DILocation(line: 79, column: 13, scope: !104)
!125 = !DILocation(line: 80, column: 13, scope: !104)
!126 = !DILocation(line: 80, column: 29, scope: !104)
!127 = !DILocation(line: 80, column: 94, scope: !104)
!128 = !DILocation(line: 81, column: 35, scope: !104)
!129 = !DILocation(line: 81, column: 51, scope: !104)
!130 = !DILocation(line: 81, column: 13, scope: !104)
!131 = !DILocation(line: 82, column: 35, scope: !104)
!132 = !DILocation(line: 82, column: 51, scope: !104)
!133 = !DILocation(line: 82, column: 24, scope: !104)
!134 = !DILocation(line: 82, column: 13, scope: !104)
!135 = !DILocation(line: 85, column: 1, scope: !96)
!136 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 88, type: !33, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!137 = !DILocation(line: 90, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !136, file: !8, line: 90, column: 8)
!139 = !DILocation(line: 90, column: 8, scope: !136)
!140 = !DILocalVariable(name: "structCharVoid", scope: !141, file: !8, line: 93, type: !6)
!141 = distinct !DILexicalBlock(scope: !142, file: !8, line: 92, column: 9)
!142 = distinct !DILexicalBlock(scope: !138, file: !8, line: 91, column: 5)
!143 = !DILocation(line: 93, column: 24, scope: !141)
!144 = !DILocation(line: 93, column: 53, scope: !141)
!145 = !DILocation(line: 93, column: 41, scope: !141)
!146 = !DILocation(line: 94, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !8, line: 94, column: 17)
!148 = !DILocation(line: 94, column: 32, scope: !147)
!149 = !DILocation(line: 94, column: 17, scope: !141)
!150 = !DILocation(line: 94, column: 42, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !8, line: 94, column: 41)
!152 = !DILocation(line: 95, column: 13, scope: !141)
!153 = !DILocation(line: 95, column: 29, scope: !141)
!154 = !DILocation(line: 95, column: 40, scope: !141)
!155 = !DILocation(line: 97, column: 35, scope: !141)
!156 = !DILocation(line: 97, column: 51, scope: !141)
!157 = !DILocation(line: 97, column: 24, scope: !141)
!158 = !DILocation(line: 97, column: 13, scope: !141)
!159 = !DILocation(line: 99, column: 21, scope: !141)
!160 = !DILocation(line: 99, column: 37, scope: !141)
!161 = !DILocation(line: 99, column: 13, scope: !141)
!162 = !DILocation(line: 100, column: 13, scope: !141)
!163 = !DILocation(line: 100, column: 29, scope: !141)
!164 = !DILocation(line: 100, column: 94, scope: !141)
!165 = !DILocation(line: 101, column: 35, scope: !141)
!166 = !DILocation(line: 101, column: 51, scope: !141)
!167 = !DILocation(line: 101, column: 13, scope: !141)
!168 = !DILocation(line: 102, column: 35, scope: !141)
!169 = !DILocation(line: 102, column: 51, scope: !141)
!170 = !DILocation(line: 102, column: 24, scope: !141)
!171 = !DILocation(line: 102, column: 13, scope: !141)
!172 = !DILocation(line: 104, column: 5, scope: !142)
!173 = !DILocation(line: 105, column: 1, scope: !136)
