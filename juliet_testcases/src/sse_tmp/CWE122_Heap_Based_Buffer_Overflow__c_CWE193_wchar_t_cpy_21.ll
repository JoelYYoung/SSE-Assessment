; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_21_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !13
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_21_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  store i32 1, i32* @badStatic, align 4, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @badSource(i32* %0), !dbg !32
  store i32* %call, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_21_bad.source to i8*), i64 44, i1 false), !dbg !39
  %2 = load i32*, i32** %data, align 8, !dbg !40
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !41
  %call1 = call i32* @wcscpy(i32* %2, i32* %arraydecay) #6, !dbg !42
  %3 = load i32*, i32** %data, align 8, !dbg !43
  call void @printWLine(i32* %3), !dbg !44
  %4 = load i32*, i32** %data, align 8, !dbg !45
  %5 = bitcast i32* %4 to i8*, !dbg !45
  call void @free(i8* %5) #6, !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !48 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i32, i32* @badStatic, align 4, !dbg !53
  %tobool = icmp ne i32 %0, 0, !dbg !53
  br i1 %tobool, label %if.then, label %if.end2, !dbg !55

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 40) #6, !dbg !56
  %1 = bitcast i8* %call to i32*, !dbg !58
  store i32* %1, i32** %data.addr, align 8, !dbg !59
  %2 = load i32*, i32** %data.addr, align 8, !dbg !60
  %cmp = icmp eq i32* %2, null, !dbg !62
  br i1 %cmp, label %if.then1, label %if.end, !dbg !63

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !64
  unreachable, !dbg !64

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !66

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !67
  ret i32* %3, !dbg !68
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_21_good() #0 !dbg !69 {
entry:
  call void @goodG2B1(), !dbg !70
  call void @goodG2B2(), !dbg !71
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_21_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_21_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i32* null, i32** %data, align 8, !dbg !96
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !97
  %0 = load i32*, i32** %data, align 8, !dbg !98
  %call = call i32* @goodG2B1Source(i32* %0), !dbg !99
  store i32* %call, i32** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !103
  %2 = load i32*, i32** %data, align 8, !dbg !104
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !105
  %call1 = call i32* @wcscpy(i32* %2, i32* %arraydecay) #6, !dbg !106
  %3 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %3), !dbg !108
  %4 = load i32*, i32** %data, align 8, !dbg !109
  %5 = bitcast i32* %4 to i8*, !dbg !109
  call void @free(i8* %5) #6, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !112 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !115
  %tobool = icmp ne i32 %0, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  br label %if.end2, !dbg !120

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !121
  %1 = bitcast i8* %call to i32*, !dbg !123
  store i32* %1, i32** %data.addr, align 8, !dbg !124
  %2 = load i32*, i32** %data.addr, align 8, !dbg !125
  %cmp = icmp eq i32* %2, null, !dbg !127
  br i1 %cmp, label %if.then1, label %if.end, !dbg !128

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !131
  ret i32* %3, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !134, metadata !DIExpression()), !dbg !135
  store i32* null, i32** %data, align 8, !dbg !136
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !137
  %0 = load i32*, i32** %data, align 8, !dbg !138
  %call = call i32* @goodG2B2Source(i32* %0), !dbg !139
  store i32* %call, i32** %data, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !141, metadata !DIExpression()), !dbg !143
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !143
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !143
  %2 = load i32*, i32** %data, align 8, !dbg !144
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !145
  %call1 = call i32* @wcscpy(i32* %2, i32* %arraydecay) #6, !dbg !146
  %3 = load i32*, i32** %data, align 8, !dbg !147
  call void @printWLine(i32* %3), !dbg !148
  %4 = load i32*, i32** %data, align 8, !dbg !149
  %5 = bitcast i32* %4 to i8*, !dbg !149
  call void @free(i8* %5) #6, !dbg !150
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !152 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !153, metadata !DIExpression()), !dbg !154
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !155
  %tobool = icmp ne i32 %0, 0, !dbg !155
  br i1 %tobool, label %if.then, label %if.end2, !dbg !157

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 44) #6, !dbg !158
  %1 = bitcast i8* %call to i32*, !dbg !160
  store i32* %1, i32** %data.addr, align 8, !dbg !161
  %2 = load i32*, i32** %data.addr, align 8, !dbg !162
  %cmp = icmp eq i32* %2, null, !dbg !164
  br i1 %cmp, label %if.then1, label %if.end, !dbg !165

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !166
  unreachable, !dbg !166

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !168

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !169
  ret i32* %3, !dbg !170
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 29, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !11}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 62, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 63, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_21_bad", scope: !15, file: !15, line: 42, type: !25, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !15, line: 44, type: !7)
!28 = !DILocation(line: 44, column: 15, scope: !24)
!29 = !DILocation(line: 45, column: 10, scope: !24)
!30 = !DILocation(line: 46, column: 15, scope: !24)
!31 = !DILocation(line: 47, column: 22, scope: !24)
!32 = !DILocation(line: 47, column: 12, scope: !24)
!33 = !DILocation(line: 47, column: 10, scope: !24)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 49, type: !36)
!35 = distinct !DILexicalBlock(scope: !24, file: !15, line: 48, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 352, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 49, column: 17, scope: !35)
!40 = !DILocation(line: 51, column: 16, scope: !35)
!41 = !DILocation(line: 51, column: 22, scope: !35)
!42 = !DILocation(line: 51, column: 9, scope: !35)
!43 = !DILocation(line: 52, column: 20, scope: !35)
!44 = !DILocation(line: 52, column: 9, scope: !35)
!45 = !DILocation(line: 53, column: 14, scope: !35)
!46 = !DILocation(line: 53, column: 9, scope: !35)
!47 = !DILocation(line: 55, column: 1, scope: !24)
!48 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 31, type: !49, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DISubroutineType(types: !50)
!50 = !{!7, !7}
!51 = !DILocalVariable(name: "data", arg: 1, scope: !48, file: !15, line: 31, type: !7)
!52 = !DILocation(line: 31, column: 38, scope: !48)
!53 = !DILocation(line: 33, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !15, line: 33, column: 8)
!55 = !DILocation(line: 33, column: 8, scope: !48)
!56 = !DILocation(line: 36, column: 27, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !15, line: 34, column: 5)
!58 = !DILocation(line: 36, column: 16, scope: !57)
!59 = !DILocation(line: 36, column: 14, scope: !57)
!60 = !DILocation(line: 37, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !15, line: 37, column: 13)
!62 = !DILocation(line: 37, column: 18, scope: !61)
!63 = !DILocation(line: 37, column: 13, scope: !57)
!64 = !DILocation(line: 37, column: 28, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !15, line: 37, column: 27)
!66 = !DILocation(line: 38, column: 5, scope: !57)
!67 = !DILocation(line: 39, column: 12, scope: !48)
!68 = !DILocation(line: 39, column: 5, scope: !48)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_21_good", scope: !15, file: !15, line: 124, type: !25, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DILocation(line: 126, column: 5, scope: !69)
!71 = !DILocation(line: 127, column: 5, scope: !69)
!72 = !DILocation(line: 128, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 140, type: !74, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DISubroutineType(types: !75)
!75 = !{!10, !10, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !15, line: 140, type: !10)
!80 = !DILocation(line: 140, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !15, line: 140, type: !76)
!82 = !DILocation(line: 140, column: 27, scope: !73)
!83 = !DILocation(line: 143, column: 22, scope: !73)
!84 = !DILocation(line: 143, column: 12, scope: !73)
!85 = !DILocation(line: 143, column: 5, scope: !73)
!86 = !DILocation(line: 145, column: 5, scope: !73)
!87 = !DILocation(line: 146, column: 5, scope: !73)
!88 = !DILocation(line: 147, column: 5, scope: !73)
!89 = !DILocation(line: 150, column: 5, scope: !73)
!90 = !DILocation(line: 151, column: 5, scope: !73)
!91 = !DILocation(line: 152, column: 5, scope: !73)
!92 = !DILocation(line: 154, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 82, type: !25, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DILocalVariable(name: "data", scope: !93, file: !15, line: 84, type: !7)
!95 = !DILocation(line: 84, column: 15, scope: !93)
!96 = !DILocation(line: 85, column: 10, scope: !93)
!97 = !DILocation(line: 86, column: 20, scope: !93)
!98 = !DILocation(line: 87, column: 27, scope: !93)
!99 = !DILocation(line: 87, column: 12, scope: !93)
!100 = !DILocation(line: 87, column: 10, scope: !93)
!101 = !DILocalVariable(name: "source", scope: !102, file: !15, line: 89, type: !36)
!102 = distinct !DILexicalBlock(scope: !93, file: !15, line: 88, column: 5)
!103 = !DILocation(line: 89, column: 17, scope: !102)
!104 = !DILocation(line: 91, column: 16, scope: !102)
!105 = !DILocation(line: 91, column: 22, scope: !102)
!106 = !DILocation(line: 91, column: 9, scope: !102)
!107 = !DILocation(line: 92, column: 20, scope: !102)
!108 = !DILocation(line: 92, column: 9, scope: !102)
!109 = !DILocation(line: 93, column: 14, scope: !102)
!110 = !DILocation(line: 93, column: 9, scope: !102)
!111 = !DILocation(line: 95, column: 1, scope: !93)
!112 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 66, type: !49, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", arg: 1, scope: !112, file: !15, line: 66, type: !7)
!114 = !DILocation(line: 66, column: 43, scope: !112)
!115 = !DILocation(line: 68, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !15, line: 68, column: 8)
!117 = !DILocation(line: 68, column: 8, scope: !112)
!118 = !DILocation(line: 71, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !15, line: 69, column: 5)
!120 = !DILocation(line: 72, column: 5, scope: !119)
!121 = !DILocation(line: 76, column: 27, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !15, line: 74, column: 5)
!123 = !DILocation(line: 76, column: 16, scope: !122)
!124 = !DILocation(line: 76, column: 14, scope: !122)
!125 = !DILocation(line: 77, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !15, line: 77, column: 13)
!127 = !DILocation(line: 77, column: 18, scope: !126)
!128 = !DILocation(line: 77, column: 13, scope: !122)
!129 = !DILocation(line: 77, column: 28, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !15, line: 77, column: 27)
!131 = !DILocation(line: 79, column: 12, scope: !112)
!132 = !DILocation(line: 79, column: 5, scope: !112)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 109, type: !25, scopeLine: 110, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!134 = !DILocalVariable(name: "data", scope: !133, file: !15, line: 111, type: !7)
!135 = !DILocation(line: 111, column: 15, scope: !133)
!136 = !DILocation(line: 112, column: 10, scope: !133)
!137 = !DILocation(line: 113, column: 20, scope: !133)
!138 = !DILocation(line: 114, column: 27, scope: !133)
!139 = !DILocation(line: 114, column: 12, scope: !133)
!140 = !DILocation(line: 114, column: 10, scope: !133)
!141 = !DILocalVariable(name: "source", scope: !142, file: !15, line: 116, type: !36)
!142 = distinct !DILexicalBlock(scope: !133, file: !15, line: 115, column: 5)
!143 = !DILocation(line: 116, column: 17, scope: !142)
!144 = !DILocation(line: 118, column: 16, scope: !142)
!145 = !DILocation(line: 118, column: 22, scope: !142)
!146 = !DILocation(line: 118, column: 9, scope: !142)
!147 = !DILocation(line: 119, column: 20, scope: !142)
!148 = !DILocation(line: 119, column: 9, scope: !142)
!149 = !DILocation(line: 120, column: 14, scope: !142)
!150 = !DILocation(line: 120, column: 9, scope: !142)
!151 = !DILocation(line: 122, column: 1, scope: !133)
!152 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 98, type: !49, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!153 = !DILocalVariable(name: "data", arg: 1, scope: !152, file: !15, line: 98, type: !7)
!154 = !DILocation(line: 98, column: 43, scope: !152)
!155 = !DILocation(line: 100, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !15, line: 100, column: 8)
!157 = !DILocation(line: 100, column: 8, scope: !152)
!158 = !DILocation(line: 103, column: 27, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !15, line: 101, column: 5)
!160 = !DILocation(line: 103, column: 16, scope: !159)
!161 = !DILocation(line: 103, column: 14, scope: !159)
!162 = !DILocation(line: 104, column: 13, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !15, line: 104, column: 13)
!164 = !DILocation(line: 104, column: 18, scope: !163)
!165 = !DILocation(line: 104, column: 13, scope: !159)
!166 = !DILocation(line: 104, column: 28, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !15, line: 104, column: 27)
!168 = !DILocation(line: 105, column: 5, scope: !159)
!169 = !DILocation(line: 106, column: 12, scope: !152)
!170 = !DILocation(line: 106, column: 5, scope: !152)
